using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Configuration;
using System.Net;

namespace Classes.Common
{
    public class UtilEmail
    {
        static System.Net.Mail.SmtpClient Client
        {
            get
            {
                return new SmtpClient
                {
                    Host = ConfigurationManager.AppSettings.Get("ServidorPadrao"),
                    Port = Convert.ToInt32(ConfigurationManager.AppSettings.Get("port")),
                    EnableSsl = true,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(ConfigurationManager.AppSettings.Get("EmailPadrao"), ConfigurationManager.AppSettings.Get("passwordPadrao"))
                };
            }
        }

        public static async void ErroMail(Exception ex)
        {
            MailMessage mail = new MailMessage(new MailAddress(ConfigurationManager.AppSettings.Get("EmailPadrao")), new MailAddress(ConfigurationManager.AppSettings.Get("ErroEmail")));
            foreach (string item in ConfigurationManager.AppSettings.Get("ErroEmail").Split(';'))
            {
                mail.ReplyToList.Add(new MailAddress(item));
            }
            mail.IsBodyHtml = true;
            mail.Body = "Erro: " + ex.Message + "<br />Inner Exception: " + ex.InnerException + "<br />Source: " + ex.Source;
            await Client.SendMailAsync(mail);
        }
    }
}
