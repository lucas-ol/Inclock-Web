<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ponto.aspx.cs" Inherits="Ponto_Ponto" MasterPageFile="~/masterpage/masterpage.Master" %>
<%@ Register TagPrefix="uc" TagName="expediente" Src="~/inc/expediente/Listar.ascx"%>

<asp:Content runat="server" ContentPlaceHolderID="Head"></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Corpo">
    <div class="form-inline">
        <div class="col-md-6 p-0 m-0">
            <input type="button" name="name" value="Registrar Entrada" class="btn btn-success" id="btnEntrada" />         
        </div>
        <div class="col-md-6 p-0 m-0">
            <input type="button" name="name" value="Registrar Saida" class="btn btn-info" id="btnSaida"/>          
        </div>        
    </div>
    <div>
        <uc:expediente runat="server" ID="ucExpediente" />
    </div>
    <script src="<% =ResolveUrl("~/Scripts/Ponto.js") %>"></script>
</asp:Content>
