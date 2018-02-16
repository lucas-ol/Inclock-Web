
using Classes.VO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;


namespace Autenticador
{
    public class Autenticador : IAutenticador
    {
        public string GetLogin(string Email)
        {
            return new BL.CAutenticador().GetLogin(Email);
        }
        public string GetListUsers()
        {
            return nameof(GetListUsers);
        }      
        public string GetUserById(int id)
        {
            return new BL.CAutenticador().GetUserById(id);
        }

        public string Logar(string password, string login)
        {
            return new BL.CAutenticador().Logar(password, login);
        }

        public string GetPassword(string Login)
        {
            return new BL.CAutenticador().GetPassword(Login);
        }

        public string GetCheckPointDateInterval(string InitialDate, string FinalDate)
        {
            return nameof(GetCheckPointDateInterval);
        }

        public string GetCheckPointByDate(string InitialDate, string FinalDate)
        {
          return nameof(GetCheckPointByDate);
        }

        public string GetCheckPointById(int id)
        {
          return nameof(GetCheckPointById);
        }

        public string CheckPoint(Ponto ponto)
        {
          return nameof(CheckPoint);
        }

        public string GetExpediente(int semana, int funcionario_Id)
        {
            return new BL.CAutenticador().GetExpediente(semana,funcionario_Id);
        }
    }
}
