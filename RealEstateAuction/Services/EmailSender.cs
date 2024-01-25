using System.Net;
using System.Net.Mail;

namespace RealEstateAuction.Services
{
    public class EmailSender : IEmailSender
    {
        public Task SendEmailAsync(String email, String subject, String message)
        {
            var mail = "ndminh1010@gmail.com";
            var pw = "tgjusrbiaiihcrty";

            var client = new SmtpClient("smtp.gmail.com", 587)
            {
                Credentials = new NetworkCredential(mail, pw),
                EnableSsl = true
            };

            return client.SendMailAsync(
                               new MailMessage(
                                   from: mail,
                                   to: email,
                                   subject,
                                   message
                                   ));
        }
    }
}
