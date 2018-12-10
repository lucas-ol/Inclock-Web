<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Contato_Default" MasterPageFile="~/masterpage/masterpage.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="Head"></asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Corpo">
    <div class="col-md-10">
        <asp:HyperLink ID="lnkdwnload" runat="server" NavigateUrl="~/Application_Android/MyAndroidAppAame.apk" Text="Baixar APK" CssClass="btn btn-outline-success"></asp:HyperLink>
    </div>
</asp:Content>