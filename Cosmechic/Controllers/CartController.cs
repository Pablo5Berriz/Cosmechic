using Cosmechic.Models.ViewModels;
using Cosmechic.Models;
using Cosmechic.Utility;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Stripe.Checkout;
using System.Security.Claims;

using Microsoft.EntityFrameworkCore;

namespace Cosmechic.Controllers

{

	[Authorize]

	public class CartController : Controller
	{

		private CosmechicsContext _context;

		[BindProperty]

		public ShoppingCartVM ShoppingCartVM { get; set; }

		public CartController(CosmechicsContext context)

		{

			_context = context;

		}


		public IActionResult Index()

		{

			var claimsIdentity = (ClaimsIdentity)User.Identity;

			var userId = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier).Value;

			ShoppingCartVM = new()

			{

				ShoppingCartList = _context.ShoppingCarts.Where(u => u.ApplicationUserId == userId).Include(x => x.Product),

				OrderHeader = new()

			};

			foreach (var cart in ShoppingCartVM.ShoppingCartList)
			{

				cart.Price = GetPriceBasedOnQuantity(cart);

				ShoppingCartVM.OrderHeader.OrderTotal += (cart.Price * cart.Count);

			}

			return View(ShoppingCartVM);

		}

		public IActionResult Summary()

		{

			var claimsIdentity = (ClaimsIdentity)User.Identity;

			var userId = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier).Value;

			ShoppingCartVM = new()

			{

				ShoppingCartList = _context.ShoppingCarts.Where(u => u.ApplicationUserId == userId).Include(x => x.Product),

				OrderHeader = new()

			};

			ShoppingCartVM.OrderHeader.ApplicationUser = _context.AspNetUsers.Where(u => u.Id == userId).FirstOrDefault();

			ShoppingCartVM.OrderHeader.Name = ShoppingCartVM.OrderHeader.ApplicationUser.UserName;

			ShoppingCartVM.OrderHeader.PhoneNumber = ShoppingCartVM.OrderHeader.ApplicationUser.PhoneNumber;

			foreach (var cart in ShoppingCartVM.ShoppingCartList)

			{
				cart.Price = GetPriceBasedOnQuantity(cart);

				ShoppingCartVM.OrderHeader.OrderTotal += (cart.Price * cart.Count);

			}

