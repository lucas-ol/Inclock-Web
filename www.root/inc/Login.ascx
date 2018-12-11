<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Login.ascx.cs" Inherits="inc_Login" %>

<link href="/Styles/lib/bootstrap/bootstrap.css" rel="stylesheet" />
<asp:LinkButton Text="Sair" runat="server" ID="btnLogout" OnClick="btnLogout_Click" CssClass=" login-button" />
<asp:Panel runat="server" ID="login">
    <a href="javascript:void(0)" onclick="CriarUrlLogin()" class="login-button" data-toggle="modal">Logar</a>
    <asp:Panel runat="server" ID="pnlLogin" DefaultButton="btnLogar">
        <div class="modal fade" id="loginModal" data-modal="login">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Login</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-selected="true">&times;</button>
                    </div>
                    <div class="modal-body" id="mbLogin">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" ID="txtLogin" CssClass="form-control m-1" placeholder="Login" />
                                <asp:TextBox runat="server" ID="txtSenha" CssClass="form-control m-1 " placeholder="Senha" TextMode="Password" />
                                <a href="javascript:void(0)" class="float-right" style="margin-bottom: 20px" id="btnTrocaModal">Esqueci a senha</a>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="text-center alert alert-info w-100" runat="server" visible="false" id="lblMensagem">
                                </div>
                                <button type="button" class="btn btn-outline-danger " value="Cancelar" data-dismiss="modal">Cancelar</button>
                                <asp:Button Text="Logar" runat="server" CssClass="btn btn-outline-success float-lg-right" ID="btnLogar" OnClick="btnLogar_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="modal-body" id="mbEsqueci" style="display: none">
                        <p>Informe o email cadastrado</p>
                        <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control m-1" placeholder="Email" />
                        <asp:RegularExpressionValidator ErrorMessage="Email Invalido" ValidationExpression="^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$" ControlToValidate="txtEmail" runat="server" ValidationGroup="esqueci" ForeColor="Red" Display="Dynamic" />
                        <asp:RequiredFieldValidator ErrorMessage="Informe um email" ControlToValidate="txtEmail" runat="server" ValidationGroup="esqueci" ForeColor="Red" Display="Dynamic" />
                        <div class="row pt-2">
                            <div class="col-md-12">
                            </div>
                            <button type="button" class="btn btn-outline-warning" value="Voltar" id="btnMostraLogin">Voltar</button>
                            <asp:Button Text="Enviar" runat="server" CssClass="btn btn-outline-success float-lg-right" ID="btnEsqueci" ValidationGroup="esqueci" OnClick="btnEsqueci_Click" />
                            </div>
                        </div>
                    </div>
                    <!-- aqui-->
                </div>
            </div>
        </div>
    </asp:Panel>

    <script>
        $(function () {
            if ('<% =FlagMostraModal %>' == "True") {
                $('#loginModal').modal('show');
            }
            $('#btnTrocaModal').on('click', function () {
                $('#mbLogin').slideToggle("slow", function () {
                    $('#mbEsqueci').slideToggle("slow");
                });

            });
            $('#btnMostraLogin').on('click', function () {
                $('#mbEsqueci').slideToggle("slow", function () {
                    $('#mbLogin').slideToggle("slow");
                });
            })
        });
        function CriarUrlLogin() {
            window.location.href = window.location.href + window.location.href.indexOf('?') >= 0 ? '&' : '?' + 'logar=true';
        }
    </script>
</asp:Panel>
