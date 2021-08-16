using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class Login : System.Web.UI.Page{

    protected void Page_Load(object sender, EventArgs e){
        if (Session["usuario"] != null){

            Response.Redirect("Mecanico/Registros.aspx");

        }



    }

    protected void btn_Click(object sender, EventArgs e){

        Mecanico mec = new Mecanico();
        mec.Mec_email = txtEmail.Text;
        mec.Mec_senha = txtSenha.Text;

        DataSet ds = MecanicoBD.VerificaLogin(mec);

        if(ds.Tables[0].Rows.Count == 1){

            Session["mec_id"] = ds.Tables[0].Rows[0]["mec_id"].ToString();
            Session["nome"] = ds.Tables[0].Rows[0]["mec_nome"].ToString();
            Session["email"] = ds.Tables[0].Rows[0]["mec_email"].ToString();
            Session["usuario"] = mec;

            Response.Redirect("Mecanico/Registros.aspx");
        }
            else{

            ltl.Text = "<div class='alert-warning  offset-1 col-10 offset-1 text-center'>Login ou senha incorretos</div>";
            }

    }

       

}