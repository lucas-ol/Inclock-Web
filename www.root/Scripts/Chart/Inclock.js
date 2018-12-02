var MONTHS = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro '];
var dta = {};
var ChartFactory = function (container) {
    self = this;
    self.appUrl = "";
    self.Ajax = function (data, method, url, callback, canvas) {
        $.ajax({
            method: method.lenth > 0 ? method : "GET",
            url: url,
            data: data,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            headers: { integracao: window.integracao },
            success: function (data) {
                dta = data;
                callback[0](data);
            },
            error: function (x, y, z) {

            }
        });
    };
    self.AtualizarRLPonto = function (data) {
        self.PreencherTabela(data);
        var labels = data.map(function (e) {
            var dt = new Date(e.DataEntrada);
            return dt;
        });
        var entrada = data.map(function (e) {
            if (e.Entrada) {
                return e;
            }
        });
    };
    self.GerarRLPonto = function (canvas) {

        var ctx = $(canvas)[0].getContext('2d');
        var grafico = {
            labels: MONTHS.slice(0, 6),
            datasets: [{
                label: 'Entrada',
                backgroundColor: "rgba(7,4,5,0.2)",
                borderColor: "rgba(255, 99, 132, 0.5)",
                borderWidth: 1,
                data: [
                    0
                ]
            },
            {
                label: 'Saida',
                backgroundColor: "rgba(7,4,5,0.2)",
                borderColor: "rgba(255, 99, 132, 0.5)",
                borderWidth: 1,
                data: [
                    0
                ]
            },
            {
                label: 'Atrasos',
                backgroundColor: "rgba(7,4,5,0.2)",
                borderColor: "rgba(255, 99, 132, 0.5)",
                borderWidth: 1,
                data: [
                    0
                ]
            },
            {
                label: 'Faltas',
                backgroundColor: "rgba(7,4,5,0.2)",
                borderColor: "rgba(255, 99, 132, 0.5)",
                borderWidth: 1,
                data: [
                    0
                ]
            }]
        };
        var options = {
            type: "bar",
            data: grafico,
            options: {
                responsive: true,
                legend: {
                    position: 'top'
                },
                title: {
                    display: true,
                    text: 'faltas por Mes'
                }
            }
        };
        window.RLPonto = new Chart(ctx, options);
    };
    self.onInit = function () {
        self.GerarRLPonto($('.rlPonto'));
    };

    self.PreencherTabela = function (data) {
        $('#txtEntradasRegistradas').text(data.Informacoes.reduce(function (acumulado, item) { if (item.Tipo === 'Entrada') { return acumulado + item.Qtde; } else return acumulado + 0; }, 0));
        $('#txtSaidaRegistradas').text(data.Informacoes.reduce(function (acumulado, item) { if (item.Tipo === 'Saida') { return acumulado + item.Qtde; } else return acumulado + 0; }, 0));
        $('#txtAtrasosRegistrados').text(data.Informacoes.reduce(function (acumulado, item) { if (item.Tipo === 'Atrasos') { return acumulado + item.Qtde; } else return acumulado + 0; }, 0));
        $('#txtFaltasRegistradas').text(data.Informacoes.reduce(function (acumulado, item) { if (item.Tipo === 'Faltas') { return acumulado + item.Qtde; } else return acumulado + 0; }, 0));
    };
};

