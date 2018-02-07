<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Excluir.ascx.cs" Inherits="inc_avisos_Excluir" %>

<script>
    $(function () {
        $(window).resize(function () {
            AutoImage();
        });

        function AutoImage() {


            $('.autoimg').each(function () {
                $(this).css("height", "25%");
                $(this).css("width", "25%")
            });
        }
    });
</script>
<!--========== fim de alguma coisa==========-->
<!-- Slider -->
<link href="../../Styles/lib/bootstrap/bootstrap.css" rel="stylesheet" />
<asp:ListView runat="server" ID="lvCarousel">
    <ItemTemplate>
        <div class="col-md-3">
            <div>
                <asp:Image ImageUrl="imageurl" runat="server" CssClass="autoimg w-100" ID="imgCarousel" />
                <h3>
                    <asp:Literal runat="server" ID="txtTitulo"></asp:Literal></h3>
                <p class=" w-50" style="margin: 0 auto;">
                    <asp:Literal Text="text" runat="server" ID="txtConteudo" />
                </p>
                <asp:HyperLink Text="Excluir" runat="server" ID="btn" />
            </div>
        </div>
    </ItemTemplate>
</asp:ListView>

