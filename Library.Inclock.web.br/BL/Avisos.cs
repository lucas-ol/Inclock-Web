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
   public class Avisos:DataBase
    {
        public List<Aviso> ListaNoticias(int quantidade)
        {
            List<Aviso> noticias = new List<Aviso>();
            DataTable TbNoticia = new DataTable();
            MySqlAdicionaParametro("@quantidade", quantidade);
            TbNoticia = MySqlLeitura("select * from avisos order by data_noticia desc limit @quantidade", CommandType.Text);
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

        public FeedBack InserirNoticia(Aviso aviso)
        {
            MySqlAdicionaParametro("titulo_", aviso.Titulo);
            MySqlAdicionaParametro("conteudo_", aviso.Conteudo);
            MySqlAdicionaParametro("img", aviso.Imagem);


            return MySqlExecutaComando("insert into avisos(titulo,conteudo,imagem) values(@titulo_,@conteudo_,@img)", CommandType.Text);
        }
    }
}
