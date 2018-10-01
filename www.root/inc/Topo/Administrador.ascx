<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Administrador.ascx.cs" Inherits="inc_Topo_Administrador" %>
<%@ Register TagPrefix="uc" TagName="Login" Src="~/inc/Login.ascx" %>
<div>
    <!-- Menu de Navegação -->
    <nav class="navbar navbar-expand-xl navbar-dark bg-dark  " role="navigation" id="menu">
        <div class=" container-fluid">
            <!-- Menu  -->
            <div class=" navbar-brand"></div>
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target=".navbar-collapse">
                <span class=" navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav mr-auto ">
                    <li class=" nav-item"><a class="nav-link" href="/">Home</a></li>
                    <li class="nav-item dropdown">
                        <a class=" nav-link dropdown-toggle" data-toggle="dropdown" href="/Funcionario">Funcionarios</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="/Funcionario/cadastrar.aspx">Cadastrar</a>
                            <a class="dropdown-item" href="/Funcionario">Listar</a>
                            <a class="dropdown-item " href="#">aqui</a>
                        </div>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="/avisos?acao=1">Avisos</a></li>
                    <li class="nav-item"><a class=" nav-link" href="#contact">Contato</a></li>
                </ul>
                <asp:LinkButton Text="Sair" runat="server" ID="btnLogout" OnClick="btnLogout_Click" CssClass=" login-button" /><uc:login runat="server" id="ucLogin" />
            </div>
        </div>
        <!-- fim do menu-->

    </nav>
    <!-- Navbar -->
</div>
