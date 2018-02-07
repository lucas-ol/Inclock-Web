<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Logar.ascx.cs" Inherits="inc_Login_Logar" %>

<style></style>
   <a class=" alert-link " href="#" data-toggle="modal" data-target="#login" id="btnLogin"><i class="fa fa-user" aria-hidden="true"></i></a>
<asp:Panel runat="server" ID="pnlLogin" DefaultButton="btnLogar">
    <div class=" modal fade" id="login" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title">Logar-se</h1>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body m-2">
                    <asp:TextBox runat="server" ID="txtLogin" CssClass="form-control" placeholder="Login" />
                    <asp:TextBox runat="server" ID="txtSenha" CssClass="form-control " placeholder="Senha" />
                    <asp:Button Text="Entrar" runat="server" ID="btnLogar" CssClass="btn btn-outline-success w-100" />
                </div>
                <div class="modal-body">
                    <button type="button" class="btn btn-dark">Cancelar</button>
                </div>
            </div>
        </div>
    </div>
</asp:Panel>
<link href="../../Styles/lib/bootstrap/bootstrap.css" rel="stylesheet" />
