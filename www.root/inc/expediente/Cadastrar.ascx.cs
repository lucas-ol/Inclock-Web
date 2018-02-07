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
}