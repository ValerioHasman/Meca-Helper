using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Mecanico_AgendadeCliente : System.Web.UI.Page
{
    protected bool modalAdicionarVeiculo;
    protected bool modalAlterarVeiculo;
    protected bool modalAlterarCliente;
    protected bool msg;

    protected void Page_Load(object sender, EventArgs e){

        modalAdicionarVeiculo = false;
        modalAlterarVeiculo = false;
        modalAlterarCliente = false;
        msg = false;

        if (!IsPostBack)
        {
            atualizarPagina();
        }

    }



    void atualizarPagina()
    {

        /* Busca todos os cliente no banco de dados */
        string id = (Session["mec_id"]).ToString();
        DataSet dsCliente = ClienteBD.SelectClientes(id);

        /* Preenche os cards com todos os usuários do banco */
        rptClientes.DataSource = dsCliente.Tables[0];
        rptClientes.DataBind();

        if (dsCliente.Tables[0].Rows.Count == 0)
        {

            ltlSemCliente.Text = "<div  class='col-12 text-white text-center h5'>Sem Clientes</div>";
        }
        else
        {
            ltlSemCliente.Text = "";
        }

    }

    void atualizarPesquisa()
    {

        string id = (Session["mec_id"]).ToString();
        string pesquisa = txtPesquisa.Text;
        DataSet dsCliente = ClienteBD.SelectClientesPesquisa(id, pesquisa);

        rptClientes.DataSource = dsCliente.Tables[0];
        rptClientes.DataBind();


        if (dsCliente.Tables[0].Rows.Count == 0)
        {

            ltlSemCliente.Text = "<div  class='col-12 text-white text-center h5'>Cliente Não Encontrado</div>";
        }
        else
        {
            ltlSemCliente.Text = "";
        }

    }


    /*Encontra o repetidor veiculos dentro do repetidor clientes e traz as tabela dos veiculos relacionados ao seu cliente*/
    protected void rptVeiculo_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

        Repeater rptVeiculos = (Repeater)e.Item.FindControl("rptVeiculos");

        HiddenField hfCliente = (HiddenField)e.Item.FindControl("hidIdCliente");
        int cli_id = Convert.ToInt32(hfCliente.Value);

        Cliente c = new Cliente();
        c.Cli_id = cli_id;

        DataSet dss = VeiculoBD.SelectVeiculos(c);
        rptVeiculos.DataSource = dss;
        rptVeiculos.DataBind();

        if (dss.Tables[0].Rows.Count == 0)
        {

            Literal ltl = (Literal)e.Item.FindControl("ltlSemVeiculos");
            ltl.Text = "<div  class=' col-12 text-center text-secondary h5'>Sem Veículos</div>";
        }
    }

    protected void btn_CadastroClienteVeiculo_Confirmar(object sender, EventArgs e)
    {
        
        Cliente cliente = new Cliente();
        cliente.Mec_id = new Mecanico();
        cliente.Mec_id.Mec_id = Convert.ToInt32(Session["mec_id"].ToString());
        cliente.Cli_nome = txtNome.Text;
        cliente.Cli_celular = txtCelular.Text;
        cliente.Cli_cpfcnpj = txtCpfCnpj.Text;
        cliente.Cli_endereco = txtEndereco.Text;

        Veiculo veiculo = new Veiculo();
        veiculo.Vei_marca = txtMarca.Text;
        veiculo.Vei_modelo = txtModelo.Text;
        veiculo.Vei_ano = txtAno.Text;
        veiculo.Vei_placa = txtPlaca.Text;
        veiculo.Cli_id = new Cliente();
        veiculo.Cli_id.Cli_id = ClienteBD.CadastroCliente(cliente);
        VeiculoBD.CadastroVeiculo(veiculo);

        atualizarPagina();
        ltlMsg.Text = "<div class='text-center text-success'>Cliente e Veículo cadastrados Com Sucesso!!</div>";
        this.msg = true;
    }

    protected void btn_Pesquisa(object sender, EventArgs e)
    {

        atualizarPesquisa();

    }

    protected void btn_AdicionarVeiculo(object sender, EventArgs e){

        modalAdicionarVeiculo = true;
        LinkButton btn = (LinkButton)sender;
        RepeaterItem item = (RepeaterItem)btn.NamingContainer;
        hidAddVeiculo.Value = ((item.FindControl("hidIdCliente") as HiddenField).Value).ToString();
     
    }

    protected void btn_AdicionarVeiculoConfirma(object sender, EventArgs e){

        Veiculo veiculo = new Veiculo();
        veiculo.Vei_marca = txtMarcaAdd.Text;
        veiculo.Vei_modelo = txtModeloAdd.Text;
        veiculo.Vei_ano = txtAnoAdd.Text;
        veiculo.Vei_placa = txtPlacaAdd.Text;
        veiculo.Cli_id = new Cliente();
        veiculo.Cli_id.Cli_id = Convert.ToInt32(hidAddVeiculo.Value);
        VeiculoBD.CadastroVeiculo(veiculo);

        atualizarPagina();
        ltlMsg.Text = "<div class='text-center text-success'>Veículo Adicionado Com Sucesso!!</div>";
        this.msg = true;
    }

    protected void btnAlterarVeiculo_Click(object sender, EventArgs e)
    {
        modalAlterarVeiculo = true;
        LinkButton btn = (LinkButton)sender;
        RepeaterItem item = (RepeaterItem)btn.NamingContainer;
        hidIdVeiculo.Value = (item.FindControl("hidVeiculoId") as HiddenField).Value;
        txtAltPlaca.Text = (item.FindControl("lblVeiculoPlaca") as Label).Text;
        txtAltMarca.Text = (item.FindControl("lblVeiculoMarca") as Label).Text;
        txtAltModelo.Text = (item.FindControl("lblVeiculoModelo") as Label).Text;
        txtAltAno.Text = (item.FindControl("lblVeiculoAno") as Label).Text;


    }

    protected void btnAlterarVeiculoConfirma_Click(object sender, EventArgs e)
    {
        Veiculo veiculo = new Veiculo();
        veiculo.Vei_marca = txtAltMarca.Text;
        veiculo.Vei_modelo = txtAltModelo.Text;
        veiculo.Vei_ano = txtAltAno.Text;
        veiculo.Vei_placa = txtAltPlaca.Text;
        veiculo.Vei_id = Convert.ToInt32(hidIdVeiculo.Value);
        VeiculoBD.UpdateVeiculo(veiculo);

        atualizarPagina();
        ltlMsg.Text = "<div class='text-center text-success'>Veículo Alterado Com Sucesso!!</div>";
        this.msg = true;
    }

    protected void btnEditarCliente_Click(object sender, EventArgs e)
    {
        modalAlterarCliente = true;
        LinkButton btn = (LinkButton)sender;
        RepeaterItem item = (RepeaterItem)btn.NamingContainer;
        hidAltCliente.Value = (item.FindControl("hidIdCliente") as HiddenField).Value;
        txtAltNome.Text = (item.FindControl("lblNome") as Label).Text;
        txtAltCelular.Text = (item.FindControl("lblCelular") as Label).Text;
        txtAltCpfCnpj.Text = (item.FindControl("lblCpfCnpj") as Label).Text;
        txtAltEndereco.Text = (item.FindControl("lblEndereço") as Label).Text;
    }

    protected void btnAlterarClienteConfirma_Click(object sender, EventArgs e)
    {
        Cliente cliente = new Cliente();
        cliente.Cli_id = Convert.ToInt32(hidAltCliente.Value);
        cliente.Cli_nome = txtAltNome.Text;
        cliente.Cli_celular = txtAltCelular.Text;
        cliente.Cli_cpfcnpj = txtAltCpfCnpj.Text;
        cliente.Cli_endereco = txtAltEndereco.Text;
        ClienteBD.UpdateCliente(cliente);

        atualizarPagina();
        ltlMsg.Text = "<div class='text-center text-success'>Cliente Alterado Com Sucesso!!</div>";
        this.msg = true;
    }

    protected void btnfilaz_Click(object sender, EventArgs e)
    {
        string id = (Session["mec_id"]).ToString();
        DataSet dsCliente = ClienteBD.SelectFiltroasc(id);

        /* Preenche os cards com todos os usuários do banco */
        rptClientes.DataSource = dsCliente.Tables[0];
        rptClientes.DataBind();

        if (dsCliente.Tables[0].Rows.Count == 0)
        {

            ltlSemCliente.Text = "<div  class='col-12 text-white text-center h5'>Sem Clientes</div>";
        }
        else
        {
            ltlSemCliente.Text = "";
        }
    }

    protected void btnfilza_Click(object sender, EventArgs e)
    {
        string id = (Session["mec_id"]).ToString();
        DataSet dsCliente = ClienteBD.SelectFiltrodesc(id);

        /* Preenche os cards com todos os usuários do banco */
        rptClientes.DataSource = dsCliente.Tables[0];
        rptClientes.DataBind();

        if (dsCliente.Tables[0].Rows.Count == 0)
        {

            ltlSemCliente.Text = "<div  class='col-12 text-white text-center h5'>Sem Clientes</div>";
        }
        else
        {
            ltlSemCliente.Text = "";
        }
    }

    protected void btnlimpa_Click(object sender, EventArgs e)
    {
        atualizarPagina();
    }
}

