<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" MasterPageFile="~/masterpage/masterpage.Master" %>

<asp:Content ContentPlaceHolderID="Head" runat="server">

    <script>
        $(function () {
            ResizeCarouselFullScreen();
            $('.carousel').carousel();
            ResizeCarouselFullScreen();
            $(window).resize(function () {
                ResizeCarouselFullScreen();
            });

            function ResizeCarouselFullScreen() {
                var altura = window.innerHeight;
                var largura =window.innerWidth;
                var str = altura - $('#menu').height(); // vai tirar o tamanho da barra de menu

                $('.autoimg').each(function () {
                    $(this).css("height", str);
                    $(this).css("width", largura)
                });
            }
        });

    </script>
</asp:Content>
<asp:Content ContentPlaceHolderID="Corpo" runat="server">

    <!--========== fim de alguma coisa==========-->
    <!-- Slider -->


    <div class="carousel slide " data-ride="carousel" id="carrosel">
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
        <ol class="carousel-indicators">
            <li data-target="#carrosel" data-slide-to="0" class="active"></li>
            <li data-target="#carrosel" data-slide-to="1"></li>
        </ol>
        <div class="carousel-inner">
            <asp:ListView runat="server" ID="lvCarousel">
                <ItemTemplate>
                    <asp:Panel runat="server" CssClass="carousel-item" ID="CarouselItem">
                        <div class="thumbnail">
                            <asp:Image ImageUrl="imageurl" runat="server" CssClass="autoimg w-100" ID="imgCarousel" />
                            <div class="carousel-indicators">
                                <div class="carousel-caption ">
                                    <h3>
                                        <asp:Literal runat="server" ID="txtTitulo"></asp:Literal></h3>
                                    <p class=" w-50" style="margin: 0 auto;">
                                        <asp:Literal Text="text" runat="server" ID="txtConteudo" />
                                    </p>
                                </div>
                        </div>
                        </div>
                    </asp:Panel>
                </ItemTemplate>
            </asp:ListView>
            <a class="carousel-control-prev" href="#carrosel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Anterior</span>
            </a>
            <a class="carousel-control-next" href="#carrosel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Proximo</span>
            </a>
        </div>
    </div>
</asp:Content>
