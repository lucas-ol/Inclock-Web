using Classes.VO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Portable = Library.Inclock.web.br;
public partial class Funcionario_Default : System.Web.UI.Page
{
    protected override void OnInitComplete(EventArgs e)
    {
        lvPessoas.ItemDataBound += LvPessoas_ItemDataBound;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PequisaPessoas();

        }
    }

    private void LvPessoas_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Funcionario funcionario = (Funcionario)e.Item.DataItem;
        Literal id = (Literal)e.Item.FindControl("id");
        Literal nome = (Literal)e.Item.FindControl("nome");
        Literal cargo = (Literal)e.Item.FindControl("cargo");
        Literal qtdeExpedientes = (Literal)e.Item.FindControl("qtdecargo");
        Literal cpf = (Literal)e.Item.FindControl("cpf");
        Literal rg = (Literal)e.Item.FindControl("rg");
        HtmlTableRow link = (HtmlTableRow)e.Item.FindControl("link");
        link.Attributes.Add("onclick", "window.location.href=' /Funcionario/cadastrar.aspx?id=" + funcionario.Id + "'");

        Literal linha = (Literal)e.Item.FindControl("linha");
        linha.Text = Convert.ToString(e.Item.DataItemIndex + 1);
        id.Text = funcionario.Id.ToString();
        nome.Text = funcionario.Nome;
        cargo.Text = funcionario.Cargo;
        qtdeExpedientes.Text = funcionario.cargo_id.ToString();
        cpf.Text = funcionario.CPF;
        rg.Text = funcionario.RG;
    }
    protected void btnpesquisapessoa_Click(object sender, EventArgs e)
    {
        PequisaPessoas();
    }
    private void PequisaPessoas()
    {
        List<Funcionario> user = new Portable.BL.Funcionarios().ListaPessoasNome(txtPesquisaFuncionario.Text);
        lvPessoas.DataSource = user;
        lvPessoas.DataBind();
        paginacao.Visible = !(dprpessoas.PageSize >= user.Count);
    }
}