using Google.Apis.Auth.OAuth2;
using Google.Apis.Auth.OAuth2.Flows;
using Google.Apis.Auth.OAuth2.Responses;
using Google.Apis.Gmail.v1;
using Google.Apis.Gmail.v1.Data;
using Google.Apis.Services;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace RealEstateAuction.Controllers
{
    public class UserController : Controller
    {
        // ...
        [HttpGet]
        public IActionResult Login()
        {
            // Hiển thị trang đăng nhập
            return View();
        }

        [HttpGet]
        public IActionResult Details()
        {
            // Hiển thị trang đăng nhập
            return View();
        }

        [HttpPost]
        public IActionResult Login(string returnUrl = "/")
        {
            // Xử lý đăng nhập
            return RedirectToAction("Index", "Home");
        }

        public IActionResult Logout()
        {
            // Xử lý đăng xuất
            return RedirectToAction("Index", "Home");
        }

        [HttpGet]
        public IActionResult ExternalLogin(string provider, string returnUrl = "/")
        {
            var properties = new AuthenticationProperties
            {
                RedirectUri = Url.Action("ExternalLoginCallback", new { returnUrl })
            };

            return Challenge(properties, provider);
        }

        public async Task<IActionResult> ExternalLoginCallback()
        {
            var userInfo = GetUserInfo();
            return View(userInfo);
        }

        private Dictionary<string, string> GetUserInfo()
        {
            var userInfo = new Dictionary<string, string>();

            // Lấy thông tin từ đối tượng ClaimsPrincipal
            var principal = HttpContext.User;
            if (principal != null)
            {
                foreach (var claim in principal.Claims)
                {
                    userInfo[claim.Type] = claim.Value;
                }
            }

            return userInfo;
        }       
    }
}
