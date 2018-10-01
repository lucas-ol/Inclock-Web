using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Classes.VO;
using Library.Inclock.web.br.BL;
using Library.Inclock.web.br.BL.Common;

public partial class Ponto_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lvPontos.ItemDataBound += LvPontos_ItemDataBound;
        if (!this.Page.IsPostBack)
        {
            Funcionario funcionario = Autenticador.CurrentUser;
            lblCargo.Text = funcionario.Cargo;
            lblId.Text = funcionario.Id.ToString();
            lblNome.Text = funcionario.Nome;
            lblPeriodoHeader.Text = "De " + DateTime.Now.Date.ToString("dd/MM/yyyy") + " ate " + DateTime.Now.Date.ToString("dd/MM/yyyy");
        }
    }

    private void LvPontos_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Ponto ponto = (Ponto)e.Item.DataItem;

        Label txtData = (Label)e.Item.FindControl("txtData");
        Label txtTurno = (Label)e.Item.FindControl("txtTurno");
        Label txtEntrada = (Label)e.Item.FindControl("txtEntrada");
        Label txtEntradaPausa = (Label)e.Item.FindControl("txtEntradaPausa");
        Label txtSaidaPausa = (Label)e.Item.FindControl("txtSaidaPausa");
        Label txtSaida = (Label)e.Item.FindControl("txtSaida");
        Label txtStatus = (Label)e.Item.FindControl("txtStatus");

      /* txtData.Text = ponto.Entrada;
        txtTurno.Text = ponto.Periodo.ToString();
        txtEntrada.Text = ponto.Entrada;       
        txtSaida.Text = ponto.Saida;
        txtStatus.Text = string.Join(" ,", ponto.Status);*/ 
    }

    protected void btnBuscarPontos_Click(object sender, EventArgs e)
    {
        lblPeriodoHeader.Text = "De " + txtDataInicio.Text + " ate " + txtDataFim.Text;
        lvPontos.DataSource = new Pontos().GetPontos(txtDataInicio.Text, txtDataFim.Text);
        lvPontos.DataBind();
    }
}