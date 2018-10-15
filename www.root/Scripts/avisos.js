function Avisos() {
    self = this;
    self.APIHOST = window.appRest;
    self.CreateObjectHtml = function (avisos, dir) {
        var objects = [];
        for (var i = 0; i < avisos.length; i++) {
            let item = $('<div>').addClass('item');
            let dados = $('<div>').addClass('carousel-caption');
            $('<img>').prop('src', dir + avisos[i].Imagem).addClass('autoimg').appendTo(item);
            $('<div>').html(avisos[i].Conteudo).appendTo(dados);
            $('h3').html(avisos[i].Titulo).appendTo(dados);
            dados.appendTo(item);
            objects.push(item);
        }
        return objects;
    }
    self.GetAvisos = function (qtd, index) {
        return new Promise((resolve, reject) => {
            $.ajax({
                method: 'GET',
                url: self.APIHOST + 'getaviso/' + qtd + "/" + index,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    resolve(data);
                },
                error: function (erro, t, y, kiko) {
                    reject(kiko);
                }
            })
        });
    }
    self.Excluir = function (id, flag) {
        return new Promise((resolve, reject) => {
            $.ajax({
                method: 'DELETE',
                url: self.APIHOST + 'falta fazer/',
                data: { "id": id, "flag": flag },
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    resolve(data);
                },
                error: function (erro, x, y) {
                    reject(x);
                }
            })
        });
    }
    self.init = function () { }

}