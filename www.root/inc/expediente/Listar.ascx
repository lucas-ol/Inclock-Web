<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Listar.ascx.cs" Inherits="inc_expediente_Listar" %>
<div>
    <asp:ScriptManager runat="server" />

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:ListView runat="server" ID="lvExpediente">
                <ItemTemplate>
                    <div>
                        <div style="border: 1px solid black" class="autowidth">
                            <div style="text-align: center">
                                
                                <asp:label Text="text" runat="server" ID="txtDiaSemana" />
                            </div>
                            <asp:HiddenField runat="server" ID="hddId" />
                            <div class="form-group">
                                <div class="">
                                    Entrada:
                        <asp:label Text="text" runat="server" ID="txtEntrada" />
                                </div>
                                <div class="">
                                    Saida:
                    <asp:label Text="text" runat="server" ID="txtSaida" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="">
                                    Horas Trabalhada
                    <asp:label Text="text" runat="server" ID="txtHosrasTrabalhada" />
                                </div>
                                <div class="">
                                    Tempo Pausa:
                <asp:label Text="text" runat="server" ID="txtTempoPausa" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="">
                                    Periodo:
                    <asp:label Text="text" runat="server" ID="txtPeriodo" />
                                </div>
                            </div>
                            <div class="form-group form-inline">
                                <button type="button" runat="server" class="btn btn-warning col-md-6" id="btnEditar" data-id="0" onclick="Editar(this)">Editar</button>
                                <asp:Button Text="Excluir" runat="server" CssClass="btn btn-danger col-md-6" ID="btnExcluir" data-id="0" />
                            </div>
                        </div>
                        <link href="../../Styles/lib/bootstrap/bootstrap.css" rel="stylesheet" />
                    </div>
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
        alert($(ele).attr('data-id'));
    }
</script>
