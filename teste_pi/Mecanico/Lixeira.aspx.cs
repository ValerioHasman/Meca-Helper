using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Mecanico_Lixeira : System.Web.UI.Page
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

    void atualizarPesquisa()
    {

        string id = (Session["mec_id"]).ToString();
        string pesquisa = txtPesquisa.Text;
        DataSet dsRegistro = RegistroBD.SelectLixeiraPesquisa(id, pesquisa);

        rptRegsitros.DataSource = dsRegistro.Tables[0];
        rptRegsitros.DataBind();


        if (dsRegistro.Tables[0].Rows.Count == 0)
        {

            ltlSemRegistros.Text = "<div  class='col-12 text-white text-center h5'>Cliente Não Encontrado</div>";
        }
        else
        {
            ltlSemRegistros.Text = "";
        }

    }

    void atualizarPagina()
    {

        /* Busca todos os Registros no banco de dados */
        string id = (Session["mec_id"]).ToString();
        DataSet dsCliente = RegistroBD.SelectRegistrosExcluidos(id);

        /* Preenche os cards com todos os usuários do banco */
        rptRegsitros.DataSource = dsCliente.Tables[0];
        rptRegsitros.DataBind();

        if (dsCliente.Tables[0].Rows.Count == 0)
        {
            ltlSemRegistros.Text = "<div  class='col-12 text-white text-center h5'>Sem Registros</div>";
        }
        else
        {
            ltlSemRegistros.Text = "";
        }

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        this.modalExcluirRegistro = true;
        LinkButton btn = (LinkButton)sender;
        RepeaterItem item = (RepeaterItem)btn.NamingContainer;
        hidIdRegistroEcluir.Value = (item.FindControl("hidIdRegistro") as HiddenField).Value;
    }

    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        Registro reg = new Registro();
        reg.Reg_id = Convert.ToInt32(hidIdRegistroEcluir.Value);
        RegistroBD.UpdateRestaurarRegistro(reg);
        atualizarPagina();
        ltlMsg.Text = "<div class='text-center text-success'>Item Restaurado Com Sucesso!!</div>";
        this.msg = true;
    }

    protected void btnPesquisa_Click(object sender, EventArgs e)
    {

        atualizarPesquisa();

    }
}