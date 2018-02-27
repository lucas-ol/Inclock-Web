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

    public void SetarFuncionario(string nome, string id)
    {
        hddIdFuncionario.Value = id.ToString();
        lblFuncionario.Text = nome;
    }
    public Expediente CriaObjeto()
    {
        Expediente expediente = new Expediente();
        int id;
        int.TryParse(hddIdFuncionario.Value, out id);
        expediente.Id = id;
        expediente.Funcionario_id = Id_funcionario;
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
            if (Convert.ToDateTime(txtTempoPausa.Text).TimeOfDay < new TimeSpan(0, 10, 0))
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
        if (ValidaDados())
        {
            Expedientes expedientes = new Expedientes();
            FeedBack feed = new FeedBack { Status = false };
            feed = expedientes.AtualizaExpediente(CriaObjeto());
            if (feed.Status)
            {
                Response.Write("<script>alert('Expediente Cadastrado com sucesso'); window.href ='"+Request.Url.IsAbsoluteUri+"'</script>");
            }
            else
                Response.Write("<script>alert('erro: " + feed.Mensagem + "')</script>");
        }
        else if (Id_funcionario <= 0 || hhdIdExpediente.Value == "0")
            Response.Write("<script>alert('Erro inesperado')</script>");
        else
            Response.Write("<script>alert('Preencha todos os campos corretamente')</script>");

    }
    public void AdicionaExpediente()
    {

        if (ValidaDados())
        {
            Expedientes expedientes = new Expedientes();
            FeedBack feed = expedientes.SalvaExpediente(CriaObjeto());

            if (feed.Status)
                Response.Write("<script>alert('Expediente Cadastrado com sucesso')</script>");
            else
            {
                if (feed.Mensagem.ToLower().Contains("duplicate"))
                {
                    feed.Mensagem = "Expediente ja esta cadastrado nesse periodo";
                }
                Response.Write("<script>alert('" + feed.Mensagem + "')</script>");
            }
        }
        else if (Id_funcionario <= 0)
            Response.Write("<script>alert('Erro inesperado')</script>");
        else
            Response.Write("<script>alert('Preencha todos os campos corretamente')</script>");
    }
}