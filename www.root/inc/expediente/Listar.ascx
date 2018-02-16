<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Listar.ascx.cs" Inherits="inc_expediente_Listar" %>

<div>
    <asp:Literal Text="text" runat="server" ID="dd" />
    <asp:ListView runat="server" ID="lvExpediente">
        <ItemTemplate>
            <div style="border: 1px solid black" class="autowidth">
                <asp:HiddenField  runat="server" ID="hddId" />
                <div class="form-group">
                    <div class="">
                        Entrada:
                        <asp:Literal Text="text" runat="server" ID="txtEntrada" />
                    </div>
                    <div class="">
                        Saida:
                    <asp:Literal Text="text" runat="server" ID="txtSaida" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="">
                        Horas Trabalhada
                    <asp:Literal Text="text" runat="server" ID="txtHosrasTrabalhada" />
                    </div>
                    <div class="">
                        Tempo Pausa:
                <asp:Literal Text="text" runat="server" ID="txtTempoPausa" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="">
                        Dia Semana:
                <asp:Literal Text="text" runat="server" ID="txtDiaSemana" />
                    </div>
                    <div class="">
                        Periodo:
                    <asp:Literal Text="text" runat="server" ID="txtPeriodo" />
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:ListView>
</div>
