using Classes.VO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class inc_expediente_Cadastrar : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void SetarFuncionario(string nome, string id)
    {
        hddIdFuncionario.Value = id.ToString();
        lblFuncionario.Text = nome;
    }
    public Expediente CriaObjeto()
    {
        Expediente expediente = new Expediente();
        expediente.Entrada = Convert.ToDateTime(txtEntrada.Text).TimeOfDay;
        expediente.Saida = Convert.ToDateTime(txtSaida.Text).TimeOfDay;
        expediente.Semana = Convert.ToInt32(ddlDiaSemana.SelectedValue);
        expediente.Periodo = Convert.ToInt32(ddlPeriodo.SelectedValue);
        return expediente;
    }
    public bool ValidaDados()
    {
        bool validade = Page.IsValid;
        if (!string.IsNullOrEmpty(txtTempoPausa.Text))
        {
            if (Convert.ToDateTime(txtTempoPausa.Text).TimeOfDay < new TimeSpan(0, 10, 0))
                validade = false;
        }
        TimeSpan Entrada = Convert.ToDateTime(txtEntrada.Text).TimeOfDay;
        TimeSpan Saida = Convert.ToDateTime(txtSaida.Text).TimeOfDay;
        TimeSpan HorasTrabalhada = (TimeSpan)(Entrada - Saida);

        if (HorasTrabalhada < new TimeSpan(1, 0, 0))
            validade = false;

        if (ddlDiaSemana.SelectedValue == "0")
            validade = false;

        if (ddlPeriodo.SelectedValue == "0")
            validade = false;
        return validade;
    }

    protected void btnInserir_Click(object sender, EventArgs e)
    {
        if (ValidaDados())
            Response.Write("<script>alert('Expediente Cadastrado com sucesso')</script>");
        else
            Response.Write("<script>alert('Preencha todos os campos corretamente')</script>");
    }
}