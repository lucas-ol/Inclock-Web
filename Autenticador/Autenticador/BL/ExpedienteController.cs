using Classes.Common;
using Classes.VO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Autenticador.BL
{
    public class ExpedienteController : DataBase
    {
        public List<Expediente> GetExpediente(int semana, int funcionario_id)
        {
            MySqlAdicionaParametro("iSemana", semana);
            MySqlAdicionaParametro("iFuncionario", funcionario_id);
            List<Expediente> ExpedienteList = new List<Expediente>();
            DataTable tb = MySqlLeitura("prd_se_expediente_semana", System.Data.CommandType.StoredProcedure);
            if (tb.TableName != "erro")
            {
                foreach (DataRow linha in tb.Rows)
                {
                    Expediente expediente = new Expediente
                    {
                        Id = Convert.ToInt32(linha["id"]),
                        Entrada = ((TimeSpan)linha["entrada"]).ToString(),
                        Saida = ((TimeSpan)linha["saida"]).ToString(),
                        DiaSemana = Convert.ToInt32(linha["diasemana"]),
                        Funcionario_id = Convert.ToInt32(linha["funcionario_id"]),
                        Periodo = Convert.ToInt32(linha["periodo"])
                    };
                    ExpedienteList.Add(expediente);
                }

            }
            return ExpedienteList;
        }
        public Expediente GetExpediente(int funcionario, int semana, int periodo)
        {
            MySqlAdicionaParametro("_funcionario", funcionario);
            MySqlAdicionaParametro("_semana", semana);
            MySqlAdicionaParametro("_periodo", periodo);
            try
            {
                DataRow dr = MySqlLeitura("procedure a ser criada ", CommandType.Text).Rows[0];
                return new Expediente
                {
                    Id = Convert.ToInt32(dr["id"]),
                    Funcionario_id = Convert.ToInt32(dr["funcionario_id"]),
                    Entrada = dr["entrada"].ToString(),
                    Saida = dr["saida"].ToString(),
                    Periodo = Convert.ToInt32(dr["periodo"]),
                    DiaSemana = Convert.ToInt32(dr["diasemana"])
                };
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        
    }
}
