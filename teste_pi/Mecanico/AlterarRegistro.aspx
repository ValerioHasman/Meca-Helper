<%@ Page Title="Registrar..." Language="C#" MasterPageFile="~/Mecanico/MasterPage.master" AutoEventWireup="true" CodeFile="AlterarRegistro.aspx.cs" Inherits="Mecanico_CadastroRegistro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <main id="content">

        <%-- Cabeçário --%>
        <nav class="navbar navbar-expand-lg navbar-light bg-light m-0" style="border-radius: 5px;">
            <div class="row">
                <button type="button" id="sidebarCollapse" class="btn btn-sm btn-secondary ml-3 ">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
                    </svg>
                </button>
                <div class="ml-2">
                    <img src="../img/LOGO.svg" alt="logo" title="MecaHelper" width="145">
                </div>
            </div>
        </nav>

        <%--Page Content--%>
        <div class="container">

            <%--Botões voltar e salvar--%>
            <nav class="col-12 bg-light my-3 p-2" style="border-radius: 5px; padding: 0px;">
                <asp:LinkButton ID="btnRelVoltar" Style="margin-left: auto;" CssClass="btn btn-outline-secondary border-0" runat="server" data-toggle="modal" data-target="#ConfirmaVoltar">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z" />
                    </svg>
                    &nbsp Voltar
                </asp:LinkButton>


                <asp:LinkButton ID="btnRelAlterar" OnClick="btnRelAlterar_Click" Style="margin-right: auto;" CssClass="btn btn-outline-secondary border-0 float-right" runat="server">
                    Alterar &nbsp
                    <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" width="30" height="30" viewBox="0 0 469.33400000000006 469.33400000000006">
                        <path fill-rule="evenodd" d="M466.208,88.458L380.875,3.125c-2-2-4.708-3.125-7.542-3.125H42.667C19.146,0,0,19.135,0,42.667v384c0,23.531,19.146,42.667,42.667,42.667h384c23.521,0,42.667-19.135,42.667-42.667V96C469.333,93.167,468.208,90.458,466.208,88.458z M106.667,21.333h234.667v128c0,11.76-9.563,21.333-21.333,21.333H128c-11.771,0-21.333-9.573-21.333-21.333V21.333z M384,448H85.333V256H384V448z M448,426.667c0,11.76-9.563,21.333-21.333,21.333h-21.333V245.333c0-5.896-4.771-10.667-10.667-10.667h-320c-5.896,0-10.667,4.771-10.667,10.667V448H42.667c-11.771,0-21.333-9.573-21.333-21.333v-384c0-11.76,9.563-21.333,21.333-21.333h42.667v128C85.333,172.865,104.479,192,128,192h192c23.521,0,42.667-19.135,42.667-42.667v-128h6.25L448,100.417V426.667zM266.667,149.333h42.667c5.896,0,10.667-4.771,10.667-10.667V53.333c0-5.896-4.771-10.667-10.667-10.667h-42.667c-5.896,0-10.667,4.771-10.667,10.667v85.333C256,144.562,260.771,149.333,266.667,149.333z M277.333,64h21.333v64h-21.333V64z" />
                    </svg>
                </asp:LinkButton>               
            </nav>

            <%-- Conteúdo de Edição --%>
            <nav class="bg-secondary p-2" style="border-radius: 5px;">
                <asp:HiddenField ID="hidIdRegistro"  runat="server" />
                <%-- Inserção de Dados --%>
                <section class="col-12 bg-white py-2" style="border-radius: 5px;">

                    <%--Inserção de clientes--%>
                    <div class="py-2 bg-light" style="border-radius: 5px;">

                        <%-- Botões --%>
                        <asp:Literal ID="selecao" Visible="false" runat="server">
                            <div class="col-12 row m-0">                            
                                <div class="col-md-6 col-12 py-1">
                                    <button type="button" class="btn btn-dark col-12" style="border-radius: 5px;" data-toggle="modal" data-target="#Selecionar">
                                        Inserir um cliente
                                    </button>
                                </div>
                                <div class="col-md-6 col-12 py-1">
                                    <button type="button" class="btn btn-dark col-12" style="border-radius: 5px;" data-toggle="modal" data-target="#Cadastrar">
                                        Criar novo cliente
                                    </button>
                                </div>
                            </div>
                        </asp:Literal>
                        <br />

                        <%-- Literais --%>
                        <div class="col-12 row m-0">
                            <div class="col-md-11 pl-0 row m-0">
                                <div class="col-md-12 px-0 pb-2 row m-0">
                                    <div class="text-center col-12 p-1 col-md-2">
                                        <label class="font-weight-bolder">Cliente:</label>
                                    </div>
                                    <div class="col-12 col-md-10 form-control pr-0">
                                        <asp:Literal ID="ltlCliente" runat="server"></asp:Literal>
                                    </div>
                                    <asp:HiddenField ID="hfCliente" runat="server" />
                                </div>
                                <div class="col-md-12 px-0 row m-0">
                                    <div class="text-center p-1 col-12 col-md-2">
                                        <label class="font-weight-bolder">Veículo:</label>
                                    </div>
                                    <div class="col-12 col-md-10 form-control">
                                        <asp:Literal ID="ltlVeiculo" runat="server"></asp:Literal>
                                    </div>
                                    <asp:HiddenField ID="hfVeiculo" runat="server" />
                                </div>
                            </div>

                            <%--Botão Limpar--%>
                            <div class="col-md-1 py-4 px-2">
                                <asp:LinkButton ID="btnLimpar" CssClass="btn btn-outline-danger btn-block px-0" runat="server" OnClick="btnLimpar_Click">
                                    <svg class="bi bi-x" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" viewBox="0 0 16 16">
                                        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
                                    </svg>
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>

                    <%-- Categorias e preço --%>
                    <div class="col-12 text-center mt-3 row m-0">

                        <%--Tipo de Serviço--%>
                        <div class="col-lg-6 col-md-12 col-12 p-0 pb-1 row m-0">
                            <div class="h6 col-lg-5 col-md-4 col-12 p-1 m-0">
                                <label>Tipo de Serviço:</label>
                            </div>
                            <div class="col-lg-7 col-md-8 col-12 p-0">
                                <asp:DropDownList ID="ddlDescricaoDoServico" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0">Selecione</asp:ListItem>
                                    <asp:ListItem Value="1">Orçamento</asp:ListItem>
                                    <asp:ListItem Value="2">Reparo</asp:ListItem>
                                    <asp:ListItem Value="3">Troca</asp:ListItem>
                                    <asp:ListItem Value="4">Limpeza</asp:ListItem>
                                    <asp:ListItem Value="5">Outros</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <%--Preço--%>
                        <div class="col-lg-6 col-md-12 col-12 p-0  pt-1 row m-0">
                            <div class="h6 col-lg-5 col-md-4 col-12 p-1 m-0">
                                <label>Preço Combinado:</label>
                            </div>
                            <div class="col-lg-7 col-md-8 col-12 p-0">
                                <asp:TextBox ID="txtPreco" runat="server" Type="number" value="0" step="0.01" title="Currency"
                                    pattern="^\d+(?:\.\d{1,2})?$" onblur="this.parentNode.parentNode.style.color=/^\d+(?:\.\d{1,2})?$/.test(this.value)?'inherit':'#c82333'"
                                    required="required" CssClass="form-control" min="0">
                                </asp:TextBox>
                            </div>
                        </div>

                        <%--Confirmar se foi pago--%>
                        <div class="col-12 col-lg-12 pt-2 row m-0">
                            <div class="h5 col-6 col-lg-6 pl-0" style="text-align: end">
                                <label>Já foi pago?</label>
                            </div>
                            <div class="col-6 col-lg-6">
                                <asp:RadioButtonList ID="rblPago" runat="server" RepeatDirection="Horizontal" CellPadding="5">
                                    <asp:ListItem  Value="S">Sim</asp:ListItem>
                                    <asp:ListItem  Value="N">Não</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                    </div>
                </section>

                <%--Observações Adicionais--%>
                <section class="mt-2 bg-white container text-center py-2" style="border-radius: 5px;">
                    <label class="h4 col-12">
                        Observações adicionais:
                    </label>
                    <div>
                        <asp:TextBox ID="TextBox1" runat="server" placeholder="Coloque seus registros aqui! Registre todos os acontecimentos." TextMode="multiline" class="form-control textarea" Rows="4" cols="20" Height="300px" Style="resize: none"></asp:TextBox>
                    </div>
                </section>

            </nav>

        </div>

        <%--Modais--%>

        <%--Modal Selecionar Cliente--%>
        <div class="modal fade" id="Selecionar" tabindex="-1" aria-labelledby="SelecionarLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="SelecionarLabel">Selecionar Cliente e Veículo</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body container row">
                        <div class="col-12">
                            <label>
                                <img src="../img/person.svg" css="col-6" width="30">
                            </label>
                            <asp:DropDownList ID="ddlSelectCliente" CssClass="col-6 form-control" Style="display: inline" runat="server" OnSelectedIndexChanged="ddlSelectCliente_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        </div>
                        <div class="col-12">
                            <label>
                                <img src="../img/carro.svg" css="col-6" width="30">
                            </label>
                            <asp:DropDownList ID="ddlSelectVeiculo" CssClass="col-6 form-control" Style="display: inline" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        <asp:LinkButton ID="btnSelecionar" CssClass="btn btn-primary" runat="server" OnClick="btnSelecionar_Click">Selecionar</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>

        <%-- Modal Adicionar Cliente--%>
        <div class="modal fade" id="Cadastrar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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

        <%--Modal Confirmar Voltar--%>
        <div class="modal fade" id="ConfirmaVoltar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-danger" id="examplModalLabel">Deseja mesmo voltar ao Menu?</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="card-body">Os dados inseridos serão descartados!</div>
                    <div class="modal-footer">
                        <asp:LinkButton ID="ModalbtnVoltarConf" class="btn btn-outline-secondary" href="Registros.aspx" runat="server">Sair</asp:LinkButton>
                        <asp:Button ID="ModalbtnFecharConf" CssClass="btn btn-outline-primary" data-dismiss="modal" Text="Continuar Editando" runat="server" />
                    </div>
                </div>
            </div>
        </div>

    </main> <%--Toast de Mensagem--%>
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

        if (<%= ModalCliente ? "true" : "false" %>) {
            $("#Selecionar").modal('show');
        }
        if (<%= msg ? "true" : "false" %>) {
            $("#msg").toast('show');
        }
    </script>

</asp:Content>

