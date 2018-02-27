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
    </style>
    <link href="/Scripts/jqueryUI/jquery-ui.css" rel="stylesheet" />
    <script src="/Scripts/jqueryUI/jquery-ui.js"></script>
    <script src="/Scripts/jquery.mask.js"></script>
    <script src="/Scripts/cadastrofuncionario.js"></script>
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
    <asp:HiddenField runat="server" ID="txtValido" Value="false"></asp:HiddenField>

    <div class=" container pt-5">
        <div class="form-group">
            <div class=" form-inline">
                <label for="Corpo_txtNome" class="col-sm-1">Nome*</label>
                <div class=" col-sm-5">
                    <asp:TextBox runat="server" ID="txtNome" placeholder="Nome Completo" CssClass="CampoOk form-control col" data-valid="false"></asp:TextBox>
                </div>
                <label for="Corpo_txtCargo" class="col-sm-1">Cargo*</label>
                <div class=" col-sm-5">
                    <asp:DropDownList runat="server" ID="txtCargo" CssClass="CampoOk form-control" data-valid="false"></asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-inline">
                <label for="Corpo_txtRg" class="col-sm-1">RG*</label>
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="txtRg" CssClass="CampoOk form-control" data-valid="false"></asp:TextBox>
                </div>
                <label for="Corpo_txtCpf" class="col-sm-1">CPF*</label>
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="txtCpf" CssClass="CampoOk form-control" data-valid="false"></asp:TextBox>
                </div>

                <label class="col-sm-1">sexo*</label>
                <div class=" col-md-3">
                    <asp:Panel ID="pnlsexo" runat="server" CssClass="CampoOk form-control  " data-valid="false">
                        <div class="form-inline ">

                            <asp:RadioButton Text="Masculino" runat="server" GroupName="radionsexo" ID="txtSexoMasculino"></asp:RadioButton>
                            <div style="width: 4%"></div>
                            <asp:RadioButton Text="Feminino" runat="server" GroupName="radionsexo" ID="txtSexoFeminino"></asp:RadioButton>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-inline">
                <label for="Corpo_txtAniversario" class="col-sm-1">Nacimento*</label>
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="txtAniversario" CssClass="CampoOk form-control " data-valid="false"></asp:TextBox>
                </div>

                <label for="Corpo_txtEmail" class="col-sm-1">Email*</label>
                <div class="col-md-7">
                    <div class="input-group">
                        <span class="input-group-addon">@</span><asp:TextBox runat="server" ID="txtEmail" TextMode="Email" placeholder="exemple@exemple.com" CssClass="CampoOk form-control" data-valid="false"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-inline">
                <label for="Corpo_txtCep" class="col-sm-1">CEP*</label>
                <div class="col-md-2">
                    <asp:TextBox runat="server" ID="txtCep" CssClass="CampoOk form-control" data-valid="false"></asp:TextBox>
                </div>


                <label for="Corpo_txtCidade" class="col-sm-1">Cidade*</label>
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="txtCidade" CssClass="CampoOk form-control" data-valid="false"></asp:TextBox>
                </div>

                <label for="Corpo_txtEstado" class="col-sm-1">Estado*</label>
                <div class="col-md-4">
                    <asp:DropDownList ID="txtEstado" runat="server" CssClass="CampoOk form-control custom-select" data-valid="false">
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
                    <asp:TextBox runat="server" ID="txtEndereco" placeholder="Av. Monte Belo SP " CssClass="CampoOk form-control" data-valid="false"></asp:TextBox>
                </div>

                <label for="Corpo_txtNumeroCasa" class="col-sm-1">Nº*</label>
                <div class="col-md-2">
                    <asp:TextBox runat="server" ID="txtNumeroCasa" placeholder="1230" CssClass="CampoOk form-control" data-valid="false"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-inline">
                <label for="Corpo_txtTelefone" class="col-sm-1">Telefone*</label>
                <div class="col-md-5">
                    <asp:TextBox runat="server" ID="txtTelefone" TextMode="Phone" placeholder="(11) 1111-1111" CssClass="CampoOk form-control" data-valid="false"></asp:TextBox>
                </div>

                <label for="Corpo_txtCelular" class="col-sm-1">Celular</label>
                <div class="col-md-5">
                    <asp:TextBox runat="server" ID="txtCelular" MaxLength="15" TextMode="Phone" placeholder="(11) 11111-1111" CssClass="CampoOk form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-inline">
                <label for="Corpo_txtLogin" class="col-sm-1">Login</label>
                <div class="col-md-5">
                    <asp:TextBox runat="server" ID="txtLogin" CssClass="CampoOk form-control" data-valid="false" MaxLength="10"></asp:TextBox>
                </div>
                <label for="Corpo_txtSenha" class="col-sm-1">Senha</label>
                <div class="col-md-5">
                    <asp:TextBox runat="server" ID="txtSenha" CssClass="CampoOk form-control " data-valid="false" TextMode="Password" MaxLength="8"></asp:TextBox>
                </div>
            </div>
        </div>
        <!--   <input type="button" id="btnCadastrar" value="Cadastrar" /> -->
        <div class=" form-group">
            <div class="form-inline">
                <div class="col-md-12">
                    <asp:Button runat="server" ID="btnCadastrar" Text="Cadastrar" OnClick="btnCadastrar_Click" CssClass="btn btn-secondary btn-outline-success align-content-center" />
                </div>
                <uc:alerta runat="server" ID="alerta"></uc:alerta>
            </div>
        </div>
        <div>
            <button data-target="#cadastrar_expediente" data-toggle="modal" type="button" class="btn btn-secondary btn-outline-danger" runat="server" visible="false" id="btnCadastraExpediente">Cadastrar Expediente</button>
            <uc:ExpedienteCadastrar runat="server" ID="ucExpCadastrar" Visible="false"  />
            <uc:ExpedienteListar runat="server" ID="ucExpListar" Visible="false" />
            
        </div>

    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>




