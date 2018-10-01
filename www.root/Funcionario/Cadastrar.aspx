<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cadastrar.aspx.cs" Inherits="Funcionario_Cadastrar" MasterPageFile="~/masterpage/masterpage.Master" %>

<%@ Register TagName="alerta" TagPrefix="uc" Src="~/inc/AlertaGenerico.ascx" %>
<%@ Register TagName="ExpedienteCadastrar" TagPrefix="uc" Src="~/inc/expediente/Cadastrar.ascx" %>
<%@ Register TagName="ExpedienteListar" TagPrefix="uc" Src="~/inc/expediente/Listar.ascx" %>

<asp:Content ContentPlaceHolderID="Head" runat="server">
    <style>
        body {
        }

        label {
            padding: 0 !important;
        }

        .ckGroup {
            padding: 10px;
            display: inline-flex !important;
            width: auto !important;
        }

            .ckGroup > input {
                margin: 5px
            }
    </style>
    <link href="/Scripts/jqueryUI/jquery-ui.css" rel="stylesheet" />
    <script src="/Scripts/jqueryUI/jquery-ui.js"></script>
    <script src="/Scripts/jquery.mask.js"></script>
    <style>
        .erro {
            border: 1px solid red !important;
            border-radius: 5px;
        }

        .CampoOk {
            width: 100% !important;
            border-radius: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Corpo" ContentPlaceHolderID="Corpo" runat="server">
    <div class="text-capitalize card-header text-center">dados do funcionario</div>
    <asp:HiddenField ID="hddIdFuncionario" ClientIDMode="Static" runat="server" />
    <div class=" container pt-5">
        <div class="form-group">
            <div class=" form-inline">
                <label for="Corpo_txtNome" class="col-sm-1">Nome*</label>
                <div class=" col-sm-5">
                    <asp:TextBox runat="server" ID="txtNome" placeholder="Nome Completo" CssClass="CampoOk form-control col"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="Nome" ControlToValidate="txtNome" runat="server" ValidationGroup="cadastro" ForeColor="Red" Display="None" />
                </div>
                <label for="Corpo_txtCargo" class="col-sm-1">Cargo*</label>
                <div class=" col-sm-5">
                    <asp:DropDownList runat="server" ID="txtCargo" CssClass="CampoOk form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator ErrorMessage="Cargo" ControlToValidate="txtCargo" runat="server" ValidationGroup="cadastro" ForeColor="Red" Display="None" />
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-inline">
                <label for="Corpo_txtRg" class="col-sm-1">RG*</label>
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="txtRg" CssClass="CampoOk form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="RG" ControlToValidate="txtRg" runat="server" ValidationGroup="cadastro" ForeColor="Red" Display="None" />
                </div>
                <label for="Corpo_txtCpf" class="col-sm-1">CPF*</label>
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="txtCpf" CssClass="CampoOk form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="CPF" ControlToValidate="txtCpf" runat="server" ValidationGroup="cadastro" ForeColor="Red" Display="None" />
                </div>

                <label class="col-sm-1">sexo*</label>
                <div class=" col-md-3">
                    <asp:Panel ID="pnlsexo" runat="server" CssClass="CampoOk form-control ">
                        <div class="form-inline ">
                            <asp:RadioButtonList runat="server" ID="rdaSexo" CssClass="form-inline" RepeatLayout="Flow">
                                <asp:ListItem Text="Masculino" Value="M" />
                                <asp:ListItem Text="Feminino" Value="F" />
                            </asp:RadioButtonList>
                            <br />
                            <asp:RequiredFieldValidator ErrorMessage="Sexo" ControlToValidate="rdaSexo" runat="server" ValidationGroup="cadastro" ForeColor="Red" Display="None" />


                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-inline">
                <label for="Corpo_txtAniversario" class="col-sm-1">Nacimento*</label>
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="txtAniversario" CssClass="CampoOk form-control "></asp:TextBox>
                </div>

                <label for="Corpo_txtEmail" class="col-sm-1">Email*</label>
                <div class="col-md-7">
                    <div class="input-group">
                        <span class="input-group-addon">@</span><asp:TextBox runat="server" ID="txtEmail" TextMode="Email" placeholder="exemple@exemple.com" CssClass="CampoOk form-control"></asp:TextBox>
                        <asp:RegularExpressionValidator ErrorMessage="Email" ControlToValidate="txtEmail" runat="server" ValidationExpression="/^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/" ValidationGroup="cadastro" ForeColor="Red" Display="None" />
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-inline">
                <label for="Corpo_txtCep" class="col-sm-1">CEP*</label>
                <div class="col-md-2">
                    <asp:TextBox runat="server" ID="txtCep" CssClass="CampoOk form-control"></asp:TextBox>
                    <asp:RangeValidator ErrorMessage="CEP" ControlToValidate="txtCep" runat="server" MinimumValue="1" MaximumValue="4" ValidationGroup="cadastro" ForeColor="Red" Display="None" />
                </div>


                <label for="Corpo_txtCidade" class="col-sm-1">Cidade*</label>
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="txtCidade" CssClass="CampoOk form-control"></asp:TextBox>
                </div>

                <label for="Corpo_txtEstado" class="col-sm-1">Estado*</label>
                <div class="col-md-4">
                    <asp:DropDownList ID="txtEstado" runat="server" CssClass="CampoOk form-control custom-select">
                        <asp:ListItem Selected="True" Value="0">Selecione Seu Estado</asp:ListItem>
                        <asp:ListItem Value="AC">Acre</asp:ListItem>
                        <asp:ListItem Value="AL">Alagoas</asp:ListItem>
                        <asp:ListItem Value="AP">Amapá</asp:ListItem>
                        <asp:ListItem Value="AM">Amazonas</asp:ListItem>
                        <asp:ListItem Value="BA">Bahia</asp:ListItem>
                        <asp:ListItem Value="CE">Ceará</asp:ListItem>
                        <asp:ListItem Value="ES">Espírito Santo</asp:ListItem>
                        <asp:ListItem Value="GO">Goiás</asp:ListItem>
                        <asp:ListItem Value="MA">Maranhão</asp:ListItem>
                        <asp:ListItem Value="MS">Mato Grosso do Sul</asp:ListItem>
                        <asp:ListItem Value="PA">Pará</asp:ListItem>
                        <asp:ListItem Value="PB">Paraíba</asp:ListItem>
                        <asp:ListItem Value="PR">Paraná</asp:ListItem>
                        <asp:ListItem Value="PE">Pernambuco</asp:ListItem>
                        <asp:ListItem Value="PI">Piauí</asp:ListItem>
                        <asp:ListItem Value="RJ">Rio de Janeiro</asp:ListItem>
                        <asp:ListItem Value="RN">Rio Grande do Norte</asp:ListItem>
                        <asp:ListItem Value="RS">Rio Grande do Sul</asp:ListItem>
                        <asp:ListItem Value="RO">Rondonia</asp:ListItem>
                        <asp:ListItem Value="RR">Roraima</asp:ListItem>
                        <asp:ListItem Value="SC">Santa Cararina</asp:ListItem>
                        <asp:ListItem Value="SP">São Paulo</asp:ListItem>
                        <asp:ListItem Value="SE">Sergipe</asp:ListItem>
                        <asp:ListItem Value="TO">Tocantins</asp:ListItem>
                        <asp:ListItem Value="MG">Minas Gerais</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ErrorMessage="Estado" ControlToValidate="txtEstado" runat="server" ValidationGroup="cadastro" ForeColor="Red" Display="None" />
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-inline">
                <label for="Corpo_txtBairro" class="col-sm-1">Bairro</label>
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="txtBairro" CssClass="CampoOk form-control"></asp:TextBox>
                </div>

                <label for="Corpo_txtEndereco" class="col-sm-1">Endereço*</label>
                <div class="col-md-4">
                    <asp:TextBox runat="server" ID="txtEndereco" placeholder="Av. Monte Belo SP " CssClass="CampoOk form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="Endereço" ControlToValidate="txtEndereco" runat="server" ValidationGroup="cadastro" ForeColor="Red" Display="None" />
                </div>

                <label for="Corpo_txtNumeroCasa" class="col-sm-1">Nº*</label>
                <div class="col-md-2">
                    <asp:TextBox runat="server" ID="txtNumeroCasa" placeholder="1230" CssClass="CampoOk form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="Numero" ControlToValidate="txtNumeroCasa" runat="server" ValidationGroup="cadastro" ForeColor="Red" Display="None" />
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-inline">
                <label for="Corpo_txtTelefone" class="col-sm-1">Telefone*</label>
                <div class="col-md-5">
                    <asp:TextBox runat="server" ID="txtTelefone" TextMode="Phone" placeholder="(11) 1111-1111" CssClass="CampoOk form-control"></asp:TextBox>
                    <asp:RangeValidator ErrorMessage="Telefone" ControlToValidate="txtTelefone" runat="server" ValidationGroup="cadastro" ForeColor="Red" Display="None" MinimumValue="14" MaximumValue="14" />
                </div>

                <label for="Corpo_txtCelular" class="col-sm-1">Celular</label>
                <div class="col-md-5">
                    <asp:TextBox runat="server" ID="txtCelular" TextMode="Phone" placeholder="(11) 11111-1111" CssClass="CampoOk form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-inline">
                <label for="Corpo_txtLogin" class="col-sm-1">Login</label>
                <div class="col-md-5">
                    <asp:TextBox runat="server" ID="txtLogin" CssClass="CampoOk form-control" MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="Login" ControlToValidate="txtLogin" runat="server" ValidationGroup="cadastro" ForeColor="Red" Display="None" />
                    <asp:RangeValidator ErrorMessage="Login deve ter pelo menos 4 caracteres " ControlToValidate="txtLogin" runat="server" ValidationGroup="cadastro" ForeColor="Red" Display="None" />
                </div>
                <label for="Corpo_txtSenha" class="col-sm-1">Senha</label>
                <div class="col-md-5">
                    <asp:TextBox runat="server" ID="txtSenha" CssClass="CampoOk form-control " TextMode="Password" MaxLength="8"></asp:TextBox>
                </div>

            </div>
            <div class="form-inline">
                <asp:Panel runat="server" CssClass="col-md-12" GroupingText="Roles">
                    <asp:CheckBoxList ID="ckListRoles" runat="server" CssClass="ckGroup form-control custom-checkbox" RepeatDirection="Horizontal" RepeatLayout="Flow" CellSpacing="2" CellPadding="2">
                        <asp:ListItem Text="Administrador" Value="ADM"></asp:ListItem>
                        <asp:ListItem Text="Funcionario" Value="FUNC"></asp:ListItem>
                    </asp:CheckBoxList>
                </asp:Panel>

            </div>
        </div>

        <div class="">
            <div class="form-inline">
                <div class="col-md-12">
                    <asp:Button runat="server" ID="btnCadastrar" Text="Salvar" OnClick="btnCadastrar_Click" CssClass="btn btn-secondary btn-outline-success align-content-center" />
                    <button data-target="#cadastrar_expediente" data-toggle="modal" type="button" class="btn btn-secondary btn-outline-danger float-right" runat="server" visible="false" id="btnCadastraExpediente">Cadastrar Expediente</button>
                </div>
                <uc:alerta runat="server" ID="alerta"></uc:alerta>
            </div>
        </div>
        <div>
            <uc:ExpedienteCadastrar runat="server" ID="ucExpCadastrar" Visible="false" />
            <uc:ExpedienteListar runat="server" ID="ucExpListar" Visible="false" />

        </div>

    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
    <script>
        $("#Corpo_txtAniversario").datepicker({
            changeMonth: true,
            changeYear: true,
            dayNames: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'],
            dayNamesMin: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S', 'D'],
            dayNamesShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom'],
            monthNames: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
            monthNamesShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
            nextText: 'Proximo',
            prevText: 'Anterior',
            yearRange: "-100:+0",
            dateFormat: "dd/mm/yy"
        });
        $("#Corpo_txtAniversario").keypress(function () {
            $(this).mask("00/00/0000", { placeholder: "__/__/____" });
        });

        /*Eventos keypress que vai inserir a mascara em alguns campos */
        /*Mascara do cep */

        $("#<% =txtCep.ClientID%>").mask("00.000-000");
        /*Mascara do telefone */
        $("#<% =txtTelefone.ClientID%>").mask("(00) 0000-0000");
        /*Mascara do celular */
        $("#<% =txtCelular.ClientID%>").mask("(00) 00000-0000");
        /*Mascara do Numero da Casa */
        $("#<% =txtNumeroCasa.ClientID%>").mask("0000");
        /*Mascara do cpf*/
        $("#<% =txtCpf.ClientID%>").mask("000.000.000-00");

        $("#<% =txtRg.ClientID%>").mask("00.000.000-0");

        /*esse metodo vai buscar os dados do cep*/
        $("#<% =txtCep.ClientID%>").focusout(function () {
            var cep = $(this).val().length <= 7 ? '00000000' : $(this).val().replace(".", "").replace("-", "");
            $.ajax({
                url: "https://viacep.com.br/ws/" + cep + "/json",
                contentType: "application/json; charset=utf-8",
                //  data: "{ 'strCep':'" + $(this).val().replace(".","").replace("-","") + "' }",
                type: "GET",
                async: true,
                datatype: "json",
            }).done(function (data) {
                var Retorno;
                try {
                    /*   var Retorno = JSON.parse(data);
                       $("#Corpo_txtEstado").val(Retorno["uf"]);
                       $("#Corpo_txtCidade").val(Retorno["localidade"]);
                       $("#Corpo_txtEndereco").val(Retorno["logradouro"]);
                       $("#Corpo_txtBairro").val(Retorno["bairro"]);*/
                    $("#Corpo_txtEstado").val(data["uf"]);
                    $("#Corpo_txtCidade").val(data["localidade"]);
                    $("#Corpo_txtEndereco").val(data["logradouro"]);
                    $("#Corpo_txtBairro").val(data["bairro"]);
                } catch (e) {
                    return;
                }
            }).fail(function (erro, mennsager) {
                return;
            });
        });



        function FormataCamposValidados(Elemento, Valido) {
            if (Valido) {
                $(Elemento).removeClass("erro");
                $(Elemento).attr("data-valid", true);
            }
            else {
                $(Elemento).addClass("erro");
                $(Elemento).attr("data-valid", false);
            }

        }
    </script>
</asp:Content>




