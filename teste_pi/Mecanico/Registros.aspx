<%@ Page Title="Registros" Language="C#" MasterPageFile="~/Mecanico/MasterPage.master" AutoEventWireup="true" CodeFile="Registros.aspx.cs" Inherits="Mecanico_Registos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id="content">

        <!-- Cabeçário -->
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
        <nav class="container navbar navbar-expand-lg navbar-light bg-light my-3" style="border-radius: 5px;">

            <!-- Barra de pesquisa -->
            <div class="px-2 pt-1 col-lg-6 col-md-5 col-12 m-0 input-group">
                <asp:TextBox ID="txtPesquisa" Style="font-style: italic;" class="form-control" placeholder="Buscar Registros..." aria-label="Buscar Registros" aria-describedby="basic-addon2" runat="server"></asp:TextBox>
                <div class="input-group-append">
                    <asp:LinkButton ID="btnPesquisa" CssClass="btn btn-sm btn-block btn-dark" OnClick="btnPesquisa_Click" runat="server">
                        <div class="pt-1">
                            <i class="bi bi-search"></i>
                        </div>
                    </asp:LinkButton>
                </div>
            </div>


            <!-- Botão Filtros -->
            <div class="px-2 pt-1 col-lg-3 col-md-3 col-9 dropdown" id="ddlFiltro">
                <button class="btn btn-outline-secondary btn-block dropdown-toggle" title="Selecione um Filtro" type="button" id="ddlFiltroBtn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="bi bi-funnel"></i><span class="d-none d-sm-inline">&nbsp Filtros</span>
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
               

                    <div class="row">
                        <label class="dropdown-item col-4 bg-transparent ">Nome</label>
                        <asp:LinkButton ID="btnfiltroaz" OnClick="btnfiltroaz_Click" runat="server" CssClass="dropdown-item col-3 p-1 text-center" title="Veja os nomes de A-Z"><i class="bi bi-sort-alpha-down text-secondary h4"></i></asp:LinkButton>
                        <asp:LinkButton ID="btnfiltroza" OnClick="btnfiltroza_Click" runat="server" CssClass="dropdown-item col-3 p-1 text-center" title="Veja os nomes de A-Z"><i class="bi bi-sort-alpha-up-alt text-secondary h4""></i></asp:LinkButton>
                    </div>
                    <div class="row">
                        <label class="dropdown-item col-4 bg-transparent ">Data</label>
                        <asp:LinkButton ID="btnfiltrodataasc" OnClick="btnfiltrodataasc_Click1" runat="server" CssClass="dropdown-item col-3 p-1 text-center" title="Veja as datas recentes"><i class="bi bi-sort-numeric-down text-secondary h4"></i></asp:LinkButton>
                        <asp:LinkButton ID="btnfiltrodatadesc" OnClick="btnfiltrodatadesc_Click" runat="server" CssClass="dropdown-item col-3 p-1 text-center" title="Veja as datas antigas"><i class="bi bi-sort-numeric-up-alt text-secondary h4"></i></asp:LinkButton>
                    </div>
                        <asp:LinkButton ID="btnpago" OnClick="btnpago_Click" runat="server" CssClass="dropdown-item col-3 p-1 text-center" title="Veja os registros pagos">Registros pagos</asp:LinkButton>
                        <asp:LinkButton ID="btnnaopago" OnClick="btnnaopago_Click" runat="server" CssClass="dropdown-item col-3 p-1 text-center" title="Veja os registros não pagos">Regitros não pagos</asp:LinkButton>
                    
                    <asp:LinkButton ID="btnlimpar" OnClick="btnlimpar_Click"  runat="server" CssClass="dropdown-item text-info" title="Limpe todos os filtros">Limpar Filtro</asp:LinkButton>
                </div>

            </div>

            <%--botão ir para agenda de clientes--%>
            <div class="px-2 pt-1 col-lg-3 col-md-4 col-3">
                <a href="AgendadeCliente.aspx" type="button" title="Veja seus clientes" class="btn btn-outline-secondary text-center btn-block">
                    <i class="bi bi-journal-bookmark"></i><span class="d-none d-md-inline">&nbsp Agenda de Clientes</span>
                </a>
            </div>

        </nav>

        <%-- Page Content --%>
        <div class="container bg-secondary p-2 " style="border-radius: 5px 5px 10px 10px;">
            <div class="text-center  h4 col-12 bg-white p-1" style="border-radius: 5px;">Registros</div>
            <div class="row">

                <asp:Literal ID="ltlSemRegistros" runat="server"></asp:Literal>

                <asp:Repeater runat="server" ID="rptRegistros">
                    <ItemTemplate>
                        <%--Card Registro--%>

                        <div class="col-lg-3 col-md-6">
                            <div class="card bg-light mb-3">
                                <div class="card-header">
                                    <div>
                                        <i class='<%#(Eval("reg_pago").ToString().Equals("S") ? "text-success " : "text-danger ") + " bi bi-cash-coin bg-transparent" %>' title='<%#(Eval("reg_pago").ToString().Equals("S") ? "Pago " : "Não foi Pago ") %>' id="pago"></i>
                                        <asp:Label ID="lblData" CssClass=" font-weight-bolder" runat="server" Text='<%# DateTime.Parse((DataBinder.Eval(Container.DataItem, "reg_data")).ToString()).ToString("dd/MM/yyyy") %>' />
                                        <a class=" btn btn-outline-secondary  float-right" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <div>⋮</div>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                                            <asp:LinkButton CssClass="dropdown-item " ID="btnAlterarRegistro" OnClick="btnAlterarRegistro_Click" runat="server">Exibir e Editar</asp:LinkButton>
                                            <asp:LinkButton CssClass="dropdown-item text-danger" ID="btnExcluirRegistro" OnClick="btnExcluirRegistro_Click" runat="server">Excluir</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <h6 class="card-title "><b>Cliente:</b>
                                        <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "cli_nome") %>' /></h6>
                                    <h6 class="card-title "><b>Placa:</b>
                                        <asp:Label ID="Label2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "vei_placa") %>' /></h6>
                                    <%--<h6 class="card-title "><b>Status:</b>
                                        <asp:Label ID="LabelStatus" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "reg_pago") %>' /></h6>--%>
                                    <div class="card-text  bg-white m-2" style="max-height: 75px; height: 75px;">
                                        <label class="pl-1">
                                            <b>Descricão:</b><br />
                                        </label>
                                        <div class="pl-2 ">
                                            <asp:Label ID="Label3" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "reg_descricao") %>' />
                                        </div>
                                        <asp:HiddenField ID="hidIdRegistro" Value='<%# DataBinder.Eval(Container.DataItem, "reg_id") %>' runat="server" />
                                        <asp:HiddenField ID="hidIdVeiculo" Value='<%# DataBinder.Eval(Container.DataItem, "vei_id") %>' runat="server" />
                                        <asp:HiddenField ID="hidIdMecanico" Value='<%# DataBinder.Eval(Container.DataItem, "mec_id") %>' runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>


            <%--Botão Flutuante--%>
            <a href="CadastroRegistro.aspx">
                <div class="centered btn btn-secondary border-0 text-white rounded-circle" type="button" data-toggle="modal"
                    data-target="#exampleModal" style="background-color: #1b2b4b; position: fixed; top: 95%; left: 100%; margin-top: -50px; margin-left: -100px;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="40" fill="currentColor" class="bi bi-clipboard-plus"
                        viewBox="0 0 16 16">
                        <path fill-rule="evenodd"
                            d="M8 7a.5.5 0 0 1 .5.5V9H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V10H6a.5.5 0 0 1 0-1h1.5V7.5A.5.5 0 0 1 8 7z" />
                        <path
                            d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z" />
                        <path
                            d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z" />
                    </svg>
                </div>
            </a>

            <!-- Modal -->
            <div class="modal fade" id="ModalExcluir" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title text-danger" id="exampleModalLabel">Deseja Excluir este o registro?</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <asp:HiddenField ID="hidIdRegistroEcluir" runat="server" />
                        </div>
                        <div class="modal-footer">
                            <asp:LinkButton ID="LinkButton1" CssClass="btn btn-outline-danger" runat="server" OnClick="LinkButton1_Click">Excluir</asp:LinkButton>
                            <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Fechar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <%--Toast de Mensagem--%>
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

