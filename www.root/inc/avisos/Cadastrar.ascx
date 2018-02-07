<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Cadastrar.ascx.cs" Inherits="inc_noticia_Cadastrar" %>
<%@ Register TagPrefix="uc" TagName="Alerta" Src="~/inc/AlertaGenerico.ascx" %>
<link href="../../Styles/lib/bootstrap/bootstrap.css" rel="stylesheet" />
<style>
    .form-grop > .form-inline > span {
        padding: 0 !important;
        text-align: left;
    }
</style>
<div class="form-group">
    <div class="form-inline">
        <asp:Label runat="server" ID="lblTitulo" Text="Titulo" AssociatedControlID="" CssClass="col-sm-1" />
        <div class="11">
            <asp:TextBox CssClass=" form-control" runat="server" ID="txtTitulo" />
        </div>
    </div>
</div>
<div class="form-group">
    <div class="form-inline">
        <asp:Label Text="Conteudo" runat="server" />
        <div class="col-md-11">
            <asp:TextBox runat="server" TextMode="MultiLine" ID="txtConteudo" CssClass="form-control" />
        </div>
    </div>
</div>
<div class="form-grop">
    <div class="form-inline">
        <asp:Label runat="server" CssClass="col-sm-2">Escolha uma imagem</asp:Label>
        <div class="col-md-10">
            <asp:FileUpload runat="server" ID="img" />
        </div>
    </div>
</div>
<div class="form-grop">
    <div class="form-inline">
        <div class="col-md-12">
            <asp:Button Text="Salvar" runat="server" ID="btnSalvar" OnClick="btnSalvar_Click" />
        </div>
    </div>
</div>

<uc:Alerta runat="server" ID="ucAlerta" />
<!--
<script>
    try {
        CKEDITOR.replace('ckeditor');
    } catch (e) {

    }
</script> -->
