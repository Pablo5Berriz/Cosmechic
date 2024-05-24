using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Cosmechic.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Authorization;

namespace Cosmechic.Controllers
{
    [Authorize]
    public class OrderHeadersController : Controller
    {
        private readonly CosmechicsContext _context;
        private readonly UserManager<IdentityUser> _userManager;

        public OrderHeadersController(CosmechicsContext context, UserManager<IdentityUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        // GET: OrderHeaders
        public async Task<IActionResult> Index()
        {
            if (User.IsInRole("Admin"))
            {
                var allOrders = await _context.OrderHeaders.Include(o => o.ApplicationUser).ToListAsync();
                return View(allOrders);
            }
            else
            {
                var userId = _userManager.GetUserId(User);
                var userOrders = await _context.OrderHeaders
                    .Where(o => o.ApplicationUserId == userId)
                    .Include(o => o.ApplicationUser)
                    .ToListAsync();
                return View(userOrders);
            }
        }


        // GET: OrderHeaders/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.OrderHeaders == null)
            {
                return NotFound();
            }

            var orderHeader = await _context.OrderHeaders
                .Include(o => o.ApplicationUser)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (orderHeader == null)
            {
                return NotFound();
            }

            return View(orderHeader);
        }

        // GET: OrderHeaders/Create
        public IActionResult Create()
        {
            ViewData["ApplicationUserId"] = new SelectList(_context.AspNetUsers, "Id", "Id");
            return View();
        }

        // POST: OrderHeaders/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,ApplicationUserId,OrderDate,ShippingDate,OrderTotal,OrderStatus,PaymentStatus,TrackingNumber,Carrier,PaymentDate,PaymentDueDate,SessionId,PaymentIntentId,PhoneNumber,StreetAddress,City,State,PostalCode,Name")] OrderHeader orderHeader)
        {
            if (ModelState.IsValid)
            {
                _context.Add(orderHeader);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["ApplicationUserId"] = new SelectList(_context.AspNetUsers, "Id", "Id", orderHeader.ApplicationUserId);
            return View(orderHeader);
        }

        // GET: OrderHeaders/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.OrderHeaders == null)
            {
                return NotFound();
            }

            var orderHeader = await _context.OrderHeaders.FindAsync(id);
            if (orderHeader == null)
            {
                return NotFound();
            }
            ViewData["ApplicationUserId"] = new SelectList(_context.AspNetUsers, "Id", "Id", orderHeader.ApplicationUserId);
            return View(orderHeader);
        }

        // POST: OrderHeaders/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,ApplicationUserId,OrderDate,ShippingDate,OrderTotal,OrderStatus,PaymentStatus,TrackingNumber,Carrier,PaymentDate,PaymentDueDate,SessionId,PaymentIntentId,PhoneNumber,StreetAddress,City,State,PostalCode,Name")] OrderHeader orderHeader)
        {
            if (id != orderHeader.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(orderHeader);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!OrderHeaderExists(orderHeader.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["ApplicationUserId"] = new SelectList(_context.AspNetUsers, "Id", "Id", orderHeader.ApplicationUserId);
            return View(orderHeader);
        }

        // GET: OrderHeaders/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.OrderHeaders == null)
            {
                return NotFound();
            }

            var orderHeader = await _context.OrderHeaders
                .Include(o => o.ApplicationUser)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (orderHeader == null)
            {
                return NotFound();
            }

            return View(orderHeader);
        }

        // POST: OrderHeaders/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.OrderHeaders == null)
            {
                return Problem("Entity set 'CosmechicsContext.OrderHeaders'  is null.");
            }
            var orderHeader = await _context.OrderHeaders.FindAsync(id);
            if (orderHeader != null)
            {
                _context.OrderHeaders.Remove(orderHeader);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool OrderHeaderExists(int id)
        {
            return (_context.OrderHeaders?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
