using Classes.VO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class inc_expediente_Listar : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lvExpediente.ItemDataBound += LvExpediente_ItemDataBound;

    }

    private void LvExpediente_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Expediente funcionario = (Expediente)e.Item.DataItem;

        Literal ID = (Literal)e.Item.FindControl("txtId");
        Literal Entrada = (Literal)e.Item.FindControl("txtEntrada");
        Literal Saida = (Literal)e.Item.FindControl("txtSaida");
        Literal HorasTrabalhada = (Literal)e.Item.FindControl("txtHosrasTrabalhada");
        Literal TempoPausa = (Literal)e.Item.FindControl("txtTempoPausa");
        Literal Semanda = (Literal)e.Item.FindControl("txtDiaSemana");
        Literal Periodo = (Literal)e.Item.FindControl("txtPeriodo");


        ID.Text = funcionario.id.ToString();
        Entrada.Text = funcionario.Entrada.ToString("HH:MM");
        Saida.Text = funcionario.Saida.ToString("HH:MM");
        HorasTrabalhada.Text = funcionario.Horas_Trabalho.ToString("HH:MM");
        TempoPausa.Text = funcionario.Tempo_Pausa.ToString("HH:MM");
        Semanda.Text = funcionario.Semana;
        Periodo.Text = funcionario.Periodo.ToString();
    }
}