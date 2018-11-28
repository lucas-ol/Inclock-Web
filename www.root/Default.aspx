<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" MasterPageFile="~/masterpage/masterpage.Master" %>

<asp:Content ContentPlaceHolderID="Head" runat="server">
    <link href="/Scripts/owlcarousel/assets/owl.carousel.css" rel="stylesheet" />
    <script src="/Scripts/owlcarousel/owl.carousel.min.js"></script>
    <script src="/Scripts/qrcode.js"></script>
    <script src="/Scripts/avisos.js"></script>
    <style>
        .owl-qr {
            position: absolute;
            right: 15%;
            bottom: 20px;
            left: 0;
            z-index: 10;
            padding-left: 35px;
            padding-bottom: 10px;
            color: #fff;
            text-align: center;
        }

        #owl-container {
            position: absolute;
            width: 100%;
            height: 93%;
            background-color: gray
        }

        .error {
            text-align: center;
            margin: auto;
        }

        .loader {
            background-color: gray
        }

            .loader:before {
                content: '';
                position: absolute;
                margin: auto;
                background: url(/Img/ajaxWhite.gif) no-repeat center;
                background-size: 20%;
                width: 30%;
                height: 30%;
                left: 50%;
                top: 50%;
                transform: translate(-50%,-50%)
            }
        #img > img {
            width:100%;
            height:100%;
        }
        @media (max-width: 1333px) {
            #GridQrCode {
                display: none;
            }
        }

    </style>
</asp:Content>

<asp:Content ContentPlaceHolderID="Corpo" runat="server">

    <%--========== fim de alguma coisa==========--%>
    <!-- Slider -->

    <div id="owl-container" class="loader">
        <div id="GridQrCode" class="owl-qr w-25 h-50">
            <asp:HiddenField runat="server" ID="hdnCode" ClientIDMode="Static"/>            
            <div id="img" class="img-fluid" style="width:100%;height:100%"></div>
        </div>
        <div class="owl-carousel owl-theme" id="carrosel">
        </div>
    </div>
    <script>
        var qrcode = new QRCode("img", {
            colorDark : "#000000",
            colorLight : "#ffffff",
            correctLevel : QRCode.CorrectLevel.H
        });
        GetNewQr();
          $(function () {
              var av = new Avisos();
              var promise = av.GetAvisos(10, 0).then(function (resolve) {
                  $("#carrosel").append(av.CreateObjectHtml(resolve,'<% =@Classes.Common.Config.DiretorioImagensAvisos%>'))
                  $("#carrosel").owlCarousel({
                      items: 1,
                      loop: true,
                      autoWidth: false,
                      autoplay: true,
                      autoplayTimeout: 5000,
                      autoplayHoverPause: false,
                      dot: true
                  });
                  ResizeCarouselFullScreen('.autoimg');
                  $('#owl-container').removeClass('loader');
              }).catch(function (rejetc) {
                  $('#owl-container').append(rejetc);
                  $('#owl-container').removeClass('loader').addClass('error');
              });

              $(window).resize(function () {
                  ResizeCarouselFullScreen('.autoimg');
              });
              function ResizeCarouselFullScreen(clase) {
                  var altura = window.innerHeight;
                  var largura = window.innerWidth;
                  var str = altura - $('#menu').height(); // vai tirar o tamanho da barra de menu

                  $(clase).each(function () {
                      $(this).css("height", str);
                      $(this).css("width", largura)
                  });
              }
              setTimeout(CheckCode(),5000)
          });
          function GetNewQr() {
              $.ajax({
                  method: 'GET',
                  url:  "/api/Code/get",
                //  data: JSON.stringify({ funcionario: dados.toString(), type: type }),
                  contentType: "application/json; charset=utf-8",
                  dataType: "json",
                  headers: { integracao: window.integracao },
                  success: function (data) {                      
                      RenderizarQr(data)
                  },
                  error: function (x, y, z) {
                      console.log('Erro ao Adiquirir codigo');
                  }
              });
        }
         function CheckCode() {
              $.ajax({
                  method: 'GET',
                  url:  "/api/Code/CheckCode",
                  data: JSON.stringify({ code: $('#hdnCode').val()}),
                  contentType: "application/json; charset=utf-8",
                  dataType: "json",
                  headers: { integracao: window.integracao },
                  success: function (data) {                      
                      RenderizarQr(data)
                  },
                  error: function (x, y, z) {
                      console.log('Erro ao checar o codigo');
                  }
              });
          }
        function RenderizarQr(codigo) {
            if ($('#hdnCode').val() == codigo) {
                return;
            }
            qrcode.clear(); // clear the code.
            qrcode.makeCode(codigo);
            
            $('#hdnCode').val(codigo);
          }
    </script>
</asp:Content>
