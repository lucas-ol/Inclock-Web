<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" MasterPageFile="~/masterpage/masterpage.Master" %>

<asp:Content ContentPlaceHolderID="Head" runat="server">

    <link href="/Scripts/owlcarousel/assets/owl.carousel.css" rel="stylesheet" />
    <link href="/Scripts/owlcarousel/assets/owl.theme.default.css" rel="stylesheet" />
    <script src="/Scripts/owlcarousel/owl.carousel.min.js"></script>
    <style>
        .caroulsel-caption {
            position: absolute;
            color: #FFF;
            font-size: 12px;
            display: block;
        }
    </style>
</asp:Content>

<asp:Content ContentPlaceHolderID="Corpo" runat="server">

    <!--========== fim de alguma coisa==========-->
    <!-- Slider -->  

    <div class="  " id="carrosel">
        <asp:GridView ID="GridQrCode" runat="server" AutoGenerateColumns="False" GridLines="None" CssClass=" carousel-caption w-25 h-25">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "handler/QRCode.ashx?"+Eval("id") %>' CssClass="img-fluid" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="id" HeaderText="id" />
            </Columns>
        </asp:GridView>
        <div class="owl-carousel owl-theme" id="caro">
            <div class="owl-stage-outer">
                <asp:ListView runat="server" ID="lvCarousel">
                    <ItemTemplate>
                        <asp:Panel runat="server" ID="CarouselItem" CssClass="owl-item">
                            <asp:Image ImageUrl="imageurl" runat="server" CssClass="autoimg" ID="imgCarousel" />                          
                        </asp:Panel>
                    </ItemTemplate>
                </asp:ListView>
                <div class="owl-nav" data-target="#caro">
                    <div class="owl-prev" >prev</div>
                    <div class="owl-next"  >next</div>
                </div>
            </div>
        </div>
    </div>
    <script>


        $(function () {
            // $('.carousel').carousel();

            ResizeCarouselFullScreen();

            $(window).resize(function () {
                ResizeCarouselFullScreen();
            });
            function ResizeCarouselFullScreen() {
                var altura = window.innerHeight;
                var largura = window.innerWidth;
                var str = altura - $('#menu').height(); // vai tirar o tamanho da barra de menu

                $('.autoimg').each(function () {
                    $(this).css("height", str);
                    $(this).css("width", largura)
                });
            }


        });
        $(".body").ready(function () {
            $("#caro").owlCarousel({
                items: 1,
                loop: false,
                autoWidth: true,
                autoplay: true,
                autoplayTimeout: 5000,
                autoplayHoverPause: false,
                dot: true
            });
        });
    </script>
</asp:Content>
