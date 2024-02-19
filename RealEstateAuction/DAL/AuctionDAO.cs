using Microsoft.EntityFrameworkCore;
using RealEstateAuction.Models;

namespace RealEstateAuction.DAL
{
    public class AuctionDAO
    {
        private readonly RealEstateContext context;
        public AuctionDAO()
        {
            context = new RealEstateContext();
        }
        public bool AddAuction(Auction auction)
        {
            try
            {
                context.Auctions.Add(auction);
                context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool EditAuction(Auction auction)
        {
            try
            {
                context.Auctions.Update(auction);
                context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public Auction GetAuctionById(int id)
        {
            return context.Auctions.Include(a => a.Images).FirstOrDefault(a => a.Id == id);
        }
    }
}
