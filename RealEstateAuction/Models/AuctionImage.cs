using System;
using System.Collections.Generic;

namespace RealEstateAuction.Models;

public partial class AuctionImage
{
    public int AuctionId { get; set; }

    public int ImageUrl { get; set; }

    public virtual Auction Auction { get; set; } = null!;
}
