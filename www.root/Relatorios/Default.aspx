<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Relatorios_Default" MasterPageFile="~/masterpage/masterpage.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="Head">
    <script type="text/javascript" src="<% =ResolveUrl("~/Scripts/Chart/Chart.bundle.js") %>"></script>
    <script src="<% =ResolveUrl("/Scripts/Chart/Inclock.js") %>"></script>
    <style>
        .chart {
        }
    </style>
    <link href="/Scripts/jqueryUI/jquery-ui.css" rel="stylesheet" />
    <link href="/Scripts/jqueryUI/jquery-ui.theme.css" rel="stylesheet" />
    <script src="/Scripts/jqueryUI/jquery-ui.js"></script>
    <script src="/Scripts/jquery.mask.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Corpo">
    <div class="row">
        <div class=" col-sm-8 m-auto">
            <div class="form-group form-inline">
                <div class="col-lg-3  col-sm-3"></div>
                <div class="col-lg-3 col-md-4 col-sm-3">
                    <label class="d-inline-block" for="txtDataDe">De</label>
                    <input type="text" name="name" value="" class="form-control w-100 calendario" id="txtDataDe" />
                </div>
                <div class="col-lg-3 col-md-4 col-sm-3">
                    <label class="d-inline-block" for="txtDataAte">Ate</label>
                    <input type="text" name="name" value="" class="form-control w-100 calendario" id="txtDataAte" />
                </div>
                <div class="col-lg-3 col-md-2 col-sm-3">
                    <input type="button" name="name" value="Pesquisar" id="btnPesquisar" class="form-control btn btn-outline-success mt-1" />
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div>
                <table>
                    <thead>
                        <tr>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Quantidade De Entradas:</td>
                            <td><span id="txtEntradasRegistradas"></span></td>
                        </tr>
                        <tr>
                            <td>Quantidade de Saidas:</td>
                            <td><span id="txtSaidaRegistradas"></span></td>
                        </tr>
                        <tr>
                            <td>Quantidade de Atrasos:</td>
                            <td><span id="txtAtrasosRegistrados"></span></td>
                        </tr>
                        <tr>
                            <td>Quantidade de Faltas</td>
                            <td><span id="txtFaltasRegistradas"></span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="col-md-6 m-auto">
        <canvas id="canvas" class="rlPonto"></canvas>
    </div>

    <script>
        var factory = new ChartFactory();
        $(function () {
            factory.onInit();
            factory.Ajax({}, 'GET', window.appRest + "getpoint/10-06-1996/01-11-2018/5", [factory.AtualizarRLPonto], $('#canvas'));
        })
    </script>
</asp:Content>
