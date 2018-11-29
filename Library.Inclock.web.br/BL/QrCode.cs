using Classes.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.Inclock.web.br.BL
{
    public class QrCode
    {
        public static string GetNewCode()
        {
            using (var db = new DataBase())
            {
                string code = GetLastCodeNotUsed() ?? "";
                if (string.IsNullOrEmpty(code))
                {
                    db.MySqlAdicionaParametro("expirado", false);
                    var table = db.MySqlLeitura("insert into log_codes (expirado) values(@expirado);select last_insert_id() as id;", System.Data.CommandType.Text);
                    if (table.TableName != "erro")
                    {
                        code = table.Select().Select(x => x["id"].ToString()).FirstOrDefault();
                    }
                }
                return code;
            }
        }
        public static bool CheckCode(string oldCode)
        {
            using (var db = new DataBase())
            {
                db.MySqlAdicionaParametro("code", oldCode);
                var table = db.MySqlLeitura("select expirado from log_codes where id = @code", System.Data.CommandType.Text);
                if (table.TableName != "erro")
                {
                    return table.Select().Select(x => Convert.ToBoolean(x["expirado"])).FirstOrDefault();
                }
            }
            return true;
        }
        public static string GetLastCodeNotUsed()
        {
            using (var db = new DataBase())
            {
                var table = db.MySqlLeitura("select * from log_codes where !expirado limit 1", System.Data.CommandType.Text);
                if (table.TableName != "erro" && table.Rows.Count > 0)
                {
                    return table.Select().Select(x => x["id"].ToString()).FirstOrDefault();
                }
            }
            return "";
        }
    }
}
