using Microsoft.EntityFrameworkCore;
using RealEstateAuction.DataModel;
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

        public List<Auction> GetAuctionByUserId(int userId, Pagination pagination)
        {
            return context.Auctions.Where(a => a.UserId == userId && a.DeleteFlag == false)
                                    .Include(a => a.Images)
                                    .Skip((pagination.PageNumber - 1) * pagination.RecordPerPage)
                                    .Take(pagination.RecordPerPage)
                                    .ToList();
        }

        public int CountAuctionByUserId(int userId)
        {
            return context.Auctions.Where(a => a.DeleteFlag == false).Count();
        }

        public bool DeleteAuction(Auction auction)
        {
            try
            {
                auction.DeleteFlag = true;
                EditAuction(auction);
                return true;
            }
            catch(Exception)
            {
                return false;
            }
        }
    }
}
