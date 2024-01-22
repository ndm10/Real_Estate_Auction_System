using Microsoft.AspNetCore.Mvc;

namespace RealEstateAuction.Controllers
{
    public class AuthenticationController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
