﻿using System;
using System.Collections.Generic;

namespace RealEstateAuction.Models;

public partial class Auction
{
    public int Id { get; set; }

    public string Title { get; set; } = null!;

    public decimal StartPrice { get; set; }

    public decimal EndPrice { get; set; }

    public double Area { get; set; }

    public string Address { get; set; } = null!;

    public double Facade { get; set; }

    public string Drirection { get; set; } = null!;

    public string Description { get; set; } = null!;

    public int UserId { get; set; }

    public int? ApproverId { get; set; }

    public byte Status { get; set; }

    public bool DeleteFlag { get; set; }

    public DateTime StartTime { get; set; }

    public DateTime EndTime { get; set; }

    public DateTime CreatedTime { get; set; }

    public DateTime? UpdatedTime { get; set; }

    public virtual User? Approver { get; set; }

    public virtual ICollection<AuctionParticipant> AuctionParticipants { get; set; } = new List<AuctionParticipant>();

    public virtual User User { get; set; } = null!;

    public virtual ICollection<Category> Categories { get; set; } = new List<Category>();
}
