<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Funcionario.aspx.cs" Inherits="Relatorios_Funcionario" MasterPageFile="~/masterpage/masterpage.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="Head">
    <script type="text/javascript" src="<% =ResolveUrl("~/Scripts/Chart/Chart.bundle.js") %>"></script>
    <script src="<% =ResolveUrl("/Scripts/Chart/Inclock.js") %>"></script>
    <link href="/Styles/token-input.css" rel="stylesheet" />
    <link href="/Scripts/jqueryUI/jquery-ui.css" rel="stylesheet" />
    <link href="/Scripts/jqueryUI/jquery-ui.theme.css" rel="stylesheet" />
    <script src="/Scripts/jqueryUI/jquery-ui.js"></script>
    <script src="/Scripts/jquery.mask.js"></script>
    <script src="/Scripts/jquery.tokeninput.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Corpo">
    <div class=" col-sm-8 m-auto">
        <div class="form-group form-inline">
            <div class="col-lg-3  col-sm-3 mt-1">
                <label class="d-block">Funcionario</label>
                <asp:TextBox runat="server" ID="txtFuncionario" CssClass="form-control" placeholder="Nome do funcionario" ClientIDMode="Static" />
            </div>
            <div class="col-lg-3 col-md-4 col-sm-3">
                <label class="d-inline-block" for="txtDataDe">De</label>
                <input type="text" name="name" value="" class="form-control w-100 calendario" id="txtDataDe" />
            </div>
            <div class="col-lg-3 col-md-4 col-sm-3">
                <label class="d-inline-block" for="txtDataAte">Ate</label>
                <input type="text" name="ki" value="" class="form-control w-100 calendario" id="txtDataAte" />
            </div>
            <div class="col-lg-3 col-md-2 col-sm-3">
                <input type="submit" name="name" value="Pesquisar" id="btnPesquisar" class="form-control btn btn-outline-success mt-4" />
            </div>
        </div>
    </div>
    <div class="col-md-10 m-auto">
        <canvas id="canvas" class="rlPonto"></canvas>
    </div>

    <script>
        var factory = new ChartFactory();
        $('#txtFuncionario').tokenInput('/api/funcionario/Get', {
            tokenLimit: 1
        })
        $(function () {
            CALENDARIO.dateFormat = 'dd-mm-yy';
            $(".calendario").datepicker(CALENDARIO);
            $(".calendario").mask("00-00-0000", { placeholder: "__-__-____" });

            factory.onInit();
        })
        $('#btnPesquisar').on('click', function () {
            if (validateDate($('#txtDataDe')[0]) && validateDate($('#txtDataAte')[0])) {
                factory.Ajax({}, 'GET', window.appRest + "basicInformation/" + $('#txtDataDe').val() + "/" + $('#txtDataAte').val() + "/0", [factory.AtualizarRLPonto], $('#canvas'));
            }
        });
    </script>
</asp:Content>
