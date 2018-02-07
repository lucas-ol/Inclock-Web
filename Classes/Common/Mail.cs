using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Classes.Common
{
    class Mail
    {
        public void SetBody()
        { }
        public void Send()
        {
            SmtpClient client = new SmtpClient();
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true;
            client.Credentials = new System.Net.NetworkCredential("seu email", "sua senha");
            MailMessage mail = new MailMessage();
            mail.Sender = new System.Net.Mail.MailAddress("email que vai enviar", "ENVIADOR");
            mail.From = new MailAddress("de quem", "ENVIADOR");
            
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
