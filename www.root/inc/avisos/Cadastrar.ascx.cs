using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Portable = Library.Inclock.web.br;
using Classes.Common;
using Classes.Enumeradores;
using Classes.VO;

public partial class inc_noticia_Cadastrar : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        var feedBack = new FeedBack
        {
            Status = false
        };
        if (!SavaImagem())
        {
            return;
        }
        else
        {
            var avisos = new Aviso
            {
                Titulo = txtTitulo.Text,
                Conteudo = txtConteudo.Text,
                Imagem = img.FileName
            };

            feedBack = Portable.BL.Avisos.Salvar(avisos);
        }

        if (feedBack.Status)
        {
            ucAlerta.ShowMessager("Aviso Cadastrado com sucesso", StatusEnum.Success);
            txtConteudo.Text = "";
            txtTitulo.Text = "";
        }
    }
    public bool SavaImagem()
    {
        if (string.IsNullOrEmpty(img.FileName))
        {
            ucAlerta.ShowMessager("Por favor insira uma imagem", StatusEnum.Info);
            return false;
        }
        if (!(img.FileName.ToLower().Contains(".png") || img.FileName.ToLower().Contains(".jpg") || img.FileName.ToLower().Contains(".gif")))
        {
            ucAlerta.ShowMessager("Por favor insira um arquivo com formato de imagem", StatusEnum.Info);
            return false;
        }

        try
        {
            string diretorio = Server.MapPath(ConfigurationManager.AppSettings["UpLoadImagensAvisos"]) + img.FileName;
            if (UtilFile.FileExists(diretorio))
            {
                return true;
            }
            else
            {
                img.SaveAs(diretorio);
                img.Dispose();
            }
        }
        catch (Exception)
        {
            ucAlerta.ShowMessager("Erro ao realizar o upload na imagem", StatusEnum.Failure);
            return false;
        }
        return true;

    }
}