using Classes.VO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Library.Inclock.web.br.BL;
public partial class inc_expediente_Listar : System.Web.UI.UserControl
{
    public int FuncionarioId
    {
        get
        {
            int id;
            int.TryParse(Request.QueryString["id"], out id);
            return 1;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        lvExpediente.ItemDataBound += LvExpediente_ItemDataBound;
        lvExpediente.DataSource = new Expedientes().ListaExpediente(FuncionarioId);
        lvExpediente.DataBind();
    }


    private void LvExpediente_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Expediente expediente = (Expediente)e.Item.DataItem;
        HiddenField ID = (HiddenField)e.Item.FindControl("hddId");
        Literal Entrada = (Literal)e.Item.FindControl("txtEntrada");
        Literal Saida = (Literal)e.Item.FindControl("txtSaida");
        Literal HorasTrabalhada = (Literal)e.Item.FindControl("txtHosrasTrabalhada");
        Literal TempoPausa = (Literal)e.Item.FindControl("txtTempoPausa");
        Literal Semanda = (Literal)e.Item.FindControl("txtDiaSemana");
        Literal Periodo = (Literal)e.Item.FindControl("txtPeriodo");

        ID.Value = expediente.id.ToString();
        Entrada.Text = expediente.Entrada;
        Saida.Text = expediente.Saida;
        HorasTrabalhada.Text = expediente.Horas_Trabalho;
        TempoPausa.Text = expediente.Tempo_Pausa;
        Semanda.Text = expediente.Semana.ToString();
        Periodo.Text = expediente.Periodo.ToString();
    }
}