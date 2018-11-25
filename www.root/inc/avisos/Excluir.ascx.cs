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
        lvCarousel.ItemCommand += LvCarousel_ItemCommand;
        lvCarousel.DataSource = Avisos.ListaNoticias(10);
        lvCarousel.DataBind();

    }
    
    private void LvCarousel_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "salvar")
        {
            var obj = (Aviso)e.Item.DataItem;
            Avisos.Alterar(obj);
        }
        else if (e.CommandName == "excluir")
            Avisos.Excluir(Convert.ToInt32(e.CommandArgument));
    }

    private void LvCarousel_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Aviso aviso = (Aviso)e.Item.DataItem;
        Panel Painel = (Panel)e.Item.FindControl("CarouselItem");
        Image carouselImg = (Image)e.Item.FindControl("imgCarousel");
        TextBox CarrouselTitulo = (TextBox)e.Item.FindControl("txtTitulo");
        TextBox Carrouselconteudo = (TextBox)e.Item.FindControl("txtConteudo");
        HiddenField hdn = (HiddenField)e.Item.FindControl("hdnId");
         ((Button)e.Item.FindControl("btnExcluir")).CommandArgument =
         ((Button)e.Item.FindControl("btnSalvar")).CommandArgument =
        hdn.Value = aviso.ID.ToString();
        carouselImg.ImageUrl = System.Configuration.ConfigurationManager.AppSettings["UpLoadImagensAvisos"] + aviso.Imagem;
        Carrouselconteudo.Text = aviso.Conteudo;
        CarrouselTitulo.Text = aviso.Titulo;
    }
}