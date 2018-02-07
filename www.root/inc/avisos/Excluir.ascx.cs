using Classes.VO;
using Library.Inclock.web.br.BL;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class inc_avisos_Excluir : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lvCarousel.ItemDataBound += LvCarousel_ItemDataBound;
        lvCarousel.DataSource = new Avisos().ListaNoticias(10);
        lvCarousel.DataBind();

    }

    private void LvCarousel_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Aviso aviso = (Aviso)e.Item.DataItem;
        Panel Painel = (Panel)e.Item.FindControl("CarouselItem");
        Image carouselImg = (Image)e.Item.FindControl("imgCarousel");
        Literal CarrouselTitulo = (Literal)e.Item.FindControl("txtTitulo");
        Literal Carrouselconteudo = (Literal)e.Item.FindControl("txtConteudo");
        HyperLink btn = (HyperLink)e.Item.FindControl("btn");
       

        carouselImg.ImageUrl = System.Configuration.ConfigurationManager.AppSettings["UpLoadImagensAvisos"] + aviso.Imagem;
        Carrouselconteudo.Text = aviso.Conteudo;
        CarrouselTitulo.Text = aviso.Titulo;
    }
}