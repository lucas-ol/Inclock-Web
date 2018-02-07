$(function () {

    $("#Corpo_txtAniversario").datepicker({
        changeMonth: true,
        changeYear: true,
        dayNames: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'],
        dayNamesMin: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S', 'D'],
        dayNamesShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom'],
        monthNames: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
        monthNamesShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
        nextText: 'Proximo',
        prevText: 'Anterior',
        yearRange: "-100:+0",
        dateFormat: "d/m/yy"
    });
    $("#Corpo_txtAniversario").keypress(function () {
        $(this).mask("00/00/0000", { placeholder: "__/__/____" });
    });

    /*Eventos keypress que vai inserir a mascara em alguns campos */
    /*Mascara do cep */
    $("#Corpo_txtCep").keypress(function () {
        $(this).mask("00.000-000");
    });
    /*Mascara do telefone */
    $("#Corpo_txtTelefone").keypress(function () {
        $(this).mask("(00) 0000-0000");
    });
    /*Mascara do celular */
    $("#Corpo_txtCelular").keypress(function () {
        $(this).mask("(00) 00000-0000");
    });
    /*Mascara do Numero da Casa */
    $("#Corpo_txtNumeroCasa").keypress(function () {
        $(this).mask("0000");
    });
    /*Mascara do cpf*/
    $("#Corpo_txtCpf").keypress(function () {
        $(this).mask("000.000.000-00");
    });
    $("#Corpo_txtRg").keypress(function () {
        $(this).mask("00.000.000-0");
    });


    $("#Corpo_txtNome").focusout(function () {
        FormataCamposValidados($(this), $(this).val().length >= 5);
        ValidaDados();
    });
    /* troca data valid*/
    $("#Corpo_txtCep").focusout(function () {
        FormataCamposValidados($(this), $(this).val().length >= 8);
        ValidaDados();
    });
    /* troca data valid*/
    $("#Corpo_txtCidade").focusout(function () {
        FormataCamposValidados($(this), $(this).val().length >= 5);
        ValidaDados();
    });
    /* troca data valid*/
    $("#Corpo_txtEndereco").focusout(function () {
        FormataCamposValidados($(this), $(this).val().length >= 5);
        ValidaDados();
    });
    /* troca data valid*/
    $("#Corpo_txtNumeroCasa").focusout(function () {
        FormataCamposValidados($(this), $(this).val().length > 0);
        ValidaDados();
    });
    /* troca data valid*/
    $("#Corpo_txtTelefone").focusout(function () {
        FormataCamposValidados($(this), $(this).val().length >= 14);
        ValidaDados();
    });
    /* troca data valid*/
    $("#Corpo_txtCelular").focusout(function () {
        FormataCamposValidados($(this), $(this).val().length >= 15);
        ValidaDados();

    });
    /* troca data valid*/
    $("#Corpo_pnlsexo").click(function () {
        FormataCamposValidados($(this), ($("#Corpo_txtSexoMasculino")[0].checked || $("#Corpo_txtSexoFeminino")[0].checked));
        ValidaDados();
    });
    /* troca data valid*/
    $("#Corpo_txtCargo").focusout(function () {
        FormataCamposValidados($(this), $(this).val() != 0);
        ValidaDados();
    });
    /* troca data valid*/
    $("#Corpo_txtAniversario").change(function () {
        FormataCamposValidados($(this), $(this).val().length >= 6);
        ValidaDados();
    });
    $("#Corpo_txtAniversario").focusout(function () {
        FormataCamposValidados($(this), $(this).val().length >= 6);

    });
    /* troca data valid*/
    $("#Corpo_txtEstado").focusout(function () {
        FormataCamposValidados($(this), $(this).val() != 0);
        ValidaDados();
    });

    $("#Corpo_txtEmail").focusout(function () {
        if ($("#Corpo_txtEmail").val().length < 5 || ($("#Corpo_txtEmail").val().indexOf("@") < 0) && ($("#Corpo_txtEmail").val().indexOf(".") < 0)) {
            $(this).addClass("erro");
            $(this).attr("data-valid", false);
        }
        else {
            $(this).removeClass("erro");
            $(this).attr("data-valid", true);
        }
    });

    $("#Corpo_txtRg").focusout(function () {
        FormataCamposValidados($(this), $(this).val().length >= 10);
        ValidaDados();
    });
    $("#Corpo_txtCpf").focusout(function () {
        FormataCamposValidados($(this), $(this).val().length >= 12);
        ValidaDados();
    });
    $("#Corpo_txtSenha").focusout(function () {
        FormataCamposValidados($(this), ($(this).val().length >= 4) && ($(this).val().length <= 8));
        ValidaDados();
    });
    $("#Corpo_txtLogin").focusout(function () {
        FormataCamposValidados($(this), ($(this).val().length >= 4) && ($(this).val().length <= 15));
        ValidaDados();
    });

    /*esse metodo vai buscar os dados do cep*/
    $("#Corpo_txtCep").focusout(function () {
        var cep = $(this).val().length <= 7 ? '00000000': $(this).val().replace(".", "").replace("-", "");
        $.ajax({
            url: "https://viacep.com.br/ws/" + cep + "/json",
            contentType: "application/json; charset=utf-8",
            //  data: "{ 'strCep':'" + $(this).val().replace(".","").replace("-","") + "' }",
            type: "GET",
            async: true,
            datatype: "json",
        }).done(function (data) {
            var Retorno;
            try {
                /*   var Retorno = JSON.parse(data);
                   $("#Corpo_txtEstado").val(Retorno["uf"]);
                   $("#Corpo_txtCidade").val(Retorno["localidade"]);
                   $("#Corpo_txtEndereco").val(Retorno["logradouro"]);
                   $("#Corpo_txtBairro").val(Retorno["bairro"]);*/
                $("#Corpo_txtEstado").val(data["uf"]);
                $("#Corpo_txtCidade").val(data["localidade"]);
                $("#Corpo_txtEndereco").val(data["logradouro"]);
                $("#Corpo_txtBairro").val(data["bairro"]);
            } catch (e) {
                return;
            }
        }).fail(function (erro, mennsager) {
            return;
        });
    });

    function ValidaDados() {
        var validador = true;
        var swap = true;

        swap = $("#Corpo_txtNome").attr("data-valid") == "true" ? true : false;
        validador = validador && swap;

        swap = $("#Corpo_txtCep").attr("data-valid") == "true" ? true : false;
        validador = validador && swap;

        swap = $("#Corpo_txtCidade").attr("data-valid") == "true" ? true : false;
        validador = validador && swap;

        swap = $("#Corpo_txtEndereco").attr("data-valid") == "true" ? true : false;
        validador = validador && swap;

        swap = $("#Corpo_txtNumeroCasa").attr("data-valid") == "true" ? true : false;
        validador = validador && swap;

        swap = $("#Corpo_txtTelefone").attr("data-valid") == "true" ? true : false;
        validador = validador && swap;

        swap = $("#Corpo_txtCelular").attr("data-valid") == "true" ? true : false;
        validador = validador && swap;

        swap = $("#Corpo_txtEmail").attr("data-valid") == "true" ? true : false;
        validador = validador && swap;

        swap = $("#Corpo_txtAniversario").attr("data-valid") == "true" ? true : false;
        validador = validador && swap;

        swap = $("#Corpo_txtEstado").attr("data-valid") == "true" ? true : false;
        validador = validador && swap;

        swap = $("#Corpo_txtRg").attr("data-valid") == "true" ? true : false;
        validador = validador && swap;

        swap = $("#Corpo_txtCpf").attr("data-valid") == "true" ? true : false;
        validador = validador && swap;

        swap = $("#Corpo_txtSenha").attr("data-valid") == "true" ? true : false;
        validador = validador && swap;

        swap = $("#Corpo_txtLogin").attr("data-valid") == "true" ? true : false;
        validador = validador && swap;

        validador = validador && swap;
        if (validador) {
            $("#Corpo_txtValido").val(true);
        }
        else {
            $("#Corpo_txtValido").val(false);
        }

    }
    function FormataCamposValidados(Elemento, Valido) {
        if (Valido) {
            $(Elemento).removeClass("erro");
            $(Elemento).attr("data-valid", true);
        }
        else {
            $(Elemento).addClass("erro");
            $(Elemento).attr("data-valid", false);
        }

    }


});
