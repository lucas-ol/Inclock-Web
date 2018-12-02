var MONTHS = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro '];
var Cores = { "verde": 'rgb(40, 167, 69)', 'vermelho': 'rgb(255, 99, 132)', 'laranja': 'rgb(255, 159, 64)', 'azul': 'rgb(54, 162, 235)' };
var color = Chart.helpers.color;
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
                callback[0](data);
            },
            error: function (x, y, z) {

            }
        });
    };
    self.AtualizarRLPonto = function (data) {
        self.PreencherTabela(data);

        var Entrada = data.Pontos.filter(function (e) {
            if (e.Entrada) {
                return e;
            }
        });
        var Saida = data.Pontos.filter(function (i) {
            if (i.Saida) {
                return i;
            }
        });
        var Atrasos = data.Pontos.filter(function (i) {
            if (i.Atraso) {
                return i;
            }
        });
        var Faltas = data.Pontos.filter(function (i) {
            if (i.Entrada === "" && i.Saida === "") {
                return i;
            }
        });
        window.bto = Faltas;
        /* Faz uma contagem das entradas por mes*/
        window.RLPonto.data.datasets[0].data = MONTHS.map(function (val, index) {
            return Entrada.reduce(function (soma, item) {
                var dt = item.DataEntrada.split("/");
                var dta = new Date(dt[2], dt[1], dt[0]);
                dta.setMonth(dta.getMonth() - 1);
                if (dta.getMonth() === index) {
                    return soma + 1;
                }
                else
                    return soma + 0;
            }, 0);
        });
        /*Saidas*/
        window.RLPonto.data.datasets[1].data = MONTHS.map(function (val, index) {
            return Saida.reduce(function (soma, item) {
                var dt = item.DataEntrada.split("/");
                var dta = new Date(dt[2], dt[1], dt[0]);
                dta.setMonth(dta.getMonth() - 1);
                if (dta.getMonth() === index) {
                    return soma + 1;
                }
                else
                    return soma + 0;
            }, 0);
        });
        /*Atraso*/
        window.RLPonto.data.datasets[2].data = MONTHS.map(function (val, index) {
            return Atrasos.reduce(function (soma, item) {
                var dt = item.DataEntrada.split("/");
                var dta = new Date(dt[2], dt[1], dt[0]);
                dta.setMonth(dta.getMonth() - 1);
                if (dta.getMonth() === index) {
                    return soma + 1;
                }
                else
                    return soma + 0;
            }, 0);
        });
        /*Faz uma falta */
         window.RLPonto.data.datasets[3].data = MONTHS.map(function (val, index) {
            return Faltas.reduce(function (soma, item) {
                var dt = item.DataEntrada.split("/");
                var dta = new Date(dt[2], dt[1], dt[0]);
                dta.setMonth(dta.getMonth() - 1);
                if (dta.getMonth() === index ) {
                    return soma + 1;
                }
                else
                    return soma + 0;
            }, 0);
        });
        window.RLPonto.update();
    };
    self.GerarRLPonto = function (canvas) {

        var ctx = $(canvas)[0].getContext('2d');
        var grafico = {
            labels: MONTHS,
            datasets: [{
                label: 'Entrada',
                backgroundColor: color(Cores.azul).alpha(0.5).rgbString(),
                borderColor: Cores["azul"],
                borderWidth: 1,
                data: [
                    0
                ]
            },
            {
                label: 'Saida',
                backgroundColor: color(Cores["verde"]).alpha(0.5).rgbString(),
                borderColor: Cores["verde"],
                borderWidth: 1,
                data: [
                    0
                ]
            },
            {
                label: 'Atrasos',
                backgroundColor: color(Cores["laranja"]).alpha(0.5).rgbString(),
                borderColor: Cores["laranja"],
                borderWidth: 1,
                data: [
                    0
                ]
            },
            {
                label: 'Faltas',
                backgroundColor: color(Cores["vermelho"]).alpha(0.5).rgbString(),
                borderColor: Cores["vermelho"],
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
                    text: 'Grafico'
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

