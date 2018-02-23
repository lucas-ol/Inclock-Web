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
        lvExpediente.ItemDataBound += LvExpediente_ItemDataBound;
        try
        {
            lvExpediente.DataSource = new Expedientes().ListaExpediente(FuncionarioId);
            lvExpediente.DataBind();
        }
        catch (Exception ex)
        {
            // Response.Redirect("\\Erro");
            throw new HttpException(ex.Message);
        }

    }


    private void LvExpediente_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
    
        Expediente expediente = (Expediente)e.Item.DataItem;
        HiddenField ID = (HiddenField)e.Item.FindControl("hddId");
        Label Entrada = (Label)e.Item.FindControl("txtEntrada");
        Label Saida = (Label)e.Item.FindControl("txtSaida");
        Label HorasTrabalhada = (Label)e.Item.FindControl("txtHosrasTrabalhada");
        Label TempoPausa = (Label)e.Item.FindControl("txtTempoPausa");
        Label Semanda = (Label)e.Item.FindControl("txtDiaSemana");
        Label Periodo = (Label)e.Item.FindControl("txtPeriodo");
       
        HtmlButton btnEditar = (HtmlButton)e.Item.FindControl("btnEditar");
        Button btnExcluir = (Button)e.Item.FindControl("btnExcluir");
        Panel painel = (Panel)e.Item.FindControl("pnlExpediente");

<<<<<<< .mine
        painel.Attributes.Add("data-id","id"+ expediente.Id);
=======
        
        btnEditar.Attributes.Add("data-id", expediente.Id.ToString());
        btnEditar.Attributes.Add("onclick","");
        btnExcluir.Attributes.Add("data-id", expediente.Id.ToString());
>>>>>>> .r31

        btnEditar.Attributes.Add("onclick", "Editar(" + expediente.Id + ")");
        btnExcluir.Attributes.Add("onclick", "Excluir(" + expediente.Id + ")");


        ID.Value = expediente.Id.ToString();
        Entrada.Text = expediente.Entrada;
        Saida.Text = expediente.Saida;
        HorasTrabalhada.Text = expediente.Horas_Trabalho;
        TempoPausa.Text = expediente.Tempo_Pausa; 
        Semanda.Text = Expediente.ConverteDiaSemana(expediente.DiaSemana);
        Periodo.Text = Expediente.ConvertePeriodo(expediente.Periodo);
    }
}