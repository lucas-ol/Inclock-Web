using Classes.VO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Library.Inclock.web.br.BL;
using System.Globalization;
using System.Web.UI.HtmlControls;
using Classes.Common;

public partial class inc_expediente_Listar : System.Web.UI.UserControl
{
    public int FuncionarioId
    {
        get
        {
            int id;
            int.TryParse(Request.QueryString["id"], out id);
            return id;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void BuscaEspediente(int funcionarioId)
    {
        lvExpediente.ItemDataBound += LvExpediente_ItemDataBound;
        lvExpediente.DataSource = new Expedientes().ListaExpediente(funcionarioId);
        lvExpediente.DataBind();

    }

    private void LvExpediente_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Expediente expediente = (Expediente)e.Item.DataItem;
        Label Entrada = (Label)e.Item.FindControl("txtEntrada");
        Label Saida = (Label)e.Item.FindControl("txtSaida");
        Label Semanda = (Label)e.Item.FindControl("txtDiaSemana");
        Label Periodo = (Label)e.Item.FindControl("txtPeriodo");
        Label horas = (Label)e.Item.FindControl("txtHosrasTrabalhada");
        Entrada.Text = expediente.Entrada.Substring(0, 5);
        Saida.Text = expediente.Saida.Substring(0, 5);
        horas.Text = expediente.HorasTrabalhada;
        Semanda.Text = UtilDate.ConverteSemanaExtenso(expediente.DiaSemana);
        Periodo.Text = UtilDate.ConvertePeriodo(expediente.Periodo);
        if (expediente.DiaSemana == Convert.ToInt32(DateTime.Now.DayOfWeek)+1)
        {
            var headerExpediente = (HtmlControl)e.Item.FindControl("headerExpediente");
            headerExpediente.Style.Add(HtmlTextWriterStyle.BackgroundColor, "LightGreen");
        }

        if (Visitante.IsFunc)
        {
            HtmlControl pnlButtons = (HtmlControl)e.Item.FindControl("pnlButtons");
            pnlButtons.Visible = false;
        }
        else
        {
            HtmlButton btnEditar = (HtmlButton)e.Item.FindControl("btnEditar");
            HtmlButton btnExcluir = (HtmlButton)e.Item.FindControl("btnExcluir");
            btnEditar.Attributes.Add("onclick", "Editar(" + expediente.Id + ")");
            btnExcluir.Attributes.Add("onclick", "Excluir(" + expediente.Id + ")");
            Panel painel = (Panel)e.Item.FindControl("pnlExpediente");
            painel.Attributes.Add("data-id", expediente.Id.ToString());
        }
    }    
}