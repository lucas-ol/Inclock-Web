<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="noticia_Default" MasterPageFile="~/masterpage/masterpage.Master" %>


<asp:Content ContentPlaceHolderID="Head" runat="server">
    <script src="/Scripts/ckeditor/ckeditor.js"></script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Corpo" >
    <asp:Panel runat="server" ID="pnlCorpo"></asp:Panel>

</asp:Content>

