function Avisos() {
    self = this;
    self.GetAvisos = function () {
        $.ajax({
            method: 'POST',
            url: self.APIHOST + '/getaviso/10',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            complete: function () {
                $('#exp-loader').removeClass('active');
            },
            success: function (data) {
                self.sucess(data);
            },
            error: function (erro) {
                $('#exp-loader').removeClass('active');
                var er = erro;
            }
        });
    }
    self.init = function () { }

}