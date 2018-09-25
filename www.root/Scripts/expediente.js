$(function () {
    var rcp = new expediente($('#hddIdFuncionario').val());
})
var expediente = function (func) {
    self = this;
    self.APIHOST = "http://localhost:64241/Service.svc/rest/";
    self.funcionario = parseInt(func);
    self.integracao = "";
    self.sucess = function (data) {
        if (data.Status) {
            alert(data.Mensagem);
            window.location.href = window.location.href;
        }
        else {
            $('#lblmsg').html($('<div style="display:none">').addClass('alert alert-danger').text(data.Mensagem))
            $('.alert.alert-danger').slideToggle(800);
            $('.alert.alert-danger').delay(5000).slideToggle(1000);
        }
    }
    self.error = function () {

    }
    self.Excluir = function (id, container) {
        $('#exp-loader').addClass('active');
        $.ajax({
            method: 'DELETE',
            url: '',
            data: { id: id },
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            headers: { integracao: self.integracao },
            complete: function () {
                $('#exp-loader').removeClass('active');
            },
            success: function (data) {
                self.sucess(container, JSON.parse(data));
            },
            error: function (erro) {
                $('#exp-loader').removeClass('active');
            }
        })
    }
    self.Castrar = function () {
        $('#exp-loader').addClass('active');
        $.ajax({
            method: 'POST',
            url: self.APIHOST + '/CadastrarExpediente',
            data: JSON.stringify(self.CriaObjeto()),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            headers: { integracao: self.integracao },
            complete: function () {
                $('#exp-loader').removeClass('active');
            },
            success: function (data) {
                self.sucess(data);
            },
            error: function (erro) {
                $('#exp-loader').removeClass('active');
                var er = erro;
                self.sucess({ Status: false, Mensagem: 'Erro ao enviar solicitação' });
            }
        })
    }
    self.ValidaDados = function () {
        
        var valid = self.ValidaHorasTrabalhada();

        if (valid) {
            $('.erro').removeClass('erro')
            if ($('#txtEntrada').val() === "") {
                $('#txtEntrada').addClass('erro');
                valid = false;
            }
            if ($('#txtSaida').val() === "") {
                $('#txtSaida').addClass('erro')
                valid = false;
            }
            if ($('#ddlDiaSemana').val() === "") {
                $('#ddlDiaSemana').addClass('erro')
                valid = false;
            }
            if (!valid)
                self.sucess({ Status: false, Mensagem: 'Corrija o campos destacados em vermelho' });
        }
       

        return valid
    }
    self.CriaObjeto = function () {
        var json = {
            Id: $('#hhdIdExpediente').val(),
            Funcionario_id: self.funcionario,
            Entrada: $('#txtEntrada').val(),
            Saida: $('#txtSaida').val(),
            DiaSemana: $('#ddlDiaSemana').val()
        }
        return json;
    }
    self.ValidaHorasTrabalhada = function () {
        $('#lblmsg').empty();
        if ($('#txtEntrada').val() === '' || $('#txtEntrada').val() === '')
            return;
        var valid = true;
        var saida = parseFloat($('#txtSaida').val());
        var entrada = parseFloat($('#txtEntrada').val());
        var horas = Math.abs((entrada - saida) - 24);
        if (horas >= 24)
            horas = Math.abs(saida - entrada);
        if (horas < 1) {
            valid = false;
            self.sucess({ Status: false, Mensagem: 'O intervalo da entrada e saida deve ser maior que 01:00' });
        }
        else if (horas > 10) {
            valid = false;
            self.sucess({ Status: false, Mensagem: 'O funcionario não deve trabalhar mais de 10 horas' });
        }
        return valid;
    }
    $('.cadastrar-expediente').on('click', function () {
        if (self.ValidaDados()) {
            self.Castrar();
        }
    })

    $('#txtEntrada , #txtSaida').on('change', function () {
        self.ValidaHorasTrabalhada();
    });

    self.onInit = function () {
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
