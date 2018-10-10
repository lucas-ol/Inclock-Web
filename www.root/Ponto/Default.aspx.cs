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
        if (!Page.IsPostBack)
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
        Label txtSaida = (Label)e.Item.FindControl("txtSaida");
        Label txtObs = (Label)e.Item.FindControl("txtObs");

        txtData.Text = ponto.DataEntrada;
        txtEntrada.Text = string.IsNullOrEmpty(ponto.Entrada)?" - ": ponto.Entrada;
        txtSaida.Text = string.IsNullOrEmpty(ponto.Saida) ? " - " : ponto.Saida;
        txtObs.Text = ponto.Obs;
        var periodo = Classes.Common.UtilDate.ConvertePeriodo(ponto.Expediente.Periodo);
        txtTurno.Text = periodo;
    }

    protected void btnBuscarPontos_Click(object sender, EventArgs e)
    {
        lblPeriodoHeader.Text = "De " + txtDataInicio.Text + " ate " + txtDataFim.Text;
        lvPontos.DataSource = new Pontos().GetPontos(txtDataInicio.Text, txtDataFim.Text, Autenticador.CurrentUser.Id);
        lvPontos.DataBind();
    }
}