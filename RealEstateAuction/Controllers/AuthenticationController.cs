using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Diagnostics;
using RealEstateAuction.Models;
using System.Security.Claims;

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
        public async Task<IActionResult> Login(FormCollection form)
        {
            var email = form["email"];
            var password = form["pwd"];

            var user = context.Users.SingleOrDefault(u => u.Email.Equals(email) && u.Password.Equals(password));
            if (user != null)
            {
                List<Claim> claims = new List<Claim>() {
                    new Claim(ClaimTypes.NameIdentifier, user.Id.ToString()),
                    new Claim("FullName", user.FullName),
                    new Claim("Email", user.Email),
                    new Claim("Phone", user.Phone),
                    new Claim("Dob", user.Dob.ToString()),
                    new Claim("Address", user.Address),
                    new Claim("Avatar", user.Avatar),
                    new Claim("RoleId", user.RoleId.ToString()),
                    new Claim("Description", user.Description),
                };

                ClaimsIdentity claimsIdentity = 
                    new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);


                AuthenticationProperties properties = new AuthenticationProperties
                {
                    AllowRefresh = true,
                    /*ExpiresUtc = System.DateTimeOffset.UtcNow.AddMinutes(20),*/

                    //Keep login
                    /*IsPersistent = true,*/
                };

                await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme,
                                                          new ClaimsPrincipal(claimsIdentity),properties);

                TempData["Message"] = "Login successful!";
                return Redirect("home");
            }
            else
            {
                TempData["Message"] = "Login fail!";
                return Redirect("home");
            }
        }

        public IActionResult Register()
        {
            return View();
        }
    }
}
