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
        public void SendMail(string body,params string[] emails)
        {
            SmtpClient client = new SmtpClient
            {
                Host = "smtp.gmail.com",
                EnableSsl = true,
                Credentials = new System.Net.NetworkCredential("seu email", "sua senha")
            };
            MailMessage mail = new MailMessage
            {
                Sender = new MailAddress("email que vai enviar", "ENVIADOR"),
                From = new MailAddress("de quem", "ENVIADOR")
            };

            mail.To.Add(new MailAddress("paraquem", "RECEBEDOR"));
            mail.Subject = "Contato";
            mail.Body = " Mensagem do site:<br/> Nome:  <br/> Email :  <br/> Mensagem : ";
            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;
            try
            {
                client.Send(mail);
            }
            catch (Exception erro)
            {
                //trata erro
            }
            finally
            {
                mail = null;
            }
        }
    }
}
