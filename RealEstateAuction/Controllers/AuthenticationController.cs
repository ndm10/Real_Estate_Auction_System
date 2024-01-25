using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Diagnostics;
using RealEstateAuction.DAL;
using RealEstateAuction.Models;
using System.Security.Claims;

namespace RealEstateAuction.Controllers
{
    public class AuthenticationController : Controller
    {
        UserDAO userDAO = new UserDAO();
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [Route("Login")]
        public async Task<IActionResult> Login()
        {
            string email = Request.Form["email"];
            string password = Request.Form["pwd"];

            var user = userDAO.GetUserByEmailAndPassword(email, password);

            Console.WriteLine(user);
            if (user != null)
            {
                List<Claim> claims = new List<Claim>() {
                    new Claim(ClaimTypes.NameIdentifier, user.Id.ToString()),
                    new Claim("FullName", user.FullName),
                    new Claim("Email", user.Email),
                    new Claim("Phone", user.Phone),
                    new Claim("Dob", user.Dob.ToString()),
                    new Claim("Address", user.Address),
                    new Claim("Avatar", user.Avatar==null?"":"oke"),
                    new Claim("RoleId", user.RoleId.ToString()),
                    new Claim("Description", user.Description==null?"":"oke"),
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
                                                          new ClaimsPrincipal(claimsIdentity), properties);

                TempData["Message"] = "Login successful!";
                return Redirect("home");
            }
            else
            {
                TempData["Message"] = "Login fail!";
                return Redirect("home");
            }
        }

        [HttpPost("Register")]
        public IActionResult Register()
        {
            string fullName = Request.Form["fullName"];
            string email = Request.Form["email"];
            string pwd = Request.Form["pwd"];
            string phone = Request.Form["phone"];
            string date = Request.Form["dob"];
            string address = Request.Form["address"];

            User user = new User()
            {
                FullName = fullName,
                Email = email,
                Password = pwd,
                Phone = phone,
                Dob = DateTime.Parse(date),
                Address = address,
                //set role id of member is 3
                RoleId = 3,
                Wallet = 0
            };

            var exist = userDAO.GetUserByEmail(email);
            if (exist != null)
            {
                TempData["Message"] = "Email already exists!";
                ViewBag.User = user;
            }
            else
            {
                var result = userDAO.AddUser(user);
                if(result)
                {
                    TempData["Message"] = "Register successful!";
                }
                else
                {
                    TempData["Message"] = "Register fail!";
                }
            }

            return Redirect("home");
        }

        [Route("Logout")]
        public IActionResult Logout()
        {
            HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return Redirect("home");
        }
    }
}
