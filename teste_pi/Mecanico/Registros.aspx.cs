using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Mecanico_Registos : System.Web.UI.Page
{
    protected bool modalExcluirRegistro;
    protected bool msg;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.modalExcluirRegistro = false;
        this.msg = false;
        if (!IsPostBack)
        {
            atualizarPagina();
        }

    }



    void atualizarPagina()
    {

        /* Busca todos os Registros no banco de dados */
        string id = (Session["mec_id"]).ToString();
        DataSet dsCliente = RegistroBD.SelectRegistros(id);

        /* Preenche os cards com todos os usuários do banco */
        rptRegistros.DataSource = dsCliente.Tables[0];
        rptRegistros.DataBind();

        if (dsCliente.Tables[0].Rows.Count == 0)
        {
            ltlSemRegistros.Text = "<div  class='col-12 text-white text-center h5'>Sem Registros</div>";
        }
        else
        {
            ltlSemRegistros.Text = "";
        }

    }
    void atualizarPesquisa()
    {

        string id = (Session["mec_id"]).ToString();
        string pesquisa = txtPesquisa.Text;
        DataSet dsRegistro = RegistroBD.SelectRegistrosPesquisa(id, pesquisa);

        rptRegistros.DataSource = dsRegistro.Tables[0];
        rptRegistros.DataBind();


        if (dsRegistro.Tables[0].Rows.Count == 0)
        {

            ltlSemRegistros.Text = "<div  class='col-12 text-white text-center h5'>Cliente Não Encontrado</div>";
        }
        else
        {
            ltlSemRegistros.Text = "";
        }

    }

    protected void btnPesquisa_Click(object sender, EventArgs e)
    {

        atualizarPesquisa();

    }

    protected void btnExcluirRegistro_Click(object sender, EventArgs e)
    {
        this.modalExcluirRegistro = true;
        LinkButton btn = (LinkButton)sender;
        RepeaterItem item = (RepeaterItem)btn.NamingContainer;
        hidIdRegistroEcluir.Value = (item.FindControl("hidIdRegistro") as HiddenField).Value;
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Registro reg = new Registro();
        reg.Reg_id = Convert.ToInt32(hidIdRegistroEcluir.Value);
        RegistroBD.UpdateExcluirRegistro(reg);
        atualizarPagina();
        ltlMsg.Text = "<div class='text-center text-success'>Registro Excluido Com Sucesso!!</div>";
        this.msg = true;
    }

    protected void btnfiltroaz_Click(object sender, EventArgs e)
    {
        string id = (Session["mec_id"]).ToString();
        string pesquisa = txtPesquisa.Text;
        DataSet dsRegistro = RegistroBD.SelectFiltrosaz(id);

        rptRegistros.DataSource = dsRegistro.Tables[0];
        rptRegistros.DataBind();


        if (dsRegistro.Tables[0].Rows.Count == 0)
        {

            ltlSemRegistros.Text = "<div  class='col-12 text-white text-center h5'>Cliente Não Encontrado</div>";
        }
        else
        {
            ltlSemRegistros.Text = "";
        }
    }

    protected void btnfiltroza_Click(object sender, EventArgs e)
    {
        string id = (Session["mec_id"]).ToString();
        string pesquisa = txtPesquisa.Text;
        DataSet dsRegistro = RegistroBD.SelectFiltrosza(id);

        rptRegistros.DataSource = dsRegistro.Tables[0];
        rptRegistros.DataBind();


        if (dsRegistro.Tables[0].Rows.Count == 0)
        {

            ltlSemRegistros.Text = "<div  class='col-12 text-white text-center h5'>Cliente Não Encontrado</div>";
        }
        else
        {
            ltlSemRegistros.Text = "";
        }
    }


    protected void btnfiltrodataasc_Click1(object sender, EventArgs e)
    {
        string id = (Session["mec_id"]).ToString();
        string pesquisa = txtPesquisa.Text;
        DataSet dsRegistro = RegistroBD.SelectFiltroDataRec(id);

        rptRegistros.DataSource = dsRegistro.Tables[0];
        rptRegistros.DataBind();


        if (dsRegistro.Tables[0].Rows.Count == 0)
        {

            ltlSemRegistros.Text = "<div  class='col-12 text-white text-center h5'>Cliente Não Encontrado</div>";
        }
        else
        {
            ltlSemRegistros.Text = "";
        }
    }

    protected void btnfiltrodatadesc_Click(object sender, EventArgs e)
    {
        string id = (Session["mec_id"]).ToString();
        string pesquisa = txtPesquisa.Text;
        DataSet dsRegistro = RegistroBD.SelectFiltroDataAnt(id);

        rptRegistros.DataSource = dsRegistro.Tables[0];
        rptRegistros.DataBind();


        if (dsRegistro.Tables[0].Rows.Count == 0)
        {

            ltlSemRegistros.Text = "<div  class='col-12 text-white text-center h5'>Cliente Não Encontrado</div>";
        }
        else
        {
            ltlSemRegistros.Text = "";
        }
    }

    protected void btnlimpar_Click(object sender, EventArgs e)
    {
        atualizarPagina();
    }

    protected void btnpago_Click(object sender, EventArgs e)
    {
        string id = (Session["mec_id"]).ToString();
        string pesquisa = txtPesquisa.Text;
        DataSet dsRegistro = RegistroBD.SelectFiltroPago(id);

        rptRegistros.DataSource = dsRegistro.Tables[0];
        rptRegistros.DataBind();


        if (dsRegistro.Tables[0].Rows.Count == 0)
        {

            ltlSemRegistros.Text = "<div  class='col-12 text-white text-center h5'>Cliente Não Encontrado</div>";
        }
        else
        {
            ltlSemRegistros.Text = "";
        }
    }

    protected void btnnaopago_Click(object sender, EventArgs e)
    {
        string id = (Session["mec_id"]).ToString();
        string pesquisa = txtPesquisa.Text;
        DataSet dsRegistro = RegistroBD.SelectFiltronaoPago(id);

        rptRegistros.DataSource = dsRegistro.Tables[0];
        rptRegistros.DataBind();


        if (dsRegistro.Tables[0].Rows.Count == 0)
        {

            ltlSemRegistros.Text = "<div  class='col-12 text-white text-center h5'>Cliente Não Encontrado</div>";
        }
        else
        {
            ltlSemRegistros.Text = "";
        }
    }

    protected void btnAlterarRegistro_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        RepeaterItem item = (RepeaterItem)btn.NamingContainer;
        Session["reg_id"] = (item.FindControl("hidIdRegistro") as HiddenField).Value;

        Response.Redirect("AlterarRegistro.aspx");
                           
    }
}