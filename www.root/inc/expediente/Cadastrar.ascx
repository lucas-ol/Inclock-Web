<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Cadastrar.ascx.cs" Inherits="inc_expediente_Cadastrar" %>
<link href="/Styles/lib/bootstrap/bootstrap.css" rel="stylesheet" />
<style>
   
</style>

<div class="modal fade" id="cadastrar_expediente">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class=" modal-title">Castrar Expediente</h4>
                <button type="button" data-dismiss="modal" class="close" aria-label="Fechar"><span class="close " aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <div class="form-inline">
                    <div class="col-sm-11">
                        <asp:HiddenField runat="server" ID="hddIdFuncionario" />
                        <asp:Label Text="Nome Funcionario" runat="server" ID="lblFuncionario" />
                    </div>
                    <div class="col-sm-1"></div>
                </div>
                <div class="form-inline pt-1">
                    <div class="col-sm-2">Entra</div>
                    <div class="col-sm-3">
                        <asp:TextBox runat="server" TextMode="Time" CssClass="form-control" ID="txtEntrada" />
                    </div>
                    <div class="col-sm-3">Saida</div>
                    <div class="col-sm-4">
                        <asp:TextBox runat="server" ID="txtSaida" CssClass="form-control" TextMode="Time" />
                    </div>
                </div>
                <div class="form-inline pt-1">
                    <div class="col-sm-5">
                        <asp:DropDownList runat="server" ID="ddlPeriodo" CssClass="form-control w-100">
                            <asp:ListItem Text="Periodo" Value="0" />
                            <asp:ListItem Text="Manhã" Value="1" />
                            <asp:ListItem Text="Tarde" Value="2" />
                            <asp:ListItem Text="Noite" Value="3" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-inline pt-1">
                    <div class="col-sm-5">
                        <asp:DropDownList runat="server" CssClass="form-control w-100" ID="ddlDiaSemana">
                            <asp:ListItem Text="Dia da Semana" Value="0" />
                            <asp:ListItem Text="Segunda" Value="2" />
                            <asp:ListItem Text="Terça" Value="3" />
                            <asp:ListItem Text="Quarta" Value="4" />
                            <asp:ListItem Text="Quinta" Value="5" />
                            <asp:ListItem Text="Sexta" Value="6" />
                            <asp:ListItem Text="Sabado" Value="7" />
                            <asp:ListItem Text="Domingo" Value="1" />
                        </asp:DropDownList>
                    </div>
                    <div class="col-sm-3">Pausa</div>
                    <div class="col-sm-4">
                        <asp:TextBox runat="server" ID="txtTempoPausa" TextMode="Time" CssClass="form-control" /></div>
                </div>
            </div>
            <div class="modal-body">
                <asp:Button Text="Cadastrar" runat="server" class="btn btn-outline-success" ID="btnInserir" />
                <input value="Cancelar" type="button" data-dismiss="modal" class="btn btn-outline-danger" />
            </div>
        </div>
    </div>
</div>
<script>
    function OpenCadastrar() {
        $('#cadastrar_expediente').modal('show');
    }
    $(function () {

    });
</script>
