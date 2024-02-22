﻿using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using RealEstateAuction.DAL;
using RealEstateAuction.DataModel;
using RealEstateAuction.Enums;
using RealEstateAuction.Models;
using System.Security.Claims;

namespace RealEstateAuction.Controllers
{
    public class StaffController : Controller
    {
        PaymentDAO paymentDAO = new PaymentDAO();
        TicketDAO ticketDAO = new TicketDAO();
        private Pagination pagination;
        private readonly AuctionDAO auctionDAO;

        public StaffController()
        {
            auctionDAO = new AuctionDAO();
            pagination = new Pagination();
        }

        [Authorize(Roles = "Staff")]
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [Authorize(Roles = "Staff")]
        [HttpGet("/list-payment")]
        public IActionResult ListPayment(int? page)
        {
            int PageNumber = (page ?? 1);
            var list = paymentDAO.list(PageNumber);
            return View(list);
        }

        [Authorize(Roles = "Staff")]
        [HttpPost("/list-payment/update")]
        public IActionResult UpdatePayment()
        {
            try
            {
                var payment = paymentDAO.getPayment(Int32.Parse(Request.Form["id"].ToString()));
                if (payment != null && payment.Status == (int) PaymentStatus.Pending)
                {
                    payment.Status = Byte.Parse(Request.Form["status"].ToString());
                    paymentDAO.update(payment);
                    TempData["Message"] = "Cập nhật thành công";
                }
                else
                {
                    TempData["Message"] = "Thanh toán không tồn tại";
                }
            } catch (Exception ex)
            {
                TempData["Message"] = "Lỗi hệ thống, vui lòng thử lại";
            }
            
            return RedirectToAction("ListPayment");
        }

        [Authorize(Roles = "Staff")]
        [HttpGet("/list-ticket")]
        public IActionResult ListTicket(int? page)
        {
            int PageNumber = (page ?? 1);
            var list = ticketDAO.listTicket(PageNumber);
            return View(list);
        }

        [Authorize(Roles = "Staff")]
        [HttpGet("list-ticket/{id}")]
        public IActionResult TicketDetail(int id)
        {
            var ticket = ticketDAO.ticketDetail(id);
            if (ticket == null)
            {
                TempData["Message"] = "Ticket Not Found";
                return RedirectToAction("listTicket");
            }
            return View(ticket);
        }

        [Authorize(Roles = "Staff")]
        [HttpPost]
        [Route("list-ticket/{id}reply")]
        public IActionResult reply(Ticket ticket, int id)
        {
            return View();
        }

        [Authorize(Roles = "Staff")]
        [HttpGet]
        [Route("list-auction-staff")]
        public IActionResult ListAuction(int? pageNumber)
        {
            //check user login or not
            if (!User.Identity.IsAuthenticated)
            {
                TempData["Message"] = "Vui lòng đăng nhập để quản lý đấu giá!";
                return RedirectToAction("Index", "Home");
            }

            //get current user id
            int userId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier));

            if (pageNumber.HasValue)
            {
                pagination.PageNumber = pageNumber.Value;
            }

            //get auction by staff id
            List<Auction> auctions = auctionDAO.GetAuctionByStaffId(userId, pagination);

            int auctionCount = auctionDAO.CountAuctionByStaffId(userId);
            int pageSize = (int)Math.Ceiling((double)auctionCount / pagination.RecordPerPage);

            ViewBag.currentPage = pagination.PageNumber;
            ViewBag.pageSize = pageSize;

            return View(auctions);
        }

        [Authorize(Roles = "Staff")]
        [HttpGet]
        [Route("details-auction")]
        public IActionResult DetailsAuction(int auctionId)
        {
            //check user login or not
            if (!User.Identity.IsAuthenticated)
            {
                TempData["Message"] = "Vui lòng đăng nhập để quản lý đấu giá!";
                return RedirectToAction("Index", "Home");
            }

            //get current user id
            int userId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier));

            //get auction by Id
            Auction auction = auctionDAO.GetAuctionStaffById(auctionId);

            //check if staff manage this auction or not
            if (auction.ApproverId == userId)
            {
                return View(auction);
            }
            else
            {
                TempData["Message"] = "Bạn không thể quản lý phiên đấu giá này";
                return Redirect("list-auction-staff");
            }
        }

        [Authorize(Roles = "Staff")]
        [HttpGet]
        [Route("approve-auction")]
        public IActionResult ListAuction(int auctionId, int status)
        {
            //check user login or not
            if (!User.Identity.IsAuthenticated)
            {
                TempData["Message"] = "Vui lòng đăng nhập để quản lý đấu giá!";
                return RedirectToAction("Index", "Home");
            }

            //get current user id
            int userId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier));

            //get auction by Id
            Auction auction = auctionDAO.GetAuctionStaffById(auctionId);

            //check if staff manage this auction or not
            if (auction.ApproverId == userId)
            {
                auction.Status = Byte.Parse(status.ToString());
                bool flag = auctionDAO.EditAuction(auction);
                if (flag)
                {
                    TempData["Message"] = "Phê duyệt thành công!";
                }
                else
                {
                    TempData["Message"] = "Phê duyệt thất b";
                }
            }
            else
            {
                TempData["Message"] = "Bạn không thể quản lý phiên đấu giá này";
            }

            return Redirect("list-auction-staff");
        }
    }
}
