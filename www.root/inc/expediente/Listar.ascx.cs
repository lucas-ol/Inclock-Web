using Classes.VO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Library.Inclock.web.br.BL;
using System.Globalization;

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
        Literal Entrada = (Literal)e.Item.FindControl("txtEntrada");
        Literal Saida = (Literal)e.Item.FindControl("txtSaida");
        Literal HorasTrabalhada = (Literal)e.Item.FindControl("txtHosrasTrabalhada");
        Literal TempoPausa = (Literal)e.Item.FindControl("txtTempoPausa");
        Literal Semanda = (Literal)e.Item.FindControl("txtDiaSemana");
        Literal Periodo = (Literal)e.Item.FindControl("txtPeriodo");

        ID.Value = expediente.Id.ToString();
        Entrada.Text = expediente.Entrada;
        Saida.Text = expediente.Saida;
        HorasTrabalhada.Text = expediente.Horas_Trabalho;
        TempoPausa.Text = expediente.Tempo_Pausa;
        CultureInfo culture = new CultureInfo("pt-BR");
        DateTimeFormatInfo dif = culture.DateTimeFormat;
        Semanda.Text = culture.TextInfo.ToTitleCase(dif.GetDayName((DayOfWeek)expediente.DiaSemana - 1));
        Periodo.Text = ConvertePeriodo(expediente.Periodo);
    }
    public string ConvertePeriodo(int periodo)
    {
        string szPeriodo = "";
        switch (periodo)
        {
            case 1:
                szPeriodo = "Manhã";
                break;
            case 2:
                szPeriodo = "Tarde";
                break;
            case 3:
                szPeriodo = "Noite";
                break;
            case 4:
                szPeriodo = "Integral";
                break;
        }

        return szPeriodo;
    }
}