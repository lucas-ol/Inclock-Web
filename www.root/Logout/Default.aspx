<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Logout_Default" MasterPageFile="~/masterpage/masterpage.Master" %>


<asp:Content runat="server" ContentPlaceHolderID="Head">
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Corpo">
    <div class="col-md-6 m-auto">       
         <table class="table table-hover ">
            <caption>Usuarios Logados no sistema mobile</caption>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>nome</th>
                </tr>
            </thead>
            <tbody>
                <asp:ListView runat="server" ID="lvMobile">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label Text="text" runat="server" ID="txtId" /></td>
                             <td>
                                <asp:Label Text="text" runat="server" ID="txtNome"/></td>
                            <td>
                                <asp:Button Text="Desconectar" runat="server" CommandName="desconectar" CommandArgument="" ID="btnDesconectar" CssClass="btn btn-outline-info" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </tbody>
        </table>
         <table class="table">
            <caption>Usuarios Logados no sistema Web</caption>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>nome</th>
                </tr>
            </thead>
            <tbody>
                <asp:ListView runat="server" ID="lvWeb">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label Text="text" runat="server" ID="txtId" /></td>
                             <td>
                                <asp:Label Text="text" runat="server" ID="txtNome"/></td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </tbody>

        </table>
    </div>
</asp:Content>
