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
        data1.ValidationExpression = data2.ValidationExpression = @"^((((0?[1-9]|[12]\d|3[01])[\.\-\/](0?[13578]|1[02])[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|((0?[1-9]|[12]\d|30)[\.\-\/](0?[13456789]|1[012])[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|((0?[1-9]|1\d|2[0-8])[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?\d{2}))|(29[\.\-\/]0?2[\.\-\/]((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00)))|(((0[1-9]|[12]\d|3[01])(0[13578]|1[02])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|[12]\d|30)(0[13456789]|1[012])((1[6-9]|[2-9]\d)?\d{2}))|((0[1-9]|1\d|2[0-8])02((1[6-9]|[2-9]\d)?\d{2}))|(2902((1[6-9]|[2-9]\d)?(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)|00))))$";
        lvPontos.ItemDataBound += LvPontos_ItemDataBound;
        if (!Page.IsPostBack)
        {
            Funcionario funcionario = Autenticador.CurrentUser;
            lblCargo.Text = funcionario.Cargo;
            lblId.Text = funcionario.Id.ToString();
            lblNome.Text = funcionario.Nome;
            string mesano = "/"+DateTime.Now.Month+"/"+DateTime.Now.ToString("yyyy");
            Buscar("01"+mesano , DateTime.DaysInMonth(DateTime.Now.Year,DateTime.Now.Month)+mesano);

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
        Buscar(txtDataInicio.Text, txtDataFim.Text);
    }
    public void Buscar(string dt_inicio , string dt_fim)
    {
        txtDataInicio.Text = dt_inicio;
        txtDataFim.Text = dt_fim;
        lblPeriodoHeader.Text = "De " + dt_inicio + " ate " + dt_fim;
        lvPontos.DataSource = new Pontos().GetPontos(dt_inicio, dt_fim, Autenticador.CurrentUser.Id);
        lvPontos.DataBind();
    }
}