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
                    Credentials = new NetworkCredential(ConfigurationManager.AppSettings.Get("smtpLoginPadrao"), ConfigurationManager.AppSettings.Get("passwordPadrao"))
                };
            }
        }

        public static void ErroMail(Exception ex, string obs = "")
        {
            MailMessage mail = new MailMessage(ConfigurationManager.AppSettings.Get("EmailPadrao"), ConfigurationManager.AppSettings.Get("EmailPadrao"))
            {
                Subject = "Erro no autenticador Inclock",
                IsBodyHtml = true,
                Body = "Erro: " + ex.Message + "<br />Inner Exception: " + ex.InnerException + "<br />Source: " + ex.Source + "Stack: " + ex.StackTrace + "<br />" + obs
            };
            foreach (string item in ConfigurationManager.AppSettings.Get("ErroEmail").Split(';'))
                mail.CC.Add(item);

            Client.Send(mail);
        }
        public static void SendMail(string body, string sender, string from, string assunto, bool isHtml = true, params string[] emails)
        {

            MailMessage mail = new MailMessage
            {
                From = new MailAddress(ConfigurationManager.AppSettings.Get("smtpLoginPadrao"), from),
                Sender = new MailAddress(ConfigurationManager.AppSettings.Get("smtpLoginPadrao"), sender),
                Subject = assunto,
                Body = body,
                IsBodyHtml = true
            };
            foreach (var item in emails)
                mail.To.Add(item);
            try
            {
                Client.Send(mail);
            }
            catch
            {
                //trata erro
            }
        }
    }
}
