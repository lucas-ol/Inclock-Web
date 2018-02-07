using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class paginacao : System.Web.UI.UserControl
{
    public int Pagina
    {
        get
        {
            int pagina = 1;
            if (Int32.TryParse(Request.QueryString["b"], out pagina))
                return pagina <= 0 ? 1 : pagina;
            else
                return 1;
        }
    }
    /// <summary>
    /// Ultizado para saber quantos numeros vão aparacer no antes e depois da pagina 
    /// </summary>
    public int Intervalo
    {
        get
        {
            return 2;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        btnAnterior.Click += BtnAnterior_Click;
        btnProxima.Click += BtnProxima_Click;
    }

    private void BtnProxima_Click(object sender, EventArgs e)
    {
        Response.Redirect(MontaLink("b", (Pagina + 1).ToString()));
    }

    private void BtnAnterior_Click(object sender, EventArgs e)
    {

        if (!(Pagina == 1))
            Response.Redirect(MontaLink("b", (Pagina - 1).ToString()));
    }


    /// <summary>
    /// Cria a paginação 
    /// </summary>
    /// <param name="itensPagina"></param>
    /// <param name="totitens"></param>
    public void Paginar(int itensPagina, int totitens)
    {

        listPaginas.ItemDataBound += ListPaginas_ItemDataBound;
        int ultimaPagina;
        ultimaPagina = Convert.ToInt32(Math.Ceiling(Convert.ToDouble(totitens) / Convert.ToDouble(itensPagina)));

        listPaginas.DataSource = ListaNumero(Pagina, ultimaPagina);
        listPaginas.DataBind();

        this.Visible = btnProxima.Visible = !(Pagina == ultimaPagina);
        btnAnterior.Visible = !(Pagina == 1);
    }

    private void ListPaginas_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        int paginaclicada = (int)e.Item.DataItem;
        HyperLink link = (HyperLink)e.Item.FindControl("numeroPagina");
        if (paginaclicada != Pagina)
        {
            link.Text = paginaclicada.ToString();
            link.NavigateUrl = MontaLink("b", paginaclicada.ToString());
            // active
        }
        else
        {
            link.Text = paginaclicada.ToString();
            link.Style.Add(HtmlTextWriterStyle.FontWeight, "bolder");
            link.Style.Add(HtmlTextWriterStyle.TextDecoration, "underline");
            
            string str = link.Style.Value;
            link.NavigateUrl = Request.Url.AbsoluteUri;
            link.CssClass += " -active";
        }
    }

    private string MontaLink(string variavelName, string valor)
    {

        string novaUrl = Request.Url.AbsolutePath + "?";
        NameValueCollection Querys = Request.QueryString;
        novaUrl += variavelName + "=" + valor;
        for (int i = 0; i < Querys.Count; i++)
        {
            if (Querys.Keys[i] == variavelName)
                continue;
            if (i >= 0 && i >= (i - 1))
                novaUrl += "&";
            novaUrl += Querys.Keys[i] + "=" + Querys[i];
        }
        //  novaUrl = Request.Url.PathAndQuery;
        return novaUrl;
    }
    public List<int> ListaNumero(int paginainicial, int paginaFinal)
    {

        List<int> listaNumero = new List<int>();
        paginainicial -= paginainicial - Intervalo <= -1 ? 0 : Intervalo; // especifica que deve ser mostrado dois numeros antes 


        for (int i = paginainicial; i <= paginaFinal; i++)
        {
            if (i == 0)
                continue;
            if (i > paginainicial + Intervalo + 2)
                break;
            listaNumero.Add(i);
        }
        return listaNumero;
    }
}
