using Classes.Enumeradores;
using Classes.VO;
using Library.Inclock.web.br;
using Library.Inclock.web.br.BL;

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Funcionario_Cadastrar : System.Web.UI.Page
{
    private int idfuncionario;
    public int IdFuncionario
    {
        get
        {
            int.TryParse(Request.QueryString["id"], out idfuncionario);
            return idfuncionario;
        }
        private set { idfuncionario = value; }
    }

    #region Metodos
    protected void Page_Load(object sender, EventArgs e)
    {
        Funcionarios Controller = new Funcionarios();

        //Carrega os dados do estado 
        if (!IsPostBack)
        {
            DataTable td = Controller.BuscaCargos();
            //Carrega os dados dos cargos                
            txtCargo.DataSource = td;
            txtCargo.DataTextField = "descricao";
            txtCargo.DataValueField = "id";
            txtCargo.DataBind();
            txtCargo.Items.Insert(0, new ListItem("Selecione o Cargo", "0") { Selected = true });
            
            ckListRoles.DataSource = Controller.GetRoles();
            ckListRoles.DataValueField = "valor";
            ckListRoles.DataTextField = "texto";
            ckListRoles.DataBind();


        }

        if (IdFuncionario > 0)
        {
            if (PreencheDados(Controller.Pesquisa_Funcionario_ID(IdFuncionario)))
            {
                btnCadastraExpediente.Visible = true;
                ucExpCadastrar.Visible = true;
                ucExpListar.Visible = true;
                ucExpListar.BuscaEspediente(IdFuncionario);
            }
            else
                IdFuncionario = 0;

        }

    }

    

    protected void btnCadastrar_Click(object sender, EventArgs e)
    {
        if (IdFuncionario <= 0)
            Cadastrar();
        else
            AlterarFuncionario();



    }
    public void AlterarFuncionario()
    {
        if (ValidaCampos())
        {
            Funcionarios Controller = new Funcionarios();
            Funcionario funcionario = CriaIbjeto();

        }
        else
        {
            // Response.Write("<script>alert('Por favor verifique os campos incorretos')</script>");
            alerta.ShowMessager("Por favor corrija todos os campos  <strong>destacados em vermelho</strong>", StatusEnum.Info);
        }
    }
    private void Cadastrar()
    {
        if (ValidaCampos())
        {
            Funcionarios Controller = new Funcionarios();
            Funcionario funcionario = CriaIbjeto();

            FeedBack feedback = Controller.Cadastrar_Funcionario(funcionario);
            if (feedback.Status)
            {
                alerta.ShowMessager("Funcionario Cadastrado com sucesso", StatusEnum.Success);
                Clear();
                return;
            }
            else
                alerta.ShowMessager(feedback.Mensagem, StatusEnum.Failure);
        }
        else
        {
            // Response.Write("<script>alert('Por favor verifique os campos incorretos')</script>");
            alerta.ShowMessager("Por favor corrija todos os campos  <strong>destacados em vermelho</strong>", StatusEnum.Info);


        }
    }
    private Funcionario CriaIbjeto()
    {
        Funcionario funcionario = new Funcionario();
        funcionario.Nome = txtNome.Text;
        funcionario.Telefone = txtTelefone.Text;
        funcionario.Celular = txtCelular.Text;
        funcionario.Email = txtEmail.Text;
        funcionario.Endereco = txtEndereco.Text;
        funcionario.CPF = txtCpf.Text;
        funcionario.cargo_id = Convert.ToInt32(txtCargo.SelectedValue);
        funcionario.Nascimento = Convert.ToDateTime(txtAniversario.Text).ToString("yyyy-MM-dd");
        funcionario.Sexo = txtSexoFeminino.Checked ? "F" : "M";
        funcionario.Cidade = txtCidade.Text;
        funcionario.Estado = txtEstado.SelectedValue;
        funcionario.CEP = txtCep.Text.Replace(".", "").Replace("-", "");
        funcionario.Numero = txtNumeroCasa.Text;
        funcionario.Bairro = txtBairro.Text;
        funcionario.RG = txtRg.Text;
        funcionario.Senha = txtSenha.Text;
        funcionario.Login = txtLogin.Text;
        return funcionario;
    }
    /// <summary>
    /// Metodo que vai veirificar os campos que não poderam ser validados via JS
    /// </summary>
    private bool ValidaCampos()
    {

        const string ClassErro = " erro ";
        bool Retorno = true;
        bool asdf = !txtSexoFeminino.Checked && !txtSexoMasculino.Checked;
        if (!txtSexoFeminino.Checked && !txtSexoMasculino.Checked)
        {
            pnlsexo.CssClass += ClassErro;
            Retorno = false;
        }
        else
            pnlsexo.CssClass = pnlsexo.CssClass.Replace(ClassErro, "");

        if (txtCargo.SelectedValue == "0")
        {
            txtCargo.CssClass += ClassErro;
            Retorno = false;
        }
        else
            txtCargo.CssClass = txtCargo.CssClass.Replace(ClassErro, "");

        if (txtEstado.SelectedValue == "0")
        {
            txtEstado.CssClass += ClassErro;
            Retorno = false;
        }
        txtEstado.CssClass = txtEstado.CssClass.Replace(ClassErro, "");

        DateTime ano;
        DateTime.TryParse(txtAniversario.Text, out ano);
        if (ano.Year < DateTime.Now.Year - 100)
        {
            txtAniversario.CssClass += ClassErro;
            Retorno = false;
        }
        else
            txtAniversario.CssClass = txtAniversario.CssClass.Replace(ClassErro, "");

        if (txtNome.Text.Length < 5)
        {
            txtNome.CssClass += ClassErro;
            Retorno = false;
        }
        else
            txtNome.CssClass = txtNome.CssClass.Replace(ClassErro, "");

        if (txtCpf.Text.Length < 12)
        {
            txtCpf.CssClass += ClassErro;
            Retorno = false;
        }
        else
            txtCpf.CssClass = txtCpf.CssClass.Replace(ClassErro, "");

        if (txtRg.Text.Length < 10)
        {
            txtRg.CssClass += ClassErro;
            Retorno = false;
        }
        else
            txtRg.CssClass = txtRg.CssClass.Replace(ClassErro, "");

        if (txtCep.Text.Length < 8)
        {
            txtCep.CssClass += ClassErro;
            Retorno = false;
        }
        else
            txtCep.CssClass = txtCep.CssClass.Replace(ClassErro, "");

        if (txtCidade.Text.Length < 5)
        {
            txtCidade.CssClass += ClassErro;
            Retorno = false;
        }
        else
            txtCidade.CssClass = txtCidade.CssClass.Replace(ClassErro, "");

        if (txtEndereco.Text.Length < 5)
        {
            txtEndereco.CssClass += ClassErro;
            Retorno = false;
        }
        else
            txtEndereco.CssClass = txtEndereco.CssClass.Replace(ClassErro, "");

        if (txtNumeroCasa.Text.Length <= 0)
        {
            txtNumeroCasa.CssClass += ClassErro;
            Retorno = false;
        }
        else
            txtNumeroCasa.CssClass = txtNumeroCasa.CssClass.Replace(ClassErro, "");

        if (txtTelefone.Text.Length < 14)
        {
            txtTelefone.CssClass += ClassErro;
            Retorno = false;
        }
        else
            txtTelefone.CssClass.Replace(ClassErro, "");
        if (txtCelular.Text.Length < 15)
        {
            txtCelular.CssClass += ClassErro;
            Retorno = false;
        }
        else
            txtCelular.CssClass = txtCelular.CssClass.Replace(ClassErro, "");

        if (txtEmail.Text.Length < 5 && !(txtEmail.Text.Contains("@") && txtEmail.Text.Contains(".")))
        {
            txtEmail.CssClass += ClassErro;
            Retorno = false;
        }
        else
            txtEmail.CssClass = txtEmail.CssClass.Replace(ClassErro, "");

        if (txtSenha.Text.Length < 4 || txtSenha.Text.Length > 8)
        {
            txtSenha.CssClass += ClassErro;
            Retorno = false;
        }
        else
            txtSenha.CssClass = txtSenha.CssClass.Replace(ClassErro, "");

        if (txtLogin.Text.Length < 4 || txtLogin.Text.Length > 15)
        {
            txtLogin.CssClass += ClassErro;
            Retorno = false;
        }
        else
            txtLogin.CssClass = txtLogin.CssClass.Replace(ClassErro, "");

        return Retorno;
    }
    public bool PreencheDados(Funcionario funcionario)
    {
        if (funcionario.Id == 0)
            return false;
        txtNome.Text = funcionario.Nome;
        txtTelefone.Text = funcionario.Telefone;
        txtCelular.Text = funcionario.Celular;
        txtEmail.Text = funcionario.Email;
        txtEndereco.Text = funcionario.Endereco;
        txtCpf.Text = funcionario.CPF;
        txtCargo.SelectedValue = funcionario.cargo_id.ToString();

        txtAniversario.Text = funcionario.Nascimento;
        if (funcionario.Sexo == "F")
            txtSexoFeminino.Checked = true;
        else
            txtSexoMasculino.Checked = true;

        txtCidade.Text = funcionario.Cidade;
        txtEstado.SelectedValue = funcionario.Estado;
        txtCep.Text = funcionario.CEP;
        txtNumeroCasa.Text = funcionario.Numero;
        txtBairro.Text = funcionario.Bairro;
        txtRg.Text = funcionario.RG;
        txtSenha.Text = funcionario.Senha;
        txtSenha.TextMode = TextBoxMode.SingleLine;
        txtLogin.Text = funcionario.Login;
        return true;
    }

    /// <summary>
    /// Metodo que vai zerar todos os campos 
    /// </summary>
    private void Clear()
    {

        txtSexoMasculino.Checked = false;
        txtSexoFeminino.Checked = false;
        txtCargo.SelectedValue = "0";

        txtEstado.SelectedValue = "0";

        txtAniversario.Text = "";

        txtNome.Text = "";
        txtNome.Focus();

        txtCpf.Text = "";

        txtRg.Text = "";

        txtCep.Text = "";

        txtCidade.Text = "";

        txtEndereco.Text = "";

        txtNumeroCasa.Text = "";

        txtTelefone.Text = "";

        txtCelular.Text = "";

        txtEmail.Text = "";

        txtSenha.Text = "";

        txtLogin.Text = "";
    }

    #endregion
}