<%@ Page Title="Agenda de Clientes" Language="C#" MasterPageFile="~/Mecanico/MasterPage.master" AutoEventWireup="true" CodeFile="AgendadeCliente.aspx.cs" Inherits="Mecanico_AgendadeCliente" %>

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
        <nav class="container navbar navbar-expand-lg navbar-light bg-light mt-3 mb-3" style="border-radius: 5px;">

            <!-- barra de pesquisa -->
            <div class="px-2 pt-1  col-lg-6 col-md-5 col-12 m-0 input-group">
                <asp:TextBox ID="txtPesquisa" Style="font-style: italic;" class="form-control" placeholder="Buscar Clientes..." aria-label="Buscar Clientes" aria-describedby="basic-addon2" runat="server"></asp:TextBox>
                <div class="input-group-append">
                    <asp:LinkButton ID="btnPesquisa" CssClass="btn btn-sm btn-block btn-dark" OnClick="btn_Pesquisa" runat="server">
                        <div class="pt-1">
                            <i class="bi bi-search"></i>
                        </div>
                    </asp:LinkButton>
                </div>
            </div>

            <!-- botão Filtro -->
            <div class="px-2 pt-1 col-lg-3 col-md-4 col-9 dropdown" ID="ddlFiltro">
                <button class="btn btn-outline-secondary btn-block dropdown-toggle" title="Selecione um Filtro" type="button" id="ddlFiltroBtn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="bi bi-funnel"></i><span class="d-none d-md-inline">&nbsp Filtros</span>
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <div class="row">
                        <label class="dropdown-item col-4 bg-transparent ">Nome</label>
                        <asp:LinkButton ID="btnfilaz" OnClick="btnfilaz_Click" runat="server" CssClass="dropdown-item col-3 p-1 text-center" title="Veja os nomes de A-Z"><i class="bi bi-sort-alpha-down text-secondary h4"></i></asp:LinkButton>
                        <asp:LinkButton ID="btnfilza" OnClick="btnfilza_Click" runat="server" CssClass="dropdown-item col-3 p-1 text-center" title="Veja os nomes de Z-A"><i class="bi bi-sort-alpha-up-alt text-secondary h4""></i></asp:LinkButton>
                    </div>
                    <asp:LinkButton ID="btnlimpa" OnClick="btnlimpa_Click" runat="server" CssClass="dropdown-item text-info" title="Limpe todos os filtros">Limpar Filtro</asp:LinkButton>
                </div>
            </div>

            <%--botão ir para registros--%>
            <div class="px-2 pt-1 col-lg-3 col-md-3 col-3">
                <a href="Registros.aspx" type="button" title="Veja seus registros no menu principal" class="btn btn-outline-secondary text-center btn-block ">
                    <i class="bi bi-pencil-square"></i><span class="d-none d-md-inline">&nbsp Registros</span>
                </a>
            </div>

        </nav>

        <!-- Page Content -->
        <div class="container  bg-secondary p-2 " style="border-radius: 5px 5px 20px 20px;">
            <div class="text-center  h4 col-12 bg-white p-1" style="border-radius: 5px;">Clientes</div>
            <div class="row" id="cardexpansivo">

                <asp:Literal ID="ltlSemCliente" runat="server"></asp:Literal>

                <asp:Repeater runat="server" ID="rptClientes" OnItemDataBound="rptVeiculo_ItemDataBound">
                    <ItemTemplate>
                        <!--Card Clientes-->
                        <div class="col-12  mb-2">
                            <div class="card bg-light mb-1" style="border-radius: 5px 5px 20px 20px;">
                                <div class="card-header">
                                    <div class="dropdown">
                                        <asp:Label ID="lblNome" runat="server" CssClass="font-weight-bolder mt-2 " Text='<%# DataBinder.Eval(Container.DataItem, "cli_nome") %>' />


                                        <a class=" btn btn-outline-secondary  float-right" type="button" id="dropdownMenuButton"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <div>⋮</div>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                                            <asp:LinkButton ID="btnEditarCliente" CssClass="dropdown-item" OnClick="btnEditarCliente_Click" runat="server">Editar Cliente</asp:LinkButton>                       
                                        </div>
                                        <asp:LinkButton CssClass="btn btn-outline-secondary float-right mx-2 btnicone " ID="btnAdicioarVeiculo" OnClick="btn_AdicionarVeiculo" runat="server">
                                            <div>
                                                <img src="../img/2389240701596026966-512.png" style="width: 30px; height: 30px;" alt="add carro">
                                            </div>
                                        </asp:LinkButton>

                                    </div>
                                </div>

                                <!--Informações do clientes-->
                                <div class="card-body col-12">
                                    <div class="card-title h5">Informações</div>
                                    <div class="row  mt-2">
                                        <div class="col-lg-4 col-sm-12 ">
                                            <b>Celular:</b>
                                            <asp:Label ID="lblCelular" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "cli_celular") %>' />
                                        </div>
                                        <div class="col-lg-4 col-sm-12 ">
                                            <b>Cpf/Cnpj:</b>
                                            <asp:Label ID="lblCpfCnpj" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "cli_cpfcnpj") %>' />
                                        </div>
                                        <div class="col-lg-4 col-sm-12 ">
                                            <b>Endereço:</b>
                                            <asp:Label ID="lblEndereço" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "cli_endereco") %>' />
                                        </div>
                                        <asp:HiddenField runat="server" ID="hidIdCliente" Value='<%# DataBinder.Eval(Container.DataItem, "cli_id")%>' />
                                        <asp:HiddenField runat="server" ID="hidIdMecanico" Value='<%# DataBinder.Eval(Container.DataItem, "mec_id")%>' />
                                    </div>
                                </div>



                                <!--Conteúdo do Colapse -->
                                <div class="collapse  bg-white container " id='veiculo<%# Container.ItemIndex%>' data-parent="#cardexpansivo">
                                    <div class="Col-12 h5 mt-3 mx-3">Veículos</div>
                                    <div class="row p-3">

                                        <asp:Literal ID="ltlSemVeiculos" runat="server"></asp:Literal>
                                        <asp:Repeater runat="server" ID="rptVeiculos">
                                            <ItemTemplate>
                                                <%--Veículo & informações--%>
                                                <div class="col-lg-6 col-12 col-md-12">
                                                    <div class="row">
                                                        <div class="col-6">
                                                            <label>
                                                                <b>Placa:</b>
                                                                <asp:Label ID="lblVeiculoPlaca" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "vei_placa") %>' />
                                                            </label>
                                                            <br />
                                                            <label>
                                                                <b>Marca:</b>
                                                                <asp:Label ID="lblVeiculoMarca" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "vei_marca") %>' />
                                                            </label>
                                                        </div>
                                                        <div class="col-6">
                                                            <label>
                                                                <b>Modelo:</b>
                                                                <asp:Label ID="lblVeiculoModelo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "vei_modelo") %>' />
                                                            </label>
                                                            <br />
                                                            <label>
                                                                <b>Ano:</b>
                                                                <asp:Label ID="lblVeiculoAno" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "vei_ano") %>' />
                                                            </label>
                                                            <asp:HiddenField ID="hidVeiculoId" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "vei_id") %>' />
                                                        </div>
                                                    </div>
                                                </div>

                                                <!--Botões do Veículo -->
                                                <div class="col-lg-6 col-12 col-md-12  ">
                                                    <div class="row float-xl-right">
                                                        <asp:LinkButton CssClass="btn btn-secondary btn-sm mx-1 my-1 col-xl-6 col-sm-12  text-white" OnClick="btnAlterarVeiculo_Click" runat="server">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                                                    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                                                                </svg>
                                                        </asp:LinkButton>
                                                        <div class="col-1"></div>
                                                       
                                                    </div>
                                                </div>

                                                <%--Linha--%>
                                                <div class="col-12 ">
                                                    <hr />
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>


                                    </div>
                                </div>

                                <!--Botao do colapse-->
                                <div class="btn col-12">
                                    <button class="btn btn-sm btn-dark col-12 btn-outline-secondary text-white" type="button"
                                        data-toggle="collapse" id="btncollapse" data-target='#veiculo<%# Container.ItemIndex  %>' aria-expanded="false">
                                        Exibir Veículos
                                    </button>
                                </div>
                            </div>

                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

        
        <!-- Botão flutuante -->
        <div class="centered btn btn-secondary text-white border-0 rounded-circle" style="background-color: #1b2b4b; position: fixed; top: 95%; left: 100%; margin-top: -50px; margin-left: -100px;" type="button" data-toggle="modal"
            data-target="#exampleModal">
            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="40" fill="currentColor" class="bi bi-person-plus" viewBox="0 0 16 16">
                <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
                <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z" />
            </svg>
        </div>


        <!-- Modais: -->

        <!-- Modal Excluir Veiculo -->
        <div class="modal fade" id="ModalExcluir" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title text-danger" id="exampleModalLabel">Deseja Excluir este Veículo ?</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="card-body">Excluir este veículo não afetará registros relacionados ao mesmo.</div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-danger">Excluir</button>
                        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Fechar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Excluir cliente -->
        <div class="modal fade" id="ModalExcluirCliente" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title text-danger" id="exampleModalLabel">Deseja Excluir este Cliente ?</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="card-body">Excluir este Cliente não afetará registros relacionados ao mesmo.</div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-danger">Excluir</button>
                        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Fechar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Alterar Cliente -->
        <div class="modal fade" id="ModalEditarVeiculosCliente" tabindex="-1" role="dialog" aria-labelledby="ModalEditarVeiculosClientes"
            aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title font-weight-bold" id="exampleModalLabel">Editar Cliente</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="card-body pb-0 font-weight-light text-primary">Obs.: As novas atualizações aparecerão somente em registros novos!</div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-xl-6 col-sm-12">
                                <asp:HiddenField ID="hidAltCliente" runat="server" />
                                <label class="col-12 mt-3 h6 pl-0">Nome Completo:</label>
                                <asp:TextBox ID="txtAltNome" CssClass="form-control" type="text" runat="server" placeholder="obrigatorio" required="required"></asp:TextBox>
                            </div>
                            <div class="col-xl-6 col-sm-12">
                                <label class="col-12 mt-3 h6 pl-0">Cpf/Cnpj:</label>
                                <asp:TextBox ID="txtAltCpfCnpj" CssClass="form-control" type="text" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-xl-6 col-sm-12">
                                <label class="col-12 mt-3 h6 pl-0">N° de Celular:</label>
                                <asp:TextBox ID="txtAltCelular" CssClass="form-control" type="text" placeholder="obrigatorio" runat="server" required="required"></asp:TextBox>
                            </div>
                            <div class="col-xl-6 col-sm-12">
                                <label class="col-12 mt-3 h6 pl-0">Endereço:</label>
                                <asp:TextBox ID="txtAltEndereco" CssClass="form-control" type="text" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <asp:LinkButton ID="btnAlterarClienteConfirma" CssClass="btn btn-outline-primary" OnClick="btnAlterarClienteConfirma_Click" runat="server">Alterar</asp:LinkButton>
                        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Fechar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Alterar Veiculo -->
        <div class="modal fade" id="ModalEditarVeiculos" tabindex="-1" role="dialog" aria-labelledby="ModalEditarVeiculos"
            aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title font-weight-bold" id="exampleModalLabel">Editar Veículo</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="card-body">
                        <div class="row">
                            <div class="col-xl-6 col-sm-12">
                                <asp:HiddenField ID="hidIdVeiculo" runat="server" />
                                <label class="col-12 mt-3 h6 pl-0 ">Placa:</label>
                                <asp:TextBox ID="txtAltPlaca" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-xl-6 col-sm-12">
                                <label class="col-12 mt-3 h6 pl-0">Modelo:</label>
                                <asp:TextBox ID="txtAltModelo" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-xl-6 col-sm-12">
                                <label class="col-12 mt-3 h6 pl-0">Marca:</label>
                                <asp:TextBox ID="txtAltMarca" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-xl-6 col-sm-12">
                                <label class="col-12 mt-3 h6 pl-0">Ano:</label>
                                <asp:TextBox ID="txtAltAno" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <asp:LinkButton ID="btnAlterarVeiculoConfirma" CssClass="btn btn-outline-info" OnClick="btnAlterarVeiculoConfirma_Click" runat="server">Alterar</asp:LinkButton>
                        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Fechar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Adicionar Veiculo -->
        <div class="modal fade" id="modalAdicionarVeiculo" tabindex="-1" role="dialog" aria-labelledby="modalAdicionarVeiculo"
            aria-hidden="true">
            <asp:HiddenField ID="hidAddVeiculo" Value="" runat="server"></asp:HiddenField>
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title font-weight-bold" id="exampleModalLabel">Adicionar Veículo</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="card-body">
                        <div class="row">
                            <div class="col-xl-6 col-sm-12">
                                <label class="col-12 mt-3 h6 pl-0 ">Placa:</label>
                                <asp:TextBox ID="txtPlacaAdd" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-xl-6 col-sm-12">
                                <label class="col-12 mt-3 h6 pl-0">Modelo:</label>
                                <asp:TextBox ID="txtModeloAdd" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-xl-6 col-sm-12">
                                <label class="col-12 mt-3 h6 pl-0">Marca:</label>
                                <asp:TextBox ID="txtMarcaAdd" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-xl-6 col-sm-12">
                                <label class="col-12 mt-3 h6 pl-0">Ano:</label>
                                <asp:TextBox ID="txtAnoAdd" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <asp:LinkButton runat="server" CssClass="btn btn-outline-info" ID="btnCadastroVeiculoConfirma" OnClick="btn_AdicionarVeiculoConfirma" Text="Salvar"></asp:LinkButton>
                        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Fechar</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- Modal cadastro -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl   ">
                <div class="modal-content bg-light">
                    <div class="modal-header ">
                        <h5 class="modal-title font-weight-bolder" id="exampleModalLabel">Cadastro de Cliente</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body mx-2">

                        <label class="ml-1 h4">Cliente:</label>
                        <div class="container ">
                            <div class="row">
                                <div class="col-xl-6 col-sm-12">
                                    <label class="col-12 mt-3 h6 pl-0">Nome Completo:</label>
                                    <asp:TextBox ID="txtNome" CssClass="form-control" type="text" runat="server" placeholder="obrigatorio" required="required"></asp:TextBox>
                                </div>
                                <div class="col-xl-6 col-sm-12">
                                    <label class="col-12 mt-3 h6 pl-0">Cpf/Cnpj:</label>
                                    <asp:TextBox ID="txtCpfCnpj" CssClass="form-control" type="text" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-xl-6 col-sm-12">
                                    <label class="col-12 mt-3 h6 pl-0">N° de Celular:</label>
                                    <asp:TextBox ID="txtCelular" CssClass="form-control" type="text" placeholder="obrigatorio" runat="server" required="required"></asp:TextBox>
                                </div>
                                <div class="col-xl-6 col-sm-12">
                                    <label class="col-12 mt-3 h6 pl-0">Endereço:</label>
                                    <asp:TextBox ID="txtEndereco" CssClass="form-control" type="text" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <hr />

                            <label class="ml-1 mt-2 h5">Veiculo:</label>
                            <div class="container p-0 mb-4">
                                <div class="row">
                                    <div class="col-xl-6 col-sm-12">
                                        <label class="col-12 mt-3 h6 pl-0">Placa:</label>
                                        <asp:TextBox ID="txtPlaca" placeholder="obrigatorio" CssClass="form-control" type="text" runat="server" required="required"></asp:TextBox>
                                    </div>
                                    <div class="col-xl-6 col-sm-12">
                                        <label class="col-12 mt-3 h6 pl-0   ">Ano:</label>
                                        <asp:TextBox ID="txtAno" CssClass="form-control" type="text" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-xl-6 col-sm-12">
                                        <label class="col-12 mt-3 h6 pl-0">Modelo:</label>
                                        <asp:TextBox ID="txtModelo" CssClass="form-control" type="text" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-xl-6 col-sm-12">
                                        <label class="col-12 mt-3 h6 pl-0">Marca:</label>
                                        <asp:TextBox ID="txtMarca" CssClass="form-control" type="text" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                            </div>

                            <div class="modal-footer">
                                <asp:LinkButton runat="server" CssClass="btn btn-primary" Text="Salvar" OnClick="btn_CadastroClienteVeiculo_Confirmar"></asp:LinkButton>
                                <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Fechar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--Toast de Mensagem--%>
    <div class="toast" id="msg" style="position: absolute; top: 10px; right: 10px;" data-delay="4000">
        <div class="toast-header">
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
            </svg>
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

        if (<%= modalAdicionarVeiculo ? "true" : "false" %>) {
            $("#modalAdicionarVeiculo").modal('show');
        }
        if (<%= modalAlterarVeiculo ? "true" : "false" %>) {
            $("#ModalEditarVeiculos").modal('show');
        }
        if (<%= modalAlterarCliente ? "true" : "false" %>) {
            $("#ModalEditarVeiculosCliente").modal('show');
        }
        if (<%= msg ? "true" : "false" %>) {
            $("#msg").toast('show');
        }
    </script>
</asp:Content>

