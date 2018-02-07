using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZXing;

namespace Classes.Common
{
    public class CriaQr
    {
        /// <summary>
        /// Metodo que Vai criar a imagem QR
        /// </summary>
        /// <param name="strCodigo">Mensagem que vai ser Convertida para QR</param>
        /// <param name="width">Largura da imagem</param>
        /// <param name="height">Altura da imagem</param>
        /// <returns></returns>
        public Bitmap GeraImagem(string strCodigo, int width = 300, int height = 300)
        {
            BarcodeWriter barcodeWrite = new BarcodeWriter // Cria a instancia Do objeto que gera o codigo
            {

                Format = BarcodeFormat.QR_CODE, // Propriedade que define o qual tipo de codigo que vai ser gerado, no caso Qrcode
                Options = new ZXing.Common.EncodingOptions // propriedade que define as opçoes como Tamano lagura, altura, margin e codigo puro
                { Width = width, Height = height, Margin = 1 }// configuração das propriedades

            };

            try
            {
                return new Bitmap(barcodeWrite.Write(strCodigo)); // retorna a istancia de um objeto imagem 
            }
            catch (Exception)
            {

                return null; // retorna um valor nulo caso de algum tipo de erro 
            }

        }
        /// <summary>
        /// Metodo que vai converter uma Imagem em um array de Byte
        /// </summary>
        /// <param name="Imagem">Imagem que vai ser convertida </param>
        /// <returns></returns>
        public byte[] ConverteImagemByte(Image Imagem)
        {
            try
            {
                MemoryStream memoryStream = new MemoryStream();
                Imagem.Save(memoryStream, System.Drawing.Imaging.ImageFormat.Bmp);
                return memoryStream.ToArray();
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}

