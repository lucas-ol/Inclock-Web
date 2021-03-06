﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Ponto_Default" MasterPageFile="~/masterpage/masterpage.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="Head">
    <link href="/Scripts/jqueryUI/jquery-ui.css" rel="stylesheet" />
    <script src="/Scripts/jquery.mask.js"></script>
    <style>
        .table tbody tr:nth-child(odd) {
        }

        .table tbody tr:hover {
        }

        table {
            width: 100%;
        }

            table tbody {
                border-style: solid;
                border: 1px;
                border-color: black;
            }

                table tbody tr td {
                    border: 1px solid black;
                }

            table thead tr th {
                border: 3px solid black;
            }

        .padding-0 {
            padding-left: 0 !important;
            padding-right: 0 !important;
        }
        #vlGrupo {
            margin:auto
        }
        #vlGrupo ul > li {
            display: inline-block;
            list-style: none
        }
    </style>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Corpo">
    <div class=" container-fluid pt-3 pb-3 ">
        <asp:Panel runat="server" ID="pnlPesquisaPonto" CssClass=" form-inline mb-4 text-center">
            <div class="autowidth" style="margin: 0 auto; display: inline-flex">
                <div class="ml-1 mr-1">De</div>
                <div class="ml-1 mr-1">
                    <asp:TextBox runat="server" ID="txtDataInicio" CssClass="form-control" />
                    <asp:RegularExpressionValidator ErrorMessage=" - Data de Invalida" ControlToValidate="txtDataInicio" runat="server" ID="data1" Display="None" ValidationGroup="gpPonto" />
                    <asp:RequiredFieldValidator ErrorMessage="- Data de Invalida" ControlToValidate="txtDataInicio" runat="server" Display="None" ValidationGroup="gpPonto" />
                </div>
                <div class="ml-1 mr-1">ate</div>
                <div class="ml-1 mr-1">
                    <asp:TextBox runat="server" ID="txtDataFim" CssClass="form-control" />
                    <asp:RegularExpressionValidator ErrorMessage="- Data Ate Invalida" ControlToValidate="txtDataFim" runat="server" ID="data2" Display="None" ValidationGroup="gpPonto" />
                    <asp:RequiredFieldValidator ErrorMessage="- Data Ate Invalida" ControlToValidate="txtDataFim" runat="server" Display="None" ValidationGroup="gpPonto" />
                </div>
                <asp:LinkButton Text="Buscar" runat="server" CssClass="btn" ID="btnBuscarPontos" OnClick="btnBuscarPontos_Click" ValidationGroup="gpPonto" />
            </div>
            <div class="col-md-12">
                <asp:ValidationSummary runat="server" ForeColor="Red" HeaderText="Verique os campos" ClientIDMode="Static" ValidationGroup="gpPonto" CssClass="col-md-6" ID="vlGrupo" />
            </div>
        </asp:Panel>
        <table class="table-hover">
            <thead class="text-capitalize">
                <tr>
                    <th class="text-center" colspan="7">Fixa de Registro de frequencia - (espelho de ponto)
                    <asp:Literal Text="text" runat="server" ID="lblPeriodoHeader" /></th>
                </tr>
                <tr>
                    <td colspan="7">
                        <div class=" m-3">
                            ID:
                    <asp:Literal runat="server" ID="lblId" />
                            Nome:
                    <asp:Literal runat="server" ID="lblNome" />
                            Cargo:
                    <asp:Literal runat="server" ID="lblCargo" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="7" class="text-center" style="border: 3px solid black;">
                        <h4>Horario Normal</h4>
                    </td>
                </tr>
                <tr>
                    <th>Data</th>
                    <th>Turno</th>
                    <th>Entrada</th>
                    <th>Saída</th>
                    <th>Obs</th>
                </tr>
            </thead>
            <tbody>
                <asp:ListView runat="server" ID="lvPontos">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="txtData" /></td>
                            <td>
                                <asp:Label runat="server" ID="txtTurno" /></td>
                            <td>
                                <asp:Label runat="server" ID="txtEntrada" /></td>
                            <td>
                                <asp:Label runat="server" ID="txtSaida" /></td>
                            <td>
                                <asp:Label runat="server" ID="txtObs" /></td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </tbody>
        </table>
    </div>
    <script src="/Scripts/jqueryUI/jquery-ui.js"></script>
    <script>

        $(function () {
            var calendario = {
                changeMonth: true,
                changeYear: true,
                dayNames: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'],
                dayNamesMin: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S', 'D'],
                dayNamesShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom'],
                monthNames: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
                monthNamesShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
                nextText: 'Proximo',
                prevText: 'Anterior',
                yearRange: "-5:+5",
                dateFormat: "dd/mm/yy"
            };
            $("#<% =txtDataInicio.ClientID %>").datepicker(calendario);
            $("#<% =txtDataFim.ClientID %>").datepicker(calendario);


            $(this).mask("00/00/0000", { placeholder: "__/__/____" });


            $(this).mask("00/00/0000", { placeholder: "__/__/____" });

        })
    </script>
</asp:Content>
