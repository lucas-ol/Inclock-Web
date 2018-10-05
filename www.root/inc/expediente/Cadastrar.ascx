<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Cadastrar.ascx.cs" Inherits="inc_expediente_Cadastrar" ClientIDMode="Static" %>
<link href="/Styles/lib/bootstrap/bootstrap.css" rel="stylesheet" />
<style>
    .load {
        display: none;
        float:right;
        position: relative;
    }

        .load.default {
            background: url(/img/ajaxBlack.gif) no-repeat center;
            background-size: 100%;
            width: 30px;
            height: 30px
        }

        .load.active {
            display: inline-block;
        }
</style>
<script src="/Scripts/expediente.js"></script>
<div class="modal fade" id="cadastrar_expediente">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <asp:HiddenField runat="server" ID="hhdIdExpediente" Value="0" />
                <h4 class=" modal-title font-weight-bold">Cadastrar Expediente</h4>
                <button type="button" data-dismiss="modal" class="close" aria-label="Fechar">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-inline">
                    <div class="col-sm-11">
                        <asp:HiddenField runat="server" ID="hddIdFuncionario" />
                    </div>
                    <div class="col-sm-1"></div>
                </div>
                <div class="form-inline pt-1">
                    <div class="col-sm-2 font-weight-bold">Entra</div>
                    <div class="col-sm-3">
                        <asp:TextBox runat="server" TextMode="Time" CssClass="form-control" ID="txtEntrada" />
                    </div>
                    <div class="col-sm-3 font-weight-bold">Saida</div>
                    <div class="col-sm-4">
                        <asp:TextBox runat="server" ID="txtSaida" CssClass="form-control" TextMode="Time" />
                    </div>
                </div>
                <div class="form-inline pt-1">
                    <div class="col-sm-6">
                        <asp:DropDownList runat="server" ID="ddlPeriodo" CssClass="form-control w-100" data-meber="expediente" Enabled="false">
                            <asp:ListItem Text="Periodo" Value="" />
                            <asp:ListItem Text="Manhã" Value="1" />
                            <asp:ListItem Text="Tarde" Value="2" />
                            <asp:ListItem Text="Noite" Value="3" />
                        </asp:DropDownList>
                    </div>
                    <div class="col-sm-6">
                        <asp:DropDownList runat="server" CssClass="form-control w-100" ID="ddlDiaSemana" data-meber="expediente">
                            <asp:ListItem Text="Dia da Semana" Value="" />
                            <asp:ListItem Text="Segunda" Value="2" />
                            <asp:ListItem Text="Terça" Value="3" />
                            <asp:ListItem Text="Quarta" Value="4" />
                            <asp:ListItem Text="Quinta" Value="5" />
                            <asp:ListItem Text="Sexta" Value="6" />
                            <asp:ListItem Text="Sabado" Value="7" />
                            <asp:ListItem Text="Domingo" Value="1" />
                        </asp:DropDownList>
                    </div>
                </div>
                <span style="display: none; color: red" id="vlHoraInterval" runat="server"></span>
            </div>
            <div class="modal-body">
                <div id="lblmsg" class="w-100 text-center"></div>

                <div class="col-md-12">
                    <input type="button" name="btnSalvar" value="Salvar" class="btn btn-outline-success cadastrar-expediente" />
                    <!--    <asp:Button Text="Salvar" runat="server" class="btn btn-outline-success" ID="btnInserir" ValidationGroup="ExpedienteCadastro"/>-->
                    <input value="Cancelar" type="button" data-dismiss="modal" class="btn btn-outline-danger" />
                    <span class="load default" id="exp-loader"></span>
                </div>
            </div>


        </div>
    </div>
</div>
<script>  
    function OpenCadastrar() {
        $('#cadastrar_expediente').modal('show');
    }   

    function CarregaDados(Expediente) {

        $('#cadastrar_expediente').modal('show');
        $('#<% =hhdIdExpediente.ClientID%>').val(Expediente["id"]);
        $('#<% =txtEntrada.ClientID%>').val(Expediente["entrada"]);
        $('#<% =txtSaida.ClientID %>').val(Expediente["saida"]);



        $('option:contains("' + Expediente['semana'] + '")').prop('selected', true);
    //    $('#<% =ddlDiaSemana.ClientID %>').prop("disabled", true);

        $('option:contains("' + Expediente['periodo'] + '")').prop('selected', true);
    //  $('#<% =ddlPeriodo.ClientID%>').prop('disabled', true); 
        //    $('select').trigger("chosen:updated");
    }


    $('#cadastrar_expediente').on('hide.bs.modal', function (event) {
        $('#<% =ddlDiaSemana.ClientID %>').prop("disabled", false);
        $('#<% =ddlPeriodo.ClientID%>').prop("disabled", false);
        $('#<% =hhdIdExpediente.ClientID%>').prop("Value", 0);
        $('#<% =txtEntrada.ClientID%>').val("00:00");
        $('#<% =txtSaida.ClientID %>').val("00:00");
        $('#<% =ddlDiaSemana.ClientID %> option[value=0]').prop('selected', true);
        $('#<% =ddlPeriodo.ClientID%> option[value=0]').prop('selected', true);
        $('#lblmsg').css('display', 'none')
    });

</script>
