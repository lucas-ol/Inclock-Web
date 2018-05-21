﻿using Autenticador.BL;
using Classes.VO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Autenticador
{
    public class Service : IService
    {

        public string GetLogin(string Email)
        {
            return new BL.Autenticador().GetLogin(Email);
        }
        public Funcionario GetUserById(string id)
        {
            int iId;
            int.TryParse(id, out iId);
            if (iId == 0)
                throw new Exception("Parametro Incorreto");
            else
                return new BL.Autenticador().GetUserById(iId);
        }

        public Classes.VO.Funcionario Logar(string password, string login)
        {
            return new BL.Autenticador().Logar(password, login);
        }

        public string GetPassword(string Login)
        {
            return new BL.Autenticador().GetPassword(Login);
        }

        public List<Ponto> GetCheckPointDateInterval(string InitialDate, string FinalDate, string id_funcionario)
        {
            int funcionario;
            if (int.TryParse(id_funcionario, out funcionario))
            {
                return new CheckPoint().GetListCheckPoint(InitialDate, FinalDate, funcionario);
            }
            else
                throw new Exception("Parametros incorretos");
        }

        public List<Ponto> GetCheckPointByDate(string InitialDate, string FinalDate, string id_funcionario)
        {
            return new List<Ponto>();
        }

        public string GetCheckPointById(int id)
        {
            return nameof(GetCheckPointById);
        }

        public FeedBack CheckPoint(Ponto ponto)
        {
            return new CheckPoint(ponto).BaterPonto();
        }

        public List<Expediente> GetExpediente(string semana, string funcionario_Id)
        {
            int isemana, ifuncionario_Id;
            int.TryParse(semana, out isemana);
            int.TryParse(funcionario_Id, out ifuncionario_Id);
            if (ifuncionario_Id == 0)
                throw new Exception("Parametros incorretos");
            else
                return new ExpedienteController().GetExpediente(isemana, ifuncionario_Id);
        }

        public List<Aviso> GetAvisos(string qtde)
        {
            if (string.IsNullOrEmpty(qtde))
                qtde = "10";
            return new BL.Autenticador().getAvisos(qtde);
        }
    }
}
