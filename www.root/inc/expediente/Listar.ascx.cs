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
    public void BuscaEspediente(int id)
    {
        lvExpediente.ItemDataBound += LvExpediente_ItemDataBound;
        lvExpediente.DataSource = new Expedientes().ListaExpediente(id);
        lvExpediente.DataBind();
    }

    private void LvExpediente_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Expediente expediente = (Expediente)e.Item.DataItem;    
        Label Entrada = (Label)e.Item.FindControl("txtEntrada");
        Label Saida = (Label)e.Item.FindControl("txtSaida");
        Label HorasTrabalhada = (Label)e.Item.FindControl("txtHosrasTrabalhada");
        Label TempoPausa = (Label)e.Item.FindControl("txtTempoPausa");
        Label Semanda = (Label)e.Item.FindControl("txtDiaSemana");
        Label Periodo = (Label)e.Item.FindControl("txtPeriodo");

        HtmlButton btnEditar = (HtmlButton)e.Item.FindControl("btnEditar");
        HtmlButton btnExcluir = (HtmlButton)e.Item.FindControl("btnExcluir");
        Panel painel = (Panel)e.Item.FindControl("pnlExpediente");


        painel.Attributes.Add("data-id", "id" + expediente.Id);

        btnEditar.Attributes.Add("data-id", expediente.Id.ToString()); 
        btnEditar.Attributes.Add("onclick", "Editar(" + expediente.Id + ")");

        btnExcluir.Attributes.Add("onclick", "Excluir(" + expediente.Id + ")");

        Entrada.Text = expediente.Entrada.Substring(0, 5);
        Saida.Text = expediente.Saida.Substring(0, 5);
        HorasTrabalhada.Text = expediente.Horas_Trabalho.Substring(0,5);
        TempoPausa.Text = expediente.Tempo_Pausa.Substring(0, 5);
        Semanda.Text = Expediente.ConverteDiaSemana(expediente.DiaSemana);
        Periodo.Text = Expediente.ConvertePeriodo(expediente.Periodo);
    }
}