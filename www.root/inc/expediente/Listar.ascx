<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Listar.ascx.cs" Inherits="inc_expediente_Listar" %>

<div>
    <asp:Literal Text="text" runat="server" ID="dd"/>
    <asp:ListView runat="server" ID="lvExpediente">
        <ItemTemplate>
            <div style="border:1px solid black">
                ID:
                <asp:Literal Text="text" runat="server" ID="txtId" />
                Entrada:
                <asp:Literal Text="text" runat="server" ID="txtEntrada" />
                Saida:
                <asp:Literal Text="text" runat="server" ID="txtSaida" />
                Horas Trabalhada:
                <asp:Literal Text="text" runat="server" ID="txtHosrasTrabalhada" />
                Tempo Pausa:
                <asp:Literal Text="text" runat="server" ID="txtTempoPausa" />
                Dia Semana:               
                <asp:Literal Text="text" runat="server" ID="txtDiaSemana" />
                Periodo:<asp:Literal Text="text" runat="server" ID="txtPeriodo" />
            </div>
        </ItemTemplate>
    </asp:ListView>
</div>
