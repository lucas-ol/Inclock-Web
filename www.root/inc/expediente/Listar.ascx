<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Listar.ascx.cs" Inherits="inc_expediente_Listar" %>
<div>
    <asp:ScriptManager runat="server" />

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:Panel runat="server" ID="lblSemana" CssClass="autowidth " Style="transform: rotate(-90deg); padding: 0;" Text="Segunda">Segunda</asp:Panel>
            <asp:ListView runat="server" ID="lvExpediente">
                <ItemTemplate>
                    <asp:Panel runat="server" ID="pnlExpediente" Style="border: 1px solid black" class="autowidth">
                        <asp:Label runat="server" ID="lblid" data-id="id" />
                        <div style="text-align: center">
                            <asp:Label Text="text" runat="server" ID="txtDiaSemana" data-id="semana" />
                        </div>

                        <div class="form-group">
                            <div class="">
                                Entrada:
                        <asp:Label Text="text" runat="server" ID="txtEntrada" data-id="entrada" />
                            </div>
                            <div class="">
                                Saida:
                    <asp:Label Text="text" runat="server" ID="txtSaida" data-id="saida" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="">
                                Horas Trabalhada
                    <asp:Label Text="text" runat="server" ID="txtHosrasTrabalhada" />
                            </div>
                            <div class="">
                                Tempo Pausa:
                <asp:Label Text="text" runat="server" ID="txtTempoPausa" data-id="pausa" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="">
                                Periodo:
                    <asp:Label Text="text" runat="server" ID="txtPeriodo" data-id="periodo" />
                            </div>
                        </div>
                        <div class="form-group form-inline">
                            <button type="button" runat="server" class="btn btn-warning col-md-6" id="btnEditar" data-id="0" onclick="Editar(this)">Editar</button>
                            <asp:Button Text="Excluir" runat="server" CssClass="btn btn-danger col-md-6" ID="btnExcluir" data-id="0" />
                        </div>

                        <link href="../../Styles/lib/bootstrap/bootstrap.css" rel="stylesheet" />
                    </asp:Panel>
                </ItemTemplate>
            </asp:ListView>
            <div class="modal fade" id="">
                <div class="modal-content">
                    <div class="modal-dialog">
                        <div class="modal-header">
                            <h4>Editar Expediente</h4>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
<script>
    function Editar(ele) {
        var Expediete ;
        var elemeto = $('div[data-id="id' + ele + '"]');

        Expediente = {
            "id": elemeto.find('[data-id="id"]').text(),
            "entrada": elemeto.find('[data-id="entrada"]').text(),
            "saida": elemeto.find('[data-id="saida"]').text(),
            "pausa": elemeto.find('[data-id="pausa"]').text(),
            "semana": elemeto.find('[data-id="semana"]').text(),
            "periodo": elemeto.find('[data-id="periodo"]').text()
        }
        CarregaDados(Expediente);

    }
</script>
