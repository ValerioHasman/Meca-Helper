<%@ Page Title="Lixeira" Language="C#" MasterPageFile="~/Mecanico/MasterPage.master" AutoEventWireup="true" CodeFile="Lixeira.aspx.cs" Inherits="Mecanico_Lixeira" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id="content">

        <%-- Cabeçário --%>
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

        <%--Navegador--%>
        <nav class="container navbar navbar-expand-lg navbar-light bg-light mt-3 mb-3" style="border-radius: 5px;">
            
            <!-- Barra de pesquisa -->
            <div class="px-2 pt-1 col-lg-9 col-md-9 col-9 m-0 input-group">
                <asp:TextBox ID="txtPesquisa" style="font-style: italic;" class="form-control" placeholder="Buscar Registros..." aria-label="Buscar Registros" aria-describedby="basic-addon2" runat="server"></asp:TextBox>
                <div class="input-group-append">
                    <asp:LinkButton ID="btnPesquisa" CssClass="btn btn-sm btn-block btn-dark " runat="server" OnClick="btnPesquisa_Click">
                        <div class="pt-1">
                            <i class="bi bi-search"></i>
                        </div>
                    </asp:LinkButton>
                </div>
            </div>

            <%--<!-- Botão Filtros -->
            <div class="px-2 pt-1 col-lg-3 col-md-3 col-9 dropdown" ID="ddlFiltro">
                <button class="btn btn-outline-secondary btn-block dropdown-toggle" title="Selecione um Filtro" type="button" id="ddlFiltroBtn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="bi bi-funnel"></i><span class="d-none d-sm-inline">&nbsp Filtros</span>
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item text-info" title="Mostrará todos os seus registros">Limpar Filtro</a>
                    <a class="dropdown-item" title="Veja só seus registros pagos">Registros pagos</a>
                    <a class="dropdown-item" title="Veja só seus registros não-pagos">Registros não pagos</a>
                </div>
            </div>--%>

            <%-- Botão ir para Registros --%>
            <div class="px-2 pt-1 col-lg-3 col-md-3 col-3">
                <a href="Registros.aspx" type="button" title="Veja seus registros no menu principal" class="btn btn-outline-secondary text-center btn-block ">
                    <i class="bi bi-pencil-square"></i><span class="d-none d-md-inline">&nbsp Registros</span>
                </a>
            </div>

        </nav>

        <%-- Page Content --%>
        <div class="container bg-secondary p-2 " style="border-radius: 5px 5px 10px 10px;">
            <div class="text-center  h4 col-12 bg-white p-1" style="border-radius: 5px;""><i>Lixeira</i></div>
            <div class="row">
                <asp:Literal ID="ltlSemRegistros" runat="server"></asp:Literal>

                <asp:Repeater runat="server" ID="rptRegsitros">
                    <itemtemplate>
                        <%--Card Registro--%>
                        <div class="col-lg-3 col-md-6">
                            <div class="card bg-light mb-3">
                                <div class="card-header">
                                    <div>
                                        <i  class='<%#(Eval("reg_pago").ToString().Equals("S") ? "text-success " : "text-danger ") + " bi bi-cash-coin bg-transparent" %>' title='<%#(Eval("reg_pago").ToString().Equals("S") ? "Pago " : "Não foi Pago ") %>' id="pago"></i>
                                        <asp:Label ID="lblData" CssClass="mt-2 font-weight-bolder"  runat="server"  Text='<%# DateTime.Parse((DataBinder.Eval(Container.DataItem, "reg_data")).ToString()).ToString("dd/MM/yyyy") %>' />                                      
                                        <a class=" btn btn-outline-secondary float-right" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <div>⋮</div>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                                            <asp:LinkButton ID="LinkButton1" CssClass="dropdown-item" runat="server" OnClick="LinkButton1_Click">Restaurar</asp:LinkButton>
                                        </div>
                                    </div>

                                </div>
                                <div class="card-body">
                                    <h6 class="card-title "><b>Cliente:</b>     
                                        <asp:Label ID="Label1"  runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "cli_nome") %>' /></h6>
                                    <h6 class="card-title "><b>Placa:</b> 
                                        <asp:Label ID="Label2"  runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "vei_placa") %>' />
                                    </h6>
                                    <div class="card-text  bg-white m-2" style="max-height: 75px; height: 75px;">
                                        <label class="pl-1">
                                            <b>Descricão:</b><br />
                                        </label>
                                        <div class="pl-2 ">
                                            <asp:Label ID="Label3"  runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "reg_descricao") %>' />
                                        </div>
                                        <asp:HiddenField ID="hidIdRegistro" Value='<%# DataBinder.Eval(Container.DataItem, "reg_id") %>' runat="server" />
                                        <asp:HiddenField ID="hidIdVeiculo" Value='<%# DataBinder.Eval(Container.DataItem, "vei_id") %>' runat="server" />
                                        <asp:HiddenField ID="hidIdMecanico" Value='<%# DataBinder.Eval(Container.DataItem, "mec_id") %>' runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                   </itemtemplate>
                 </asp:Repeater>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="ModalExcluir" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title text-danger" id="exampleModalLabel">Deseja Restaurar este o registro?</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <asp:HiddenField ID="hidIdRegistroEcluir" runat="server" />

                        </div>

                        <div class="modal-footer">
                            <asp:LinkButton ID="LinkButton1" CssClass="btn btn-outline-danger" runat="server" OnClick="LinkButton1_Click1">Restaurar</asp:LinkButton>
                            <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Fechar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="toast" id="msg" style="position: absolute; top: 10px; right: 10px;" data-delay="4000">
        <div class="toast-header">
            <i class="bi bi-info-circle"></i>
            <strong class="mr-auto ml-2">Mensagem</strong>
            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="toast-body">
            <asp:Literal ID="ltlMsg" runat="server"></asp:Literal>
        </div>
    </div>
    <script>
        if (<%= modalExcluirRegistro ? "true" : "false" %>) {
            $("#ModalExcluir").modal('show');
        }
        if (<%= msg ? "true" : "false" %>) {
            $("#msg").toast('show');
        }
    </script>
</asp:Content>

