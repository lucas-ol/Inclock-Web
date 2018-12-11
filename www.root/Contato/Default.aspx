<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Contato_Default" MasterPageFile="~/masterpage/masterpage.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="Head"></asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Corpo">
    <div class="col-md-10 ">
        <h1>Instruções de instalação</h1>
        <h2>Mude as suas configurações</h2>
        <p>
            O primeiro passo é acessar o menu e escolher a área das “Configurações” (Settings). Depois disso, abra a alternativa “Segurança” (Security), como mostra a imagem abaixo.
        </p>
        <img src="/Img/tutorial/1.jpg" class="m-auto" style="display: block"/>
        <p>Neste submenu, encontre a opção “Fontes Desconhecidas” (Unknown Sources) — exatamente a que você precisa. Basta marcar para que essa alternativa seja válida e a sua nova configuração esteja pronta.</p>
        <img src="/Img/tutorial/2.jpg" class="m-auto mb-2" style="display: block" /> 
        <blockquote class="blockquote">
            <p class="blockquote-footer">GAZZARRRINI, Android: como habilitar a instalação de fontes desconhecidas, 2012. Disponível em: <<a href="https://www.tecmundo.com.br/como-fazer/25728-android-como-habilitar-a-instalacao-de-fontes-desconhecidas.htm">https://www.tecmundo.com.br/como-fazer/25728-android-como-habilitar-a-instalacao-de-fontes-desconhecidas.htm</a>>. Acesso em: 2018 jul.</p>
        </blockquote>
        <asp:HyperLink ID="lnkdwnload" runat="server" NavigateUrl="~/Application_Android/inclock.apk" Text="Baixar APK" CssClass="btn btn-outline-success"></asp:HyperLink>
    <div style="height:200px"></div>
    </div>
</asp:Content>
