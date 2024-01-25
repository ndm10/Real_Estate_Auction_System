using Microsoft.AspNetCore.Authentication.Google;
using Microsoft.AspNetCore.Identity;
using RealEstateAuction.Models;

var builder = WebApplication.CreateBuilder(args);
builder.Services.Configure<GoogleConfig>(builder.Configuration.GetSection("GoogleApi"));
var gc = builder.Configuration.GetSection("GoogleApi").Get<GoogleConfig>();


// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddAuthentication(options =>
{
    options.DefaultScheme = IdentityConstants.ApplicationScheme;
    options.DefaultSignInScheme = IdentityConstants.ApplicationScheme;
    options.DefaultChallengeScheme = GoogleDefaults.AuthenticationScheme;
})
.AddCookie(IdentityConstants.ApplicationScheme, options =>
{
    options.LoginPath = "/User/Login";
    options.AccessDeniedPath = "/User/AccessDenied";
})
.AddCookie(IdentityConstants.ExternalScheme)
.AddGoogle(
    options =>
    {
        options.ClientId= gc.ClientId;
        options.ClientSecret = gc.SecretKey;
        options.Scope.Add("openid");
        options.Scope.Add("profile");
        options.Scope.Add("email");
    });

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
