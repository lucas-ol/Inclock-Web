using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;
using System.IO;

namespace Classes.Common
{
    public static class Rijndael
    {
        private static PasswordDeriveBytes Pass
        {
            get
            {
                var password = Encoding.UTF8.GetBytes(Common.Config.ChaveCriptografia);
                return new PasswordDeriveBytes(password, Salt);
            }
        }
        private static byte[] Salt { get { return new byte[8]; } }
        private static byte[] Key { get { return Pass.GetBytes(32); } }
        private static byte[] IV { get { return Pass.GetBytes(16); } }
        public static byte[] Criptografar(string texo)
        {
            byte[] encrypted;

            using (RijndaelManaged rijAlg = new RijndaelManaged())
            {
                ICryptoTransform encryptor = rijAlg.CreateEncryptor(Key, IV);

                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream csEncrypt = new CryptoStream(ms, encryptor, CryptoStreamMode.Write))
                    {
                        using (StreamWriter swEncrypt = new StreamWriter(csEncrypt))
                        {
                            swEncrypt.Write(texo);
                        }
                        encrypted = ms.ToArray();
                    }
                }
            }
            return encrypted;
        }
        public static byte[] Criptografar(params string[] texto)
        {
            return Criptografar(string.Join(";", texto));
        }
        public static string Descriptografar(byte[] TextoCriptografado)
        {
            string plaintext = string.Empty;
            using (RijndaelManaged rijAlg = new RijndaelManaged())
            {
                ICryptoTransform decryptor = rijAlg.CreateDecryptor(Key, IV);
                using (MemoryStream msDecrypt = new MemoryStream(TextoCriptografado))
                {
                    using (CryptoStream csDecrypt = new CryptoStream(msDecrypt, decryptor, CryptoStreamMode.Read))
                    {
                        using (StreamReader srDecrypt = new StreamReader(csDecrypt))
                        {
                            plaintext = srDecrypt.ReadToEnd();
                        }
                    }
                }
            }
            return plaintext;
        }
        public static string ToBase64(this byte[] obj) {
            return Convert.ToBase64String(obj);
        }
        public static string DescriptografaFromBase64(this string szTextoCifrado)
        {
            byte[] chaArray = Convert.FromBase64String(szTextoCifrado);
            return Descriptografar(chaArray);
        }
    }
}
