using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Portable = Library.Inclock.web.br;
using Classes.VO;
public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        GridQrCode.AutoGenerateColumns = false;
        DataTable table = new DataTable();
        GridQrCode.Columns[1].Visible = false;
        table.Columns.Add("id");
        table.Rows.Add(Session.SessionID.ToString());
        GridQrCode.DataSource = table;
        GridQrCode.DataBind();


    }
    protected override void OnInitComplete(EventArgs e)
    {
        lvCarousel.ItemDataBound += LvCarousel_ItemDataBound;
        lvCarousel.DataSource = new Portable.BL.Avisos().ListaNoticias(10);
        lvCarousel.DataBind();
        base.OnInitComplete(e);

    }

    private void LvCarousel_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
         Aviso Aviso = ( Aviso)e.Item.DataItem;
        Panel Painel = (Panel)e.Item.FindControl("CarouselItem");
        Image carouselImg = (Image)e.Item.FindControl("imgCarousel");
        Literal CarrouselTitulo = (Literal)e.Item.FindControl("txtTitulo");
        Literal Carrouselconteudo = (Literal)e.Item.FindControl("txtConteudo");
        int dd = e.Item.DataItemIndex;
        if (e.Item.DataItemIndex == 0)
        {
            Painel.CssClass += " active";
        }
        carouselImg.ImageUrl = System.Configuration.ConfigurationManager.AppSettings["UpLoadImagensAvisos"] + Aviso.Imagem;
        Carrouselconteudo.Text = Aviso.Conteudo;
        CarrouselTitulo.Text = Aviso.Titulo;
    }
}