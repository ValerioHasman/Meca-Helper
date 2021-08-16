<%@ Page Title="Gráficos" Language="C#" MasterPageFile="~/Mecanico/MasterPage.master" AutoEventWireup="true" CodeFile="Graficos.aspx.cs" Inherits="Mecanico_Graficos" %>

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
                <div class="ml-2"><img src="../img/LOGO.svg" alt="logo" title="MecaHelper" width="145" ></div>
            </div>
        </nav>

        <%--Page Content--%>
        <div class="container bg-secondary p-2 mt-3 mt-3" style="border-radius: 5px 5px 10px 10px;">
            <div class="text-center h4 col-12 bg-white p-1" style="border-radius: 5px;">Informações do Mês</div>


            <div class="text-center h4 bg-white p-1" style="border-radius: 5px;">
                <div class="row p-2">
                    <div class="col-12 col-md-4">
                        <div class="card card-body text-dark bg-light ">
                            <h5 class="card-title">Rendimetos do Mês</h5>
                            <p class="card-text">R$  <asp:Label ID="lblRendaMes" runat="server"  /> </p>
                        </div>
                    </div>

                    <div class="col-12 col-md-4">
                        <div class="card card-body text-dark bg-light ">
                            <h5 class="card-title">Serviços no Mês</h5>
                            <p class="card-text"><asp:Label ID="lblSevicosNoMes" CssClass="card-text" runat="server"/></p>
                            
                        </div>
                    </div>

                    <div class="col-12 col-md-4">
                        <div class="card card-body text-dark bg-light ">
                            <h5 class="card-title">Serviços do Mês não Pagos</h5>
                            <p class="card-text"><asp:Label ID="lblServicosNaoPagosNoMes" CssClass="card-text p" runat="server"/></p>
                            
                        </div>
                    </div>
                </div>
            </div>


            <%--Gráfico--%>
            <div class="text-center h4 col-12 bg-white p-1" style="border-radius: 5px;">
                <label>Gráficos de Rendimento</label>  
            </div>
            <div class="text-left h4 col-12 bg-white p-1" style="border-radius: 5px;">
                <label class="h6 pl-2 pt-1   ">Periodo por:</label> 
                <asp:DropDownList ID="ddlPeriodos" AutoPostBack="true" OnSelectedIndexChanged="ddlPeriodos_SelectedIndexChanged" CssClass=" p-0 btn btn-dark btn-outline-dark text-dark bg-transparent dropdown-toggle" runat="server">
                    <asp:ListItem Value="dia">Dias deste Mês</asp:ListItem>
                    <asp:ListItem Selected="True" Value="mes">Meses deste Ano </asp:ListItem>
                    <asp:ListItem Value="ano">Anos em Anos</asp:ListItem>
                </asp:DropDownList>
                <asp:Literal ID="ltl" runat="server"></asp:Literal>
            </div>

        </div>
    </div>
    

    
</asp:Content>

