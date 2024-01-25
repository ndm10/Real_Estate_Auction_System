using Microsoft.AspNetCore.Mvc;
using RealEstateAuction.Models;

namespace RealEstateAuction.Controllers
{
    public class AuthenticationController : Controller
    {
        RealEstateContext context = new RealEstateContext();
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Login(FormCollection form)
        {
            var email = form["email"];
            var password = form["pwd"];

            var account = context.Users.SingleOrDefault(a => a.Email.Equals(email) && a.Password.Equals(password));
            if (account != null)
            {
                //save account to session if login success
                return View("Index");
            }
            else
            {
                ViewBag.error = "Login failed";
                return View("Index");
            }

            return View();
        }

        public IActionResult Register()
        {
            return View();
        }
    }
}
