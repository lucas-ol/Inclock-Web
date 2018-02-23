
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
        public string GetUserById(string id)
        {
            int iId;
            int.TryParse(id,out iId);
            if (iId == 0)
                return "erro";
            else
                return new BL.CAutenticador().GetUserById(iId);
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

        public string GetCheckPointByDate(string InitialDate, string FinalDate, string id_funcionario)
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

        public string GetExpediente(string semana, string funcionario_Id)
        {
            int isemana, ifuncionario_Id;
            int.TryParse(semana, out isemana);
            int.TryParse(funcionario_Id, out ifuncionario_Id);
            if ( ifuncionario_Id == 0)
                return "Paramentros incorretos";
            else
                return new BL.CAutenticador().GetExpediente(isemana, ifuncionario_Id);
        }

      


    }
}
