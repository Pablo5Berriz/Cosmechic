namespace Cosmechic.Models.ViewModels
{
    public class ShoppingCartVM
    {
        public IEnumerable<ShoppingCart> ShoppingCartList { get; set; }
        public OrderHeader OrderHeader { get; set; }

		public double TPS { get; set; }
		public double TVQ { get; set; }
		public double ShippingCost { get; set; }
	}
}
