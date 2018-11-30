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
<link href="<% =ResolveUrl("~/Scripts/owlcarousel/assets/owl.carousel.min.css") %>" rel="stylesheet" />
<style>
    .owl-item {
        padding: 0 10px !important;
    }

    img.autoimg {
        height: 200px !important
    }

    .owl-dots {
        background: gray;
        border-radius: 17px;
        margin: 36px auto !important;
        top:auto !important;
    }
</style>
<script src="<% =ResolveUrl("~/Scripts/owlcarousel/owl.carousel.js") %>"></script>
<div class="container">
    <div class="carousel owl-carousel owl-theme" style="margin: 50px 0">
        <asp:ListView runat="server" ID="lvCarousel">
            <ItemTemplate>
                <div class="item">
                    <asp:HiddenField ID="hdnId" runat="server" />
                    <asp:Image ImageUrl="imageurl" runat="server" CssClass="autoimg w-100" ID="imgCarousel" />
                    <div class="d-block">
                        <div class="row">
                            <div class="col-md-12"><asp:FileUpload runat="server" ID="img" /></div>
                        </div>
                        <label class="col-md-2">Titulo</label>
                        <asp:TextBox runat="server" ID="txtTitulo" CssClass="form-control col-md-12"></asp:TextBox>
                        <label class="col-md-3">Conteudo</label>
                        <asp:TextBox Text="text" runat="server" ID="txtConteudo" TextMode="MultiLine" Columns="20" CssClass="form-control col-md-12" />
                        <div class="row">
                            <div class="col-md-2">
                                <asp:Button Text="Desativar" runat="server" CommandName="excluir" ID="btnExcluir" CssClass="btn btn-outline-danger float-left" />
                            </div>
                            <div class="col-md-2">
                                <asp:Button Text="Ativar" runat="server" ID="btnAtivar" CommandName="ativar" CssClass="btn btn-outline-primary floa-left" /></div>
                            <div class="col-md-8">
                                <asp:Button Text="Salvar" runat="server" CommandName="salvar" ID="btnSalvar" CssClass="btn btn-outline-success float-right" />
                            </div>

                        </div>

                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>

</div>
<script>
    $(function () {
        $('.carousel').owlCarousel({
            items: 2,
            loop: false,
            autoWidth: false,
            dot: true
        });
    })
</script>
