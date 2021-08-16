<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cadastro.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Cadastre-se ainda hoje!</title>
    <link rel="shortcut icon" href="img/ICONE.ico" type="image/x-icon" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/estilo.css" rel="stylesheet" />
    <style>
        body {
            background: url("img/pexels-cottonbro-4482014.jpg") no-repeat center center fixed;
            background-size: cover;
        }

        label {
            padding-top: .5rem;
            padding-bottom: .5rem;
            margin-bottom: 0;
            display: block;
        }

    </style>
    <script src="Scripts/jquery-1.2.6.pack.js"></script>
    <script src="Scripts/jquery.maskedinput-1.1.4.pack.js"></script>
</head>
<body class="text-white">

    <form id="form1" runat="server">

        <nav class="navbar navbar-dark navbar-expand-md navbar-no-bg m" style="backdrop-filter: blur(0.15rem);">
            <div class="container" style="padding-top: 30px; padding-bottom: 30px;">


                <a href="Login.aspx" class="h2" style="color: white; text-decoration: none;">
                    <i class="bi bi-arrow-return-left">
                        <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z" />
                        </svg>
                    </i>
                    <img src="img/LOGOn.svg" alt="svg" width="200" class="logo"/>
                </a>

            </div>
        </nav>

        <main class="container col-10 " style="background: rgba(38, 39, 41, 0.780); backdrop-filter: blur(0.15rem);">
            <div style="padding-top: 30px; padding-bottom: 30px;">
                <div class="col-12 text-center h2 mb-2">Cadastro</div>
                <h3 class="">Insira os dados, e cadastre-se!</h3>
            </div>

            <div class="row">
                <div class="col-xl-6 col-sm-12">
                    <label for="txtNome">Nome:</label>
                    <asp:TextBox ID="txtNome" CssClass="form-control" runat="server" placeholder="obrigatorio" required="required"></asp:TextBox>
                </div>
                <div class="col-xl-6 col-sm-12">
                    <label for="txtSobrenome">Sobrenome:</label>
                    <asp:TextBox ID="txtSobrenome" CssClass="form-control" runat="server" placeholder="obrigatorio" required="required"></asp:TextBox>
                </div>
                <div class="col-12 mt-2">
                    <label for="txtEmail">E-mail:</label>
                    <asp:TextBox ID="txtEmail" CssClass="form-control" type="email" runat="server" placeholder="obrigatorio" required="required"></asp:TextBox>
                </div>
                <div class="col-12 mt-2">
                    <label for="txtNomeEmpresa">Nome da empresa:</label>
                    <asp:TextBox ID="txtNomeEmpresa" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-12 mt-2">
                    <label for="txtCNPJ">CNPJ da empresa:</label>
                    <asp:TextBox ID="txtCNPJ" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-xl-6 col-sm-12 mt-2">
                    <label for="txtSenha">Senha:</label>
                    <asp:TextBox ID="txtSenha" CssClass="form-control" type="password" MaxLength="8" runat="server" placeholder="obrigatorio" required="required"></asp:TextBox>
                </div>
                <div class="col-xl-6 col-sm-12 mt-2">
                    <label for="txtConfSenha">Confirmar Senha:</label>
                    <asp:TextBox ID="txtConfSenha" CssClass="form-control" type="password" MaxLength="8" runat="server" placeholder="obrigatorio" required="required"></asp:TextBox>
                </div>

                <div class="col-12 font-weight-bold my-2">
                    <asp:Literal ID="ltl" runat="server"></asp:Literal>
                </div>
            </div>

            <div style="padding-bottom: 5px">
                <asp:Button ID="Button1" CssClass="form-control btn btn-secondary mb-3" runat="server" Text="finalizar cadastro" OnClick="Button1_Click" />
            </div>
        </main>
        <footer class="col-12 text-center text-white bg-dark ">
            ©Mecahelper
        </footer>
    </form>

    <%--<script src="Scripts/jquery-3.6.0.min.js"></script>--%>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" defer="defer">
        $(document).ready(function () {
            $("#txtCNPJ").mask("99.999.999/9999-99");
        });
    </script>
</body>
</html>