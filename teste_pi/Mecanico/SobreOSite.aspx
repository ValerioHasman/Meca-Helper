<%@ Page Title="Sobre o Site" Language="C#" MasterPageFile="~/Mecanico/MasterPage.master" AutoEventWireup="true" CodeFile="SobreOSite.aspx.cs" Inherits="Mecanico_SobreAFerrameta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id="content">
        <nav class="navbar navbar-expand-lg navbar-light bg-light mb-1" style="border-radius: 5px;">
            <div class="row">
                <button type="button" id="sidebarCollapse" class="btn btn-sm btn-secondary ml-3 ">
                    <i class="fas fa-align-left">
                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                            fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
                        </svg></i>
                </button>
                <div class="ml-2">
                    <img src="../img/LOGO.svg" alt="logo" title="MecaHelper" width="145">
                </div>
            </div>
        </nav>

        <main class="container bg-light article my-3" style="border-radius: 5px 5px 5px 5px; color: black;">
            <label class="text-center h4 col-12 pt-4 pb-1">Um pouco de nossa história...</label>
            <div class="px-3">
                <div class="py-2">
                    Esse site foi desenvolvido pela Fatec João Carlos Mod. , que se localiza em Guaratinguetá - SP. Os desenvolvedores Gabriel Augusto, Guilherme Rocha Santana, Lucas Etzeo Coca e
                    Valério Luz Hasmann participaram do Projeto Interdisciplinar ao criar o MecaHelper. Foi percebido pelo grupo a necessidade de se criar um site que pudesse auxiliar os mecânicos
                    brasileiros, e após meses de esforço, o site se encontra presencial.
                </div>
                <div>
                    Esse site foi programado atráves do Visual Studio, pela linguagem C#. Com o uso do Bootstrap, o CSS e o html5, foi possível guardar dados na plataforma MySQL. Desde Junho do ano de 2021
                    , o grupo se encontrou e criou documentações para o desenvolvimento do MecaHelper.
                </div>
                <div class="py-2 h5" style="color: #394854;">
                    <a href="https://www.youtube.com/channel/UCFHfqLiU4mCwHFeRjLwlARQ" target="_blank">
                    <strong>Clique aqui para Tutoriais e Novidades em nosso canal!</strong></a>
                </div>
                <label class="text-center h4 col-12 py-3">Nos contate!</label>
                <div class="pb-4">
                    <h5>E-mails de contato:</h5>
                    <ul style="padding-inline-start: 20px;">
                        <li><strong>mecahelper@gmail.com</strong></li>
                        <li><strong>MH2021@hotmail.com</strong></li>
                    </ul>
                </div>
            </div>
        </main>
    </div>

</asp:Content>

