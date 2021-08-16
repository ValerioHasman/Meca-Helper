using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["usuario"] != null)
        {

            Response.Redirect("Mecanico/Registros.aspx");

        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Mecanico u = new Mecanico();
        u.Mec_nome = txtNome.Text + " " + txtSobrenome.Text;
        u.Mec_email = txtEmail.Text;
        u.Mec_senha = txtSenha.Text;
        u.Mec_cpfcnpj = txtCNPJ.Text;

        if (txtSenha.Text != txtConfSenha.Text){

            ltl.Text = "<div class='offset-2 col-8 offset-2 alert-danger text-center'>Senhas diferentes </div>";

        }
        else{
            switch (MecanicoBD.Cadastro(u)){

                case 0:

                    Mecanico mec = new Mecanico();
                    mec.Mec_email = txtEmail.Text;
                    mec.Mec_senha = txtSenha.Text;

                    DataSet ds = MecanicoBD.VerificaLogin(mec);

                    if (ds.Tables[0].Rows.Count == 1){

                        Session["mec_id"] = ds.Tables[0].Rows[0]["mec_id"].ToString();
                        Session["nome"] = ds.Tables[0].Rows[0]["mec_nome"].ToString();
                        Session["email"] = ds.Tables[0].Rows[0]["mec_email"].ToString();
                        Session["usuario"] = mec;

                        Response.Redirect("Mecanico/Registros.aspx");
                    }
                    break;

                case -2:

                    ltl.Text = "<div class='alert  alert-danger'> >>>  Erro  <<< </div>";
                    break;
            }
        }
    }
}

