<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Cadastrar.ascx.cs" Inherits="inc_expediente_Cadastrar" %>
<link href="/Styles/lib/bootstrap/bootstrap.css" rel="stylesheet" />
<style>
   
</style>

<div class="modal fade" id="cadastrar_expediente">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class=" modal-title font-weight-bold">Castrar Expediente</h4>
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
                    <div class="col-sm-2 font-weight-bold">Entra</div>
                    <div class="col-sm-3">
                        <asp:TextBox runat="server" TextMode="Time" CssClass="form-control" ID="txtEntrada" />
                    </div>
                    <div class="col-sm-3 font-weight-bold" >Saida</div>
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
                        <asp:DropDownList runat="server" CssClass="form-control w-100" ID="ddlDiaSemana" CausesValidation="true">
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
                    <div class="col-sm-3 font-weight-bold">Pausa</div>
                    <div class="col-sm-4">
                        <asp:TextBox runat="server" ID="txtTempoPausa" TextMode="Time" CssClass="form-control" />
                    </div>
                </div>
                <asp:RequiredFieldValidator ValidationGroup="ExpedienteCadastro" ErrorMessage="<br>Entrada Invalida" ControlToValidate="txtEntrada" runat="server" ValidateRequestMode="Enabled" ViewStateMode="Enabled" ForeColor="Red" ID="rqfEntrada" Display="Dynamic" />
                <asp:RequiredFieldValidator ValidationGroup="ExpedienteCadastro" ErrorMessage="<br>Saida Invalida" ControlToValidate="txtSaida" runat="server" ValidateRequestMode="Enabled" ViewStateMode="Enabled" ForeColor="Red" ID="RequiredFieldValidator1" Display="Dynamic" />

                <asp:CustomValidator ErrorMessage="<br>Escolha o periodo" ControlToValidate="ddlPeriodo" runat="server" ValidationGroup="ExpedienteCadastro" ClientValidationFunction="validateCamp" Display="Dynamic" ForeColor="Red" />
                <asp:CustomValidator ErrorMessage="<br>Escolha o Dia da Semana" ControlToValidate="ddlDiaSemana" runat="server" ValidationGroup="ExpedienteCadastro" ClientValidationFunction="validateCamp" Display="Dynamic" ForeColor="Red" />

            </div>
            <div class="modal-body">
                <asp:Button Text="Cadastrar" runat="server" class="btn btn-outline-success" ID="btnInserir" ValidationGroup="ExpedienteCadastro" />
                <input value="Cancelar" type="button" data-dismiss="modal" class="btn btn-outline-danger" />
            </div>
        </div>
    </div>
</div>
<script>
    function OpenCadastrar() {
        $('#cadastrar_expediente').modal('show');
    }

    function validateCamp(oSrc, args) {
        var time = args.Value;
        args.IsValid = (args.Value != '0');
    }

</script>
