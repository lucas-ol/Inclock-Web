<%@ Control Language="C#" AutoEventWireup="true" CodeFile="paginacao.ascx.cs" Inherits="paginacao" %>
<style>
    pgActive {
    }
</style>
<script>
    $(function () {
        var querys = location;
        $("#anterior").on("click", function () {
            $(this).attr("", "");
        });
        $("#proxima").on("click", function () {

        });
    });
</script> 
<div>
    <!-- <link rel="stylesheet" type="text/css" href="../Styles/lib/bootstrap/bootstrap.css" /> -->
    <div class="input-group ">
        <div class="autowidth " style="margin: 0 auto;">
            <ul class=" list-inline">
                <li class="list-inline-item">
                    <asp:LinkButton runat="server" class="input-group-addon" ID="btnAnterior"><span class=""><</span></asp:LinkButton>
                </li>
                <asp:ListView runat="server" ID="listPaginas">
                    <ItemTemplate>
                        <li class="list-inline-item ">
                            <asp:HyperLink runat="server" ID="numeroPagina" NavigateUrl="#"></asp:HyperLink></li>
                    </ItemTemplate>
                </asp:ListView>
                <li class=" list-inline-item">
                    <asp:LinkButton runat="server" class="input-group-addon" ID="btnProxima"><span class="">></span></asp:LinkButton></li>
            </ul>
        </div>
    </div>
</div>

