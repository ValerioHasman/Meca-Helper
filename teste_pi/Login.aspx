<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>O Mecahelper</title>
    <link rel="shortcut icon" href="img/ICONE.ico" type="image/x-icon" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/estilo.css" rel="stylesheet" />
</head>
<body id="topo">
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-dark fixed-top navbar-expand-md navbar-no-bg ">
                <div class="container">
                    <img src="img/LOGOn.svg" alt="svg" width="200" class="logo" />
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav ml-auto">

                            <li class="nav-item">
                                <!-- button -->
                                <button type="button" class="btn btn-dark  btn-outline-secondary navbar-brand"
                                    data-toggle="modal" data-target="#exampleModalCenter">
                                    Login
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <!-- Modal -->
            <div class="modal fade " id="exampleModalCenter" tabindex="-1" role="dialog"
                aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Login</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <div class="row">

                                    <div class="col-12">
                                        <label>E-mail:</label>
                                        <br />
                                        <asp:TextBox ID="txtEmail" CssClass="form-control" type="email" runat="server"></asp:TextBox>
                                        <br />
                                        <label>Senha:</label>
                                        <br />
                                        <asp:TextBox ID="txtSenha" CssClass="form-control" type="password" runat="server"></asp:TextBox>
                                    </div>

                                    <div class="col-12 p-1 m-1">
                                        <asp:Literal ID="ltl" runat="server"></asp:Literal>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btn" runat="server" CssClass="btn btn-primary" Text="Logar" OnClick="btn_Click" />
                            <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Voltar</button>
                        </div>
                    </div>
                </div>
            </div>


            <div class="carousel slide carousel-fluid " data-ride="carousel" data-interval="2000">
                <div class="carousel-inner">

                    <div class="carousel-item active">
                        <img class="img-fluid " id="responsiv" src="img/pexels-cottonbro-4482014.jpg" alt="Third slide" />
                    </div>

                    <div class="carousel-item">
                        <img class="img-fluid " id="responsiv" src="img/pexels-cottonbro-4489708.jpg" alt="Third slide" />
                    </div>

                    <div class="carousel-item">
                        <img class="img-fluid " id="responsiv" src="img/pexels-malte-luk-2244746.jpg" alt="Second slide" />
                    </div>

                    <div class="carousel-item">
                        <img class=" img-fluid " id="responsiv" src="img/pexels-gratisography-474.jpg" alt="First slide" />
                    </div>

                    <!--Legendas-->
                    <div class="container " id="caixa">
                        <div class="main-text hidden-xs col-lg-12" id="conteudo">
                            <div class="text-center">
                                <h3>O MecaHelper</h3>
                                <h6>Seja bem vindo ao MecaHelper, Mecânico! Seu assistente online 
                                    <strong>...Gratuito!</strong>
                                    Com o Mecahelper, você não só escreverá facilmente, mas também poderá cadastrar melhor seus clientes e peças, além de acompanhar gráficos que te dirão como anda o seu negócio!</h6>
                                <a class="btn btn-dark mt-2 btn-outline-secondary text-white" href="Cadastro.aspx">Cadastre-se</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="container" style="margin-top: 5%; margin-bottom: 5%; text-align: center;">
                <div class="row">

                    <div class="col-lg-4 col-sm-12">
                        <img class=" w-25 img-fluid" src="img/historico-medico.png" alt="Card image cap" />
                        <h5 class="mt-3">Crie Registros</h5>
                        <h6 class="text-dark">Com poucos cliques, você poderá criar registros de forma rápida selecionando seus clientes e veículos sem mais enrolações.

                        </h6>
                    </div>

                    <div class="col-lg-4 col-sm-12">
                        <img class=" w-25 img-fluid" src="img/1686805.png" alt="Card image cap" />
                        <h5 class="mt-3">Adicione Clientes</h5>
                        <h6 class="text-dark">Essa agenda te ajudará não só em agilizar a criação de seus registros, como também estará sempre pronta para você adicionar detalhes importantes de seus clientes e seu negócio!
                        </h6>
                    </div>

                    <div class="col-lg-4 col-sm-12">
                        <img class=" w-25 img-fluid" src="img/search.png" alt="Card image cap" />
                        <h5 class="mt-3">Gráficos Guia</h5>
                        <h6 class="text-dark">Com nossos gráficos inteligentes, você poderá conhecer qual o status de sua oficina com base nos registros que criar! ...E com os filtros que ele possui, explorar tudo isso se torna ainda mais fácil.
                        </h6>
                    </div>

                    <div class="col-12 text-right mt-3">
                        <a href="#topo" class="btn btn-dark">
                            <i class="bi bi-arrow-90deg-up">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-90deg-up" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M4.854 1.146a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L4 2.707V12.5A2.5 2.5 0 0 0 6.5 15h8a.5.5 0 0 0 0-1h-8A1.5 1.5 0 0 1 5 12.5V2.707l3.146 3.147a.5.5 0 1 0 .708-.708l-4-4z" />
                                </svg>
                            </i>
                        </a>
                    </div>

                </div>
            </div>

            <footer class="col-12 text-center text-white bg-dark ">
                ©Mecahelper
            </footer>
        </div>
    </form>
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>