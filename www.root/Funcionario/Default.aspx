﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Funcionario_Default" MasterPageFile="~/masterpage/masterpage.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="Head">
   
    <style>
        .table tbody tr:nth-child(odd) {
            background-color: rgba(190, 190, 190, 0.86);
        }

    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Corpo">  

    <div class="col-12 pt-3">
        <div class="form-check-inline"></div>
        <div class="input-group">
            <asp:TextBox runat="server" ID="txtPesquisaFuncionario" CssClass="form-control w-100" />
            <asp:LinkButton Text="text" runat="server" CssClass="input-group-addon" ID="btnpesquisapessoa" OnClick="btnpesquisapessoa_Click"><img  src="/Img/Icons50px/icons8-Search.png" /> </asp:LinkButton>
        </div>
    </div>
    <div class="col-12">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>#</th>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Cargo</th>
                    <th>RG</th>
                    <th>CPF</th>
                    <th>Quantidade de expediente</th>
                </tr>
            </thead>
            <asp:ListView runat="server" ID="lvPessoas">
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Literal Text="text" runat="server" ID="linha" /></td>
                        <td>
                            <asp:Literal Text="text" runat="server" ID="id" /></td>
                        <td>
                            <asp:Literal Text="text" runat="server" ID="nome" /></td>
                        <td>
                            <asp:Literal Text="text" runat="server" ID="cargo" /></td>
                        <td>
                            <asp:Literal Text="text" runat="server" ID="CPF" /></td>
                        <td>
                            <asp:Literal Text="text" runat="server" ID="RG" /></td>
                        <td>
                            <asp:Literal Text="text" runat="server" ID="qtdecargo" /></td>
                        <td>
                            <asp:HyperLink NavigateUrl="navigateurl" runat="server" ID="hplEditar" Text="Editar" />
                        </td>
                          <td>
                            <asp:HyperLink NavigateUrl="navigateurl" runat="server" ID="hplRelatorio" Text="Pontos" />
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </table>
        <div id="paginacao" runat="server">
            <asp:DataPager runat="server" ID="dprpessoas" PageSize="2" QueryStringField="pagina" PagedControlID="lvPessoas" ClientIDMode="Static" EnableViewState="false">
                <Fields>
                    <asp:NextPreviousPagerField
                        ShowFirstPageButton="true"
                        ShowNextPageButton="False"
                        ShowPreviousPageButton="True"
                        PreviousPageText="<" FirstPageText="Primeira" />
                    <asp:NumericPagerField ButtonCount="4" ButtonType="Button" />
                    <asp:NextPreviousPagerField
                        ShowLastPageButton="true"
                        LastPageText="ultima"
                        ShowNextPageButton="True"
                        ShowPreviousPageButton="False"
                        NextPageText=">" />
                </Fields>
            </asp:DataPager>
        </div>
    </div>   
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="footer">
    <script>
        $(function () {

        })
    </script>
</asp:Content>

