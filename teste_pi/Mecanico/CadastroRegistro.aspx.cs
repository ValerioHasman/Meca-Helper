using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Mecanico_CadastroRegistro : System.Web.UI.Page
{
    protected bool ModalCliente;
    protected bool msg;
    protected void Page_Load(object sender, EventArgs e)
    {
        ModalCliente = false;

        if (!IsPostBack)
        {
            atualizarPagina();        
        }
    }

    void atualizarPagina()
    {

        carregaddlCliente();

    }

    void carregaddlCliente()
    {

        Mecanico mec = new Mecanico();
        mec.Mec_id = Convert.ToInt32(Session["mec_id"].ToString());
        DataSet ds = ClienteBD.ddlSelectCliente(mec);
        ddlSelectCliente.DataSource = ds;
        ddlSelectCliente.DataTextField = "cli_nome";
        ddlSelectCliente.DataValueField = "cli_id";
        ddlSelectCliente.DataBind();
        ddlSelectCliente.Items.Insert(0, "Selecione um Cliente");

    }

    protected void btnCliNovo_Click(object sender, EventArgs e)
    {

    }

    protected void btnCliCad_Click(object sender, EventArgs e)
    {

    }

    protected void ddlSelectCliente_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        ModalCliente = true;
        Cliente cli = new Cliente();
        cli.Cli_id = Convert.ToInt32(ddlSelectCliente.SelectedValue);
        DataSet ds = VeiculoBD.ddlSelectVeiculo(cli);
        ddlSelectVeiculo.DataSource = ds;
        ddlSelectVeiculo.DataTextField = "vei_placa";
        ddlSelectVeiculo.DataValueField = "vei_id";
        ddlSelectVeiculo.DataBind();
        ddlSelectVeiculo.Items.Insert(0, "Selecione um Veículo");

    }

    protected void btnSelecionar_Click(object sender, EventArgs e)
    {

        ltlCliente.Text = ddlSelectCliente.SelectedItem.Text;
        ltlVeiculo.Text = ddlSelectVeiculo.SelectedItem.Text;
        hfCliente.Value = ddlSelectCliente.SelectedValue;
        hfVeiculo.Value = ddlSelectVeiculo.SelectedValue;
        selecao.Visible = false;

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
        ltlMsg.Text = "<div class='text-center text-success'>Cliente e Veículo cadastrados e Selecionados com Sucesso!!</div>";
        msg = true;

        atualizarPagina();
    }

    protected void btnRelSalvar_Click(object sender, EventArgs e)
    {
        string id = (Session["mec_id"].ToString());
        Registro reg = new Registro();
        reg.Reg_pago = rblPago.SelectedValue;
        reg.Reg_precototal = Convert.ToDouble(txtPreco.Text.Replace('.', ','));
        reg.Reg_data = DateTime.Now;
        reg.Vei_id = new Veiculo();
        reg.Vei_id.Vei_id = Convert.ToInt32(hfVeiculo.Value);
        reg.Mec_id = new Mecanico();
        reg.Mec_id.Mec_id = Convert.ToInt32(Session["mec_id"].ToString());
        reg.Reg_descricao = ddlDescricaoDoServico.SelectedItem.Text;
        reg.Reg_observacao = TextBox1.Text;

        RegistroBD.CadastroRegistro(reg);
        DataSet ds = RegistroBD.SelectUltimoRegistro(id);

        hidIdRegistro.Value = ds.Tables[0].Rows[0]["reg_id"].ToString();

        ltlMsg.Text = "<div class='text-center text-success'>Registro Salvo com Sucesso!!</div>";
        msg = true;
        btnRelSalvar.Visible = false;
        btnRelAlterar.Visible = true;
    }

    protected void btnRelAlterar_Click(object sender, EventArgs e)
    {
        Registro reg = new Registro();
        reg.Reg_pago = rblPago.SelectedValue;
        reg.Reg_precototal = Convert.ToDouble(txtPreco.Text.Replace('.', ','));
        reg.Reg_data = DateTime.Now;
        reg.Vei_id = new Veiculo();
        reg.Vei_id.Vei_id = Convert.ToInt32(hfVeiculo.Value);
        reg.Mec_id = new Mecanico();
        reg.Mec_id.Mec_id = Convert.ToInt32(Session["mec_id"].ToString());
        reg.Reg_descricao = ddlDescricaoDoServico.SelectedItem.Text;
        reg.Reg_observacao = TextBox1.Text;
        int idRegistro = Convert.ToInt32(hidIdRegistro.Value);

        RegistroBD.UpdateRegistro(reg, idRegistro);
        ltlMsg.Text = "<div class='text-center text-success'>Registro Alterado com Sucesso!!</div>";
        msg = true;
    }

    private Double converteStringDouble(string texto)
    {
        
        return 0;
    }

    protected void btnLimpar_Click(object sender, EventArgs e)
    {

        ltlCliente.Text = "";
        ltlVeiculo.Text = "";
        hfCliente.Value = "";
        hfVeiculo.Value = "";
        selecao.Visible = true;
    }
}