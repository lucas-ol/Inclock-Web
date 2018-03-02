<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Login.ascx.cs" Inherits="inc_Login" %>

<div class="modal fade" id="loginModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Login</h4>
                <button type="button" class="close" data-dismiss="modal" aria-selected="true">&times;</button>
            </div>
            <div class="modal-body">
                <div class="col-md-12">
                    <asp:TextBox runat="server" ID="txtLogin" placeholder="Login" />
                </div>
                <div class="col-md-12">
                    <asp:TextBox runat="server" ID="txtSenha" placeholder="Senha" />
                </div>
            </div>
        </div>
    </div>
</div>
