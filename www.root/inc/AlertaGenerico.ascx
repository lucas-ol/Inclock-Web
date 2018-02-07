<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AlertaGenerico.ascx.cs" Inherits="inc_AlertaGenerico" %>
<!-<link href="../Styles/lib/bootstrap/bootstrap.css" rel="stylesheet" />
-->
<script>
    $(document).ready(function () {
        $(".alert").delay(5000).toggle(1000);

    });
</script>
<style>
    .fixed-top {
        position: absolute;
        top: 0;
        right: 0;
        left: 0;
        z-index: 1030;
    }
</style>
<div class="fixed-top col-7" style="margin: 0 auto">

    <asp:Panel runat="server" ID="pnlAlert" CssClass="alert alert-dismissible " Style="width: 100%; text-align: center;">
        <h6 class=" alert-heading" runat="server" id="lblTitulo"></h6>
        <a class=" close" data-dismiss="alert" aria-label="close">&times</a>
        <span runat="server" id="lblConteudo"></span>
    </asp:Panel>

</div>
