using Classes.VO;
using Library.Inclock.web.br.BL;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class inc_expediente_Cadastrar : System.Web.UI.UserControl
{
    public int Id_funcionario
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

    public Expediente CriaObjeto()
    {
        Expediente expediente = new Expediente();
        expediente.Funcionario_id = Id_funcionario;
        int id;
        int.TryParse(hhdIdExpediente.Value, out id);
        expediente.Id = id;

        expediente.Entrada = txtEntrada.Text;
        expediente.Saida = txtSaida.Text;
        expediente.DiaSemana = Convert.ToInt32(ddlDiaSemana.SelectedValue);
        expediente.Periodo = Convert.ToInt32(ddlPeriodo.SelectedValue);
        return expediente;
    }
    public bool ValidaDados()
    {
        bool validade = Page.IsValid;
        TimeSpan Entrada = Convert.ToDateTime(txtEntrada.Text).TimeOfDay;
        TimeSpan Saida = Convert.ToDateTime(txtSaida.Text).TimeOfDay; ;
        TimeSpan HorasTrabalhada = Entrada - Saida;

        if (HorasTrabalhada.Hours < 1)
            validade = false;


        if (ddlDiaSemana.SelectedValue == "0")
            validade = false;

        if (ddlPeriodo.SelectedValue == "0")
            validade = false;

        return validade;
    }

    protected void btnInserir_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(hhdIdExpediente.Value) || hhdIdExpediente.Value == "0")
            AdicionaExpediente();
        else
            EditaExpediente();


    }
    public float ConverteHora(string hora)
    {
        float fHora;
        int minutos;
        float.TryParse(hora, out fHora);
        return fHora;
    }

    public void EditaExpediente()
    {
        FeedBack feed = new FeedBack { Status = false };
        if (ValidaDados())
        {
            Expedientes expedientes = new Expedientes();
            feed = expedientes.AtualizaExpediente(CriaObjeto());
            if (feed.Status)
            {
                string comand = "$(function(){ alert('Expediente atualizado com sucesso'); window.location.href = '" + Request.Url.AbsoluteUri + "'})";
                RegistraScript(comand, this.Page, true);
            }
            else
                lblmsg.InnerText = feed.Mensagem;
        }
        else if (Id_funcionario <= 0 || hhdIdExpediente.Value == "0")
            lblmsg.InnerText = "Erro inesperado";
        else
            lblmsg.InnerText = "Preencha todos os campos corretamente";
        if (!feed.Status)
        {
            lblmsg.Visible = true;
            RegistraScript("  $('#" + lblmsg.ClientID + "').delay(5000).toggle(1000);", this.Page, true);
        }
    }
    public void AdicionaExpediente()
    {
        FeedBack feed = new FeedBack { Status = false };
        if (ValidaDados())
        {
            Expedientes expedientes = new Expedientes();
            feed = expedientes.SalvaExpediente(CriaObjeto());

            if (feed.Status)
            {
                RegistraScript("<script>alert('Expediente Cadastrado com sucesso'); window.location.href ='" + Request.Url.AbsoluteUri + "'</script>", this.Page, false);

            }
            else
            {
                if (feed.Mensagem.ToLower().Contains("duplicate"))
                    feed.Mensagem = "Expediente ja esta cadastrado nesse periodo";
                lblmsg.InnerText = feed.Mensagem;
            }
        }
        else if (Id_funcionario <= 0)
            lblmsg.InnerText = "Erro inesperado";
        else
            lblmsg.InnerText = "Preencha todos os campos corretamente";
        if (!feed.Status)
        {
            lblmsg.Visible = true;
            RegistraScript("  $('#" + lblmsg.ClientID + "').delay(5000).toggle(1000);", this.Page, true);
        }

    }
    public void Clear()
    {
        txtEntrada.Text = string.Empty;
        txtSaida.Text = string.Empty;
        ddlDiaSemana.SelectedValue = "0";
        ddlPeriodo.SelectedValue = "0";
    }
    private void RegistraScript(string script, Page pagina, bool ScriptTag)
    {
        ScriptManager.RegisterStartupScript(pagina, pagina.GetType(), "", script, ScriptTag);
    }
}