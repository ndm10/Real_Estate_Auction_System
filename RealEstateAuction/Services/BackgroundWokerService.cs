
using Microsoft.Extensions.Logging;
using RealEstateAuction.DAL;
using RealEstateAuction.Models;

namespace RealEstateAuction.Services
{
    public class BackgroundWokerService : BackgroundService
    {
        private readonly TimerService _timerService;
        private ILogger logger;
        private ILogger logger2;
        private readonly AuctionDAO auctionDAO;

        public BackgroundWokerService(ILogger<TimerService> logger, ILogger<BackgroundService> logger2)
        {
            this.logger = logger;
            this.logger2 = logger2;
            _timerService = new TimerService(logger);
            auctionDAO = new AuctionDAO();
        }

        protected async override Task ExecuteAsync(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {
                // End the auctions that are ending in 1 hour
                Task endAuctionsTask = Task.Run(() =>
                {
                    List<Auction> ending = auctionDAO.GetAuctionsEndingIn1Minute();
                    //Change status of auction to ended that incomming in 1 minutes
                    _timerService.EndAuction(ending);
                });

                //Wait for 1 hour to repeat the process
                await Task.Delay(TimeSpan.FromMinutes(1), stoppingToken);
            }
        }
    }
}
