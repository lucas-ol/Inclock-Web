
var expediente = function (func) {
    self = this;
    self.funcionario = parseInt(func);
    self.sucess = function (container, data) {
        if (data.Status) {
            alert('O expediente foi deleteado com sucesso');
            window.location.href = window.location.href;
        }
        else
            $(container).text(data.Mensagem);
    }
    self.error = function () {

    }
    self.Excluir = function (id, container) {
        $(container).find('.load').addClass('loading');
        $.ajax({
            method: 'DELETE',
            url: '',
            data: { id: id },
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            complete: function () { }
        }).complete(function () {
            $(container).find('.load').removeClass('loading');
        }).success(function (data) {
            self.sucess(container, JSON.parse(data));
        }).error(function (erro) {
            $(container).find('.load').removeClass('loading');
        })

    }

}
