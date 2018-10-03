$(function () {
    var pont = new Ponto();
});
var Ponto = function () {
    self = this;
    self.integracao = "";
    self.api = window.appRest;
    self.baterPonto = function (type) {
        self.FuncionarioLogado().then(function (dados) {
            $.ajax({
                method: 'POST',
                url: appRest + "CheckPoint",
                data: JSON.stringify({ funcionario: dados.toString(), type: type }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                headers: { integracao: self.integracao },      
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
            console.log(erro)
        });
    }    
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
                    resolve(textStatus)
                }
            })
        });
    }
    self.onInit = function () {
        $('#btnEntrada').on('click', function () { self.baterPonto('E') });
        $('#btnSaida').on('click', function () { self.baterPonto('S') });

        var cook = document.cookie;
        var nome = 'integracao=';
        var co = cook.substr(cook.indexOf(nome) + nome.length)
        if (co.indexOf(';') < 0)
            self.integracao = co;
        else
            self.integracao = co.substr(0, co.indexOf(';'));
    }
    self.onInit();
}