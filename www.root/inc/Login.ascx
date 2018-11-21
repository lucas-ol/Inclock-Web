<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Login.ascx.cs" Inherits="inc_Login" %>

<link href="/Styles/lib/bootstrap/bootstrap.css" rel="stylesheet" />
<asp:LinkButton Text="Sair" runat="server" ID="btnLogout" OnClick="btnLogout_Click" CssClass=" login-button" />
<asp:Panel runat="server" ID="login">
    <a href="#" class="login-button" data-target="#loginModal" data-toggle="modal">Logar</a>
    <asp:Panel runat="server" ID="pnlLogin" DefaultButton="btnLogar">
        <div class="modal fade" id="loginModal" data-modal="login">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <h4 class="modal-title">Login</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-selected="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <asp:TextBox runat="server" ID="txtLogin" CssClass="form-control m-1" placeholder="Login" />

                        <asp:TextBox runat="server" ID="txtSenha" CssClass="form-control m-1 " placeholder="Senha" TextMode="Password" />

                    </div>
                    <div class="modal-body">
                        <div class="text-center alert alert-info w-100" runat="server" visible="false" id="lblMensagem">
                        </div>
                        <button type="button" class="btn btn-outline-danger " value="Cancelar" data-dismiss="modal">Cancelar</button>
                        <asp:Button Text="Logar" runat="server" CssClass="btn btn-outline-success float-lg-right" ID="btnLogar" OnClick="btnLogar_Click" />
                    </div>

                    <!-- aqui-->
                </div>
            </div>
        </div>
    </asp:Panel>

    <script>
        $(function () {
            if (<% =FlagMostraModal %>) {
                $('#loginModal').modal('show');
            }
        });
    </script>
</asp:Panel>
