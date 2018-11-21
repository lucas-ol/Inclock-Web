$(function () {
    var pont = new Ponto();
});
var Ponto = function () {
    self = this;   
    self.api = window.appRest;
    self.baterPonto = function (type) {
        self.FuncionarioLogado().then(function (dados) {
            $.ajax({
                method: 'POST',
                url: appRest + "CheckPoint",
                data: JSON.stringify({ funcionario: dados.toString(), type: type }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                headers: { integracao: window.integracao },
                success: function (data) {
                    console.log(data);
                },
                error: function (x, y, z) {
                    console.log(x);
                    console.log(y);
                    console.log(z);
                }
            });

        }, function (erro) {
            console.log(erro);
        });
    };
    self.FuncionarioLogado = function () {
        return new Promise(resolve => {
            $.ajax({
                method: 'GET',
                url: '/api/funcionario/GetUsuarioLogado',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    resolve(data);
                },
                error: function (erro, textStatus, naosei) {
                    resolve(textStatus);
                }
            });
        });
    };
    self.onInit = function () {
        $('#btnEntrada').on('click', function () { self.baterPonto('E'); });
        $('#btnSaida').on('click', function () { self.baterPonto('S'); });      
    };
    self.onInit();
};