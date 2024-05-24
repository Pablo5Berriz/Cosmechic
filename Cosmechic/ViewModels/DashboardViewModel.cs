namespace Cosmechic.ViewModels
{
    public class DashboardViewModel
    {
        public decimal MonthlyEarnings { get; set; }
        public decimal AnnualEarnings { get; set; }
        public double TaskCompletionRate { get; set; }
        public int NewUsersCount { get; set; }
        public int ActiveUsersCount { get; set; }
        public int PendingRequests { get; set; }
        public decimal TotalSales { get; set; }
        public List<decimal> RevenueData { get; set; }
        public List<ProductSalesInfo> TopSellingProducts { get; set; }
        public List<CategoryPopularityInfo> PopularCategories { get; set; }

        public decimal TotalRevenue { get; set; }
        public int TotalOrders { get; set; }
        public int TotalClients { get; set; }

        public DashboardViewModel()
        {
            RevenueData = new List<decimal>();
            TopSellingProducts = new List<ProductSalesInfo>();
            PopularCategories = new List<CategoryPopularityInfo>();
        }
    }

    public class ProductSalesInfo
    {
        public string ProductName { get; set; }
        public int QuantitySold { get; set; }
        public decimal TotalRevenue { get; set; }
    }

    public class CategoryPopularityInfo
    {
        public string CategoryName { get; set; }
        public int NumberOfSales { get; set; }
    }
}
