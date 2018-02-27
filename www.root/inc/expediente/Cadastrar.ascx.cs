using Classes.VO;
using Library.Inclock.web.br.BL;
using System;
using System.Collections.Generic;
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
        if (!string.IsNullOrWhiteSpace(txtTempoPausa.Text))
            expediente.Tempo_Pausa = txtTempoPausa.Text;
        else
            expediente.Tempo_Pausa = "00:00";

        expediente.Entrada = txtEntrada.Text;
        expediente.Saida = txtSaida.Text;
        expediente.DiaSemana = Convert.ToInt32(ddlDiaSemana.SelectedValue);
        expediente.Periodo = Convert.ToInt32(ddlPeriodo.SelectedValue);
        return expediente;
    }
    public bool ValidaDados()
    {
        bool validade = Page.IsValid;
        if (!string.IsNullOrEmpty(txtTempoPausa.Text))
        {
            TimeSpan time;
            TimeSpan.TryParse(txtTempoPausa.Text, out time);
            if (time < new TimeSpan(0, 10, 0) && time > new TimeSpan(0))
                validade = false;
        }
        int Entrada = Convert.ToInt32(txtEntrada.Text.Substring(0, 2));
        int Saida = Convert.ToInt32(txtSaida.Text.Substring(0, 2));
        int HorasTrabalhada = Math.Abs(Entrada - Saida);

        if (HorasTrabalhada < 1)
            validade = false;


        if (ddlDiaSemana.SelectedValue == "0")
            validade = false;

        if (ddlPeriodo.SelectedValue == "0")
            validade = false;

        return validade;
    }

    protected void btnInserir_Click(object sender, EventArgs e)
    {
        if (hhdIdExpediente.Value == "0")
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
        lblmsg.Visible = true;
        if (ValidaDados())
        {
            Expedientes expedientes = new Expedientes();
            FeedBack feed = new FeedBack { Status = false };
            feed = expedientes.AtualizaExpediente(CriaObjeto());
            if (feed.Status)
            {
                Response.Write("<script>alert('Expediente Cadastrado com sucesso'); window.location.href ='" + Request.Url.AbsoluteUri + "'</script>");
                lblmsg.Visible = false;
            }
            else
                lblmsg.GroupingText = feed.Mensagem;
        }
        else if (Id_funcionario <= 0 || hhdIdExpediente.Value == "0")
            lblmsg.GroupingText = "Erro inesperado";
        else
            lblmsg.GroupingText = "Preencha todos os campos corretamente";

    }
    public void AdicionaExpediente()
    {
        lblmsg.Visible = true;
        if (ValidaDados())
        {
            Expedientes expedientes = new Expedientes();
            FeedBack feed = expedientes.SalvaExpediente(CriaObjeto());

            if (feed.Status)
            {
                Response.Write("<script>alert('Expediente Cadastrado com sucesso'); window.location.href ='" + Request.Url.AbsoluteUri + "'</script>");
                lblmsg.Visible = false;
            }
            else
            {
                if (feed.Mensagem.ToLower().Contains("duplicate"))                
                    feed.Mensagem = "Expediente ja esta cadastrado nesse periodo";
                

                lblmsg.GroupingText = feed.Mensagem;
            }
        }
        else if (Id_funcionario <= 0)
            lblmsg.GroupingText = "Erro inesperado";
        else
            lblmsg.GroupingText = "Preencha todos os campos corretamente";
    }
}