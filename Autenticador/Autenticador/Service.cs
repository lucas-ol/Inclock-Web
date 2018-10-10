using Autenticador.BL;
using common = Classes.Common;
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
        public void GetOptions()
        {
        }
        public string GetLogin(string Email)
        {
            return new BL.Autenticador().GetLogin(Email);
        }
        [Role(Roles = new string[] { "ADM" })]
        public Funcionario GetUserById(string id)
        {
            int.TryParse(id, out int iId);
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
        [Role(Roles = new string[] { "ADM", "FUNC" })]
        public List<Expediente> GetExpediente(string semana, string funcionario_Id)
        {
            if (!new Integracao().ValidaSessão())
                throw new Exception(Integracao.MENSAGEMERRO);

            int.TryParse(semana, out int isemana);
            int.TryParse(funcionario_Id, out int ifuncionario_Id);
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
        [Role(Roles = new string[] { "ADM", "FUNC" })]
        public List<Ponto> GetCheckPoint(string month, string funcionario)
        {
            int.TryParse(month, out int iMonth);
            if (iMonth == 0)
                throw new Exception("Parametros incorretos");
            int.TryParse(funcionario, out int iFuncionario);
            if (iFuncionario == 0)
                throw new Exception("Parametros incorretos");
            return new CheckPoint().GetCheckPointByMonth(iMonth, iFuncionario);
        }
        [Role(Roles = new string[] { "ADM", "FUNC" })]
        public List<Ponto> GetCheckPointByDate(string InitialDate, string FinalDate, string id_funcionario)
        {
            using (var ig = new Integracao())
            {
                if (ig.ValidaSessão())
                {

                    if (string.IsNullOrEmpty(InitialDate) || string.IsNullOrEmpty(FinalDate))
                        throw new Exception("Parametros incorretos");

                    int.TryParse(id_funcionario, out int iFuncionario);
                    if (iFuncionario == 0)
                        throw new Exception("Parametros incorretos");
                    return new CheckPoint().GetListCheckPoint(InitialDate, FinalDate, iFuncionario);
                }
            }
            throw new Exception("Você não tem os privilegios necessarios");
        }
        [Role(Roles = new string[] { "ADM", "FUNC" })]
        public List<Ponto> GetCheckPointDateInterval(string InitialDate, string FinalDate, string id_funcionario)
        {
            if (int.TryParse(id_funcionario, out int funcionario))
            {
                return new CheckPoint().GetListCheckPoint(InitialDate, FinalDate, funcionario);
            }
            else
                throw new Exception("Parametros incorretos");
        }
        [Role(Roles = new string[] { "ADM" })]
        public Ponto GetCheckPointById(string id)
        {
            int.TryParse(id, out int idd);
            if (idd == 0)
                return new Ponto();

            return new CheckPoint().GetPoint(idd);
        }
        [Role(Roles = new string[] { "ADM", "FUNC" })]
        public FeedBack CheckPoint(string funcionario, string type)
        {
            using (var ig = new Integracao())
            {
                if (ig.ValidaSessão())
                {
                    if (!int.TryParse(funcionario, out int func))
                        return new FeedBack() { Status = false, Mensagem = "funcionario invalido" };
                    if (!char.TryParse(type, out char tp))
                        return new FeedBack() { Status = false, Mensagem = "tipo invalido" };
                    return new CheckPoint().BaterPonto(func, tp);
                }
                else
                    return new FeedBack() { Mensagem = Integracao.MENSAGEMERRO, Status = false };
            }
        }

        public int ConvertePeriodo(string hora)
        {
            return Data.ConvertePeriodo(hora);
        }
        [Role(Roles = new string[] { "ADM" })]
        public FeedBack CadastrarExpediente(Expediente exp)
        {
            using (var ig = new Integracao())
            {
                if (ig.ValidaSessão())
                {
                    var feed = new FeedBack();
                    if (exp.Id == 0)
                        feed = new ExpedienteController().SalvaExpediente(exp);
                    else
                        feed = new ExpedienteController().AtualizaExpediente(exp);
                    return feed;
                }
                else
                    return new FeedBack() { Mensagem = Integracao.MENSAGEMERRO, Status = false };
            }

        }
        [Role(Roles = new string[] { "ADM" })]
        public FeedBack ExcluirExpediente(int id)
        {
            using (var ig = new Integracao())
            {
                if (ig.ValidaSessão())
                {
                    return new ExpedienteController().Excluir(id);
                }
                else
                    return new FeedBack() { Mensagem = Integracao.MENSAGEMERRO, Status = false };
            }

        }
    }
}
