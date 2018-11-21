<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Relatorios_Default" MasterPageFile="~/masterpage/masterpage.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="Head">
    <script type="text/javascript" src="<% =ResolveUrl("~/Scripts/Chart/Chart.bundle.js") %>"></script>
    <script src="<% =ResolveUrl("/Scripts/Chart/Inclock.js") %>"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Corpo">
    <canvas id="canvas"></canvas>
    <script>
        var factory = new ChartFactory();
        $(function () {
            factory.Ajax({}, 'GET', window.appRest+"getpoint/10-06-1996/01-11-2018/5",[GerarRLPonto],$('#canvas'));
        })
    </script>
</asp:Content>
