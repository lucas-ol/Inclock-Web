var MONTHS = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro '];
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
                //var data = JSON.stringify(dataa);                
                callback[0](data, canvas);
            },
            error: function (x, y, z) {

            }
        });
    };
    self.AtualizarRLPonto = function (data) {
        var labels = data.map(function (e) {
            var dt = new Date(e.DataEntrada);
            return dt;
        });
        var dados = data.map(function (e) {
            return e.age;
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

    self.PreencherTabela = function () {

    };
};

