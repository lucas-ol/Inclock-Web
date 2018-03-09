<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ponto.aspx.cs" Inherits="Ponto_Ponto" MasterPageFile="~/masterpage/masterpage.Master" %>
<%@ Register TagPrefix="uc" TagName="expediente" Src="~/inc/expediente/Listar.ascx"%>

<asp:Content runat="server" ContentPlaceHolderID="Head"></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Corpo">
    <div class="form-inline">
        <div class="col-md-6 p-0 m-0">
            <asp:Button Text="Registrar Entrada" runat="server" ID="btnEntrada" CssClass="btn btn-success" />
        </div>
        <div class="col-md-6 p-0 m-0">
            <asp:Button Text="Registrar Saida" runat="server" ID="btnSaida" CssClass="btn btn-info" />
        </div>        
    </div>
    <div>
        <uc:expediente runat="server" ID="ucExpediente" />
    </div>

</asp:Content>
