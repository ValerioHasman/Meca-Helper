using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Mecanico_MasterPage : System.Web.UI.MasterPage {
    protected void Page_Load(object sender, EventArgs e) {

        Mecanico mec;

        if (Session.Count == 0) Response.Redirect("../Login.aspx");
        if (Session["usuario"] != null) {
            //ltlNome.Text ="<div class='text-success'>" + Session["email"] as string + "</div>";


        }
        else {

            Response.Redirect("../Login.aspx");
        }

    }

    protected void btnSair_Click(object sender, EventArgs e) {

        Session.Remove("usuario");
        Response.Redirect("../Login.aspx");
    }

}

