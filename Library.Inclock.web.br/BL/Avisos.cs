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
        public List<Aviso> ListaNoticias(int quantidade)
        {
            using (var db = new DataBase())
            {
                List<Aviso> noticias = new List<Aviso>();
                DataTable TbNoticia = new DataTable();
                db.MySqlAdicionaParametro("@quantidade", quantidade);
                TbNoticia = db.MySqlLeitura("select * from avisos order by data_noticia desc limit @quantidade", CommandType.Text);
                foreach (DataRow Linha in TbNoticia.Rows)
                {
                    Aviso ItemNoticia = new Aviso();
                    ItemNoticia.ID = Convert.ToInt32(Linha["id"]);
                    ItemNoticia.Imagem = Linha["imagem"].ToString();
                    ItemNoticia.Titulo = Linha["titulo"].ToString();
                    ItemNoticia.Conteudo = Linha["conteudo"].ToString();
                    noticias.Add(ItemNoticia);
                }
                return noticias;
            }
        }

        public FeedBack InserirNoticia(Aviso aviso)
        {
            using (var db = new DataBase())
            {
                db.MySqlAdicionaParametro("titulo_", aviso.Titulo);
                db.MySqlAdicionaParametro("conteudo_", aviso.Conteudo);
                db.MySqlAdicionaParametro("img", aviso.Imagem);


                return db.MySqlExecutaComando("insert into avisos(titulo,conteudo,imagem) values(@titulo_,@conteudo_,@img)", CommandType.Text);
            }
        }
    }
}
