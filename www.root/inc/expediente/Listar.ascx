<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Listar.ascx.cs" Inherits="inc_expediente_Listar" %>
<div>
    
     
            <asp:ListView runat="server" ID="lvExpediente">
                <ItemTemplate>
                    <asp:Panel runat="server" ID="pnlExpediente" Style="border: 1px solid black" class="autowidth" >

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
                            <button type="button" runat="server" class="btn btn-danger col-md-6" id="btnExcluir" data-id="0">Excluir</button>
                        </div>

                        <link href="../../Styles/lib/bootstrap/bootstrap.css" rel="stylesheet" />
                    </asp:Panel>
                </ItemTemplate>
            </asp:ListView>
    
    <div class="modal fade" id="expExclui">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <asp:HiddenField runat="server" ID="hhdIdexpediente" />
                    <h4>Editar Expediente</h4>
                    <button type="button" data-dismiss="modal" class="close">&times;</button>
                </div>
                <div class="modal-body">
                    Deseja realmente excluir esse espediente?
                </div>
                <div class="modal-body">
                    <button type="button" class="btn btn-danger align-content-lg-start" data-dismiss="modal">Cancelar</button>
                    <asp:Button Text="Comfirmar" runat="server" ID="btnExcluirConfimar" CssClass="btn btn-success" Style="display: inline-block; float: right" OnClick="btnExcluirConfimar_Click" />
                </div>
            </div>
        </div>
    </div>

</div>
<script>
    function Editar(ele) {
        var Expediete;
        var elemeto = $('div[data-id="' + ele + '"]');
        
        Expediente = {
            "id": $(elemeto).attr("data-id"),
            "entrada": elemeto.find('[data-id="entrada"]').text(),
            "saida": elemeto.find('[data-id="saida"]').text(),
            "pausa": elemeto.find('[data-id="pausa"]').text(),
            "semana": elemeto.find('[data-id="semana"]').text(),
            "periodo": elemeto.find('[data-id="periodo"]').text()
        }
        debugger;
        CarregaDados(Expediente);
    }
    function Excluir(id) {
        $('#expExclui').modal('show');
        $('#<% =hhdIdexpediente.ClientID%>').val(id);
    }
</script>