			return View(ShoppingCartVM);

		}

		[HttpPost]

		[ActionName("Summary")]

		public IActionResult SummaryPOST()

		{

			var claimsIdentity = (ClaimsIdentity)User.Identity;

			var userId = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier).Value;

			var user = _context.AspNetUsers.FirstOrDefault(u => u.Id == userId);

			if (user != null)

			{

				var shoppingCartVM = new ShoppingCartVM

				{

					OrderHeader = new OrderHeader

					{

						Name = user.UserName,

						PhoneNumber = user.PhoneNumber,

						StreetAddress = user.StreetAddress,

						City = user.City,

						State = user.State,

						PostalCode = user.PostalCode

					}

				};

			}

			ShoppingCartVM.ShoppingCartList = _context.ShoppingCarts.Where(u => u.ApplicationUserId == userId).Include(x => x.Product);

			ShoppingCartVM.OrderHeader.OrderDate = System.DateTime.Now;

			ShoppingCartVM.OrderHeader.ApplicationUserId = userId;

			var applicationUser = _context.AspNetUsers.Where(u => u.Id == userId);


			foreach (var cart in ShoppingCartVM.ShoppingCartList)

			{

				cart.Price = GetPriceBasedOnQuantity(cart);

				ShoppingCartVM.OrderHeader.OrderTotal += (cart.Price * cart.Count);

			}


			ShoppingCartVM.OrderHeader.PaymentStatus = SD.PaymentStatusPending;

			ShoppingCartVM.OrderHeader.OrderStatus = SD.StatusPending;

			_context.OrderHeaders.Add(ShoppingCartVM.OrderHeader);

			_context.SaveChanges();

			foreach (var cart in ShoppingCartVM.ShoppingCartList)

			{

				OrderDetail orderDetail = new()

				{

					ProduitId = cart.ProduitId,

					OrderHeaderId = ShoppingCartVM.OrderHeader.Id,

					Price = cart.Price,

					Count = cart.Count

				};

				_context.OrderDetails.Add(orderDetail);

				_context.SaveChanges();

			}

			//stripe logic

			var domain = Request.Scheme + "://" + Request.Host.Value + "/";

			var options = new SessionCreateOptions

			{

				SuccessUrl = domain + $"cart/OrderConfirmation?id={ShoppingCartVM.OrderHeader.Id}",

				CancelUrl = domain + "cart/index",

				LineItems = new List<SessionLineItemOptions>(),

				Mode = "payment",

			};

			foreach (var item in ShoppingCartVM.ShoppingCartList)

			{

				var sessionLineItem = new SessionLineItemOptions

				{

					PriceData = new SessionLineItemPriceDataOptions

					{

						UnitAmount = (long)(item.Price * 100),

						Currency = "cad",

						ProductData = new SessionLineItemPriceDataProductDataOptions

						{

							Name = item.Product.Nom

						}

					},

					Quantity = item.Count

				};

				options.LineItems.Add(sessionLineItem);

			}


			var service = new SessionService();

			Session session = service.Create(options);

			var orderFromDb = _context.OrderHeaders.FirstOrDefault(u => u.Id == ShoppingCartVM.OrderHeader.Id);

			if (!string.IsNullOrEmpty(session.Id))

			{

				orderFromDb.SessionId = session.Id;

			}

			if (!string.IsNullOrEmpty(session.PaymentIntentId))

			{

				orderFromDb.PaymentIntentId = session.PaymentIntentId;

				orderFromDb.PaymentDate = DateTime.Now;

			}

			_context.SaveChanges();

			Response.Headers.Add("Location", session.Url);

			return new StatusCodeResult(303);

		}


		public IActionResult OrderConfirmation(int id)

		{

			OrderHeader orderHeader = _context.OrderHeaders.Where(u => u.Id == id).FirstOrDefault();

			if (orderHeader.PaymentStatus != SD.PaymentStatusDelayedPayment)

			{

				var service = new SessionService();

				Session session = service.Get(orderHeader.SessionId);

				if (session.PaymentStatus.ToLower() == "paid")

				{

					var orderFromDb = _context.OrderHeaders.FirstOrDefault(u => u.Id == id);

					if (!string.IsNullOrEmpty(session.Id))

					{

						orderFromDb.SessionId = session.Id;

					}

					if (!string.IsNullOrEmpty(session.PaymentIntentId))

					{

						orderFromDb.PaymentIntentId = session.PaymentIntentId;

						orderFromDb.PaymentDate = DateTime.Now;

					}

					var orderFromDbs = _context.OrderHeaders.FirstOrDefault(u => u.Id == id);

					if (orderFromDbs != null)

					{

						orderFromDb.OrderStatus = SD.StatusApproved;

						if (!string.IsNullOrEmpty(SD.PaymentStatusApproved))

						{

							orderFromDb.PaymentStatus = SD.PaymentStatusApproved;

						}

					}

					_context.SaveChanges();

				}

				HttpContext.Session.Clear();

			}


			List<ShoppingCart> shoppingCarts = _context.ShoppingCarts

				.Where(u => u.ApplicationUserId == orderHeader.ApplicationUserId).ToList();

			_context.ShoppingCarts.RemoveRange(shoppingCarts);

			_context.SaveChanges();

			return View(id);

		}


		public IActionResult Plus(int cartId)

		{

			var cartFromDb = _context.ShoppingCarts.Where(u => u.Id == cartId).FirstOrDefault();

			cartFromDb.Count += 1;

			_context.ShoppingCarts.Update(cartFromDb);

			_context.SaveChanges();

			return RedirectToAction(nameof(Index));

		}

		public IActionResult Minus(int cartId)

		{

			var cartFromDb = _context.ShoppingCarts.Where(u => u.Id == cartId).FirstOrDefault();

			if (cartFromDb.Count <= 1)

			{

				_context.ShoppingCarts.Remove(cartFromDb);

				HttpContext.Session.SetInt32(SD.SessionCart, _context.ShoppingCarts

					.Where(u => u.ApplicationUserId == cartFromDb.ApplicationUserId).Count() - 1);

			}

			else

			{

				cartFromDb.Count -= 1;

				_context.ShoppingCarts.Update(cartFromDb);

			}

			_context.SaveChanges();

			return RedirectToAction(nameof(Index));

		}

		public IActionResult Remove(int cartId)

		{

			var cartFromDb = _context.ShoppingCarts.Where(u => u.Id == cartId).FirstOrDefault();

			_context.ShoppingCarts.Remove(cartFromDb);

			HttpContext.Session.SetInt32(SD.SessionCart, _context.ShoppingCarts

			  .Where(u => u.ApplicationUserId == cartFromDb.ApplicationUserId).Count() - 1);

			_context.SaveChanges();

			return RedirectToAction(nameof(Index));

		}

		private double GetPriceBasedOnQuantity(ShoppingCart shoppingCart)

		{

			return Convert.ToInt64(shoppingCart.Product.Prix);

		}

	}

}
