using Classes.Common;
using Classes.VO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Library.Inclock.web.br.BL
{
    public class Avisos
    {
        public static List<Aviso> ListaNoticias(int quantidade)
        {
            using (var db = new DataBase())
            {
                List<Aviso> noticias = new List<Aviso>();
                DataTable TbNoticia = new DataTable();
                db.MySqlAdicionaParametro("@quantidade", quantidade);
                TbNoticia = db.MySqlLeitura("select * from avisos order by data_noticia desc limit @quantidade", CommandType.Text);
                if (TbNoticia.TableName != "erro")
                {
                    noticias = TbNoticia.Select().Select(x => new Aviso
                    {
                        ID = Convert.ToInt32(x["id"]),
                        Imagem = x["imagem"].ToString(),
                        Titulo = x["titulo"].ToString(),
                        Conteudo = x["conteudo"].ToString()

                    }).ToList();
                }

                return noticias;
            }
        }


        public static FeedBack Salvar(Aviso aviso)
        {
            using (var db = new DataBase())
            {
                db.MySqlAdicionaParametro("titulo_", aviso.Titulo);
                db.MySqlAdicionaParametro("conteudo_", aviso.Conteudo);
                db.MySqlAdicionaParametro("img", aviso.Imagem);


                return db.MySqlExecutaComando("insert into avisos(titulo,conteudo,imagem) values(@titulo_,@conteudo_,@img)", CommandType.Text);
            }
        }
        public static FeedBack Alterar(Aviso aviso)
        {
            using (var db = new DataBase())
            {
                db.MySqlAdicionaParametro("titulo_", aviso.Titulo);
                db.MySqlAdicionaParametro("conteudo_", aviso.Conteudo);
                db.MySqlAdicionaParametro("img", aviso.Imagem);
                db.MySqlAdicionaParametro("id", aviso.ID);
                return db.MySqlExecutaComando("update avisos set titulo = @titulo_ ,conteudo = @conteudo_ , imagem = @img where id = @id", CommandType.Text);
            }
        }
        public static bool Excluir(int id)
        {
            using (var db = new DataBase())
            {                
                db.MySqlAdicionaParametro("id",id);
                return db.MySqlExecutaComando("update avisos set titulo = @titulo_ ,conteudo = @conteudo_ , imagem = @img where id = @id", CommandType.Text).Status ;
            }
        }
    }
}
