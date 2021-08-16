using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Mecanico_Graficos : System.Web.UI.Page
{

    bool dia = false;
    bool mes = false;
    bool ano = false;

    protected string[] mesTrigramado = {
        "",
        "Jan",
        "Fev",
        "Mar",
        "Abr",
        "Mai",
        "Jun",
        "Jul",
        "Ago",
        "Set",
        "Out",
        "Nov",
        "Dez"
    };

    protected string[] mesInteiro = {
        "",
        "Janeiro",
        "Fevereiro",
        "Março",
        "Abril",
        "Maio",
        "Junho",
        "Julho",
        "Agosto",
        "Setembro",
        "Outubro",
        "Novembro",
        "Dezebro"
    };
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            atualizarPagina();
        }

    }

    void atualizarPagina()
    {
        Mecanico mec = new Mecanico();
        mec.Mec_id = Convert.ToInt32(Session["mec_id"].ToString());
        DataSet dsInformacoesMes  = RegistroBD.SelectRendaMes(Convert.ToInt32(DateTime.Now.Month), Convert.ToInt32(DateTime.Now.Year), mec);

        lblRendaMes.Text = dsInformacoesMes.Tables[0].Rows[0]["Valor_total_Mes"].ToString();
        lblSevicosNoMes.Text = dsInformacoesMes.Tables[0].Rows[0]["Serviços_no_Mes"].ToString();
        lblServicosNaoPagosNoMes.Text = dsInformacoesMes.Tables[0].Rows[0]["Serviços_do_Mes_NPago"].ToString();

       
       if(dia == true)
        {
            carregarGraficoDia();
        }
        else if(mes == true)
        {
            carregarGraficoMes();
        }
        else if (ano == true)
        {
            carregarGraficoAno();
        }

    }
   
    void carregarGraficoDia()
    {

        ltl.Text = "<br /><label class='w-100 h4 text-center text-secondary mt-2'> Nenhum registro encontrado </label>";

        Mecanico mec = new Mecanico();
        mec.Mec_id = Convert.ToInt32(Session["mec_id"].ToString());
        DataSet ds = RegistroBD.SelectGraficoDia(Convert.ToInt32(DateTime.Now.Month), Convert.ToInt32(DateTime.Now.Year), mec);

        if (ds.Tables[0].Rows.Count == 0)
            return;

        string label = "";
        
        for (int i = 0; i < ds.Tables[0].Rows.Count; ++i)
        {
            
            label += "'" + Convert.ToInt32(ds.Tables[0].Rows[i]["dia"]) + "',";
        }
       
        string data = "";

        for (int i = 0; i < ds.Tables[0].Rows.Count; ++i)
        {
            data += "'" + Convert.ToInt32(ds.Tables[0].Rows[i]["total_Renda_Mes"]) + "',";
        }

        string mesAtual = mesInteiro[Convert.ToInt32(ds.Tables[0].Rows[0]["mes"])];

        string chart;
        chart = "<canvas id='myChart' width='200' height='70'></canvas>";   
        chart += "<script defer>";
        chart += "var ctx = document.getElementById('myChart').getContext('2d');";
        chart += "var myChart = new Chart(ctx, { type: 'line',";
        chart += "data: {";
        chart += "labels: [" + label + "],";
        chart += "datasets: [{";
        chart += "label: '# Renda por dia de " + mesAtual + "',";
        chart += "data: [" + data + "],";
        chart += " borderColor: 'rgba(0, 13, 61, 1.0)', borderWidth: 2}]},";
        chart += "options: {scales: {y: {beginAtZero: true}}}});";
        chart += "</script>";

        ltl.Text = chart;       

    }   

    void carregarGraficoMes()
    {

        ltl.Text = "<br /><label class='w-100 h4 text-center text-secondary mt-2'> Nenhum registro encontrado </label>";

        Mecanico mec = new Mecanico();
        mec.Mec_id = Convert.ToInt32(Session["mec_id"].ToString());
        DataSet ds = RegistroBD.SelectGraficoMes(Convert.ToInt32(DateTime.Now.Year), mec);

        if (ds.Tables[0].Rows.Count == 0)
            return;

        string label = "";

        for (int i = 0; i < ds.Tables[0].Rows.Count; ++i)
        {
            label += "'" + mesTrigramado[Convert.ToInt32(ds.Tables[0].Rows[i]["mes"])] + "',";
        }

        string data = "";

        for (int i = 0; i < ds.Tables[0].Rows.Count; ++i)
        {
            data += "'" + Convert.ToInt32(ds.Tables[0].Rows[i]["total_Renda_Mes"]) + "',";
        }

        string mesAnoAtual = Convert.ToInt32(ds.Tables[0].Rows[0]["ano"]).ToString();

        string chart;
        chart = "<canvas id='myChart' width='200' height='70'></canvas>";
        chart += "<script defer>";
        chart += "var ctx = document.getElementById('myChart').getContext('2d');";
        chart += "var myChart = new Chart(ctx, { type: 'line',";
        chart += "data: {";
        chart += "labels: [" + label + "],";
        chart += "datasets: [{";
        chart += "label: '# Renda por dia de " + mesAnoAtual + "',";
        chart += "data: [" + data + "],";
        chart += " borderColor: 'rgba(0, 13, 61, 1.0)', borderWidth: 2}]},";
        chart += "options: {scales: {y: {beginAtZero: true}}}});";
        chart += "</script>";

        ltl.Text = chart;
    }

    void carregarGraficoAno()
    {

        ltl.Text = "<br /><label class='w-100 h4 text-center text-secondary mt-2'> Nenhum registro encontrado </label>";

        Mecanico mec = new Mecanico();
        mec.Mec_id = Convert.ToInt32(Session["mec_id"].ToString());
        DataSet ds = RegistroBD.SelectGraficoAno(mec);
        
        if (ds.Tables[0].Rows.Count == 0)
            return;

        string label = "";

        for (int i = 0; i < ds.Tables[0].Rows.Count; ++i)
        {

            label += "'" + Convert.ToInt32(ds.Tables[0].Rows[i]["ano"]) + "',";
        }

        string data = "";

        for (int i = 0; i < ds.Tables[0].Rows.Count; ++i)
        {
            data += "'" + Convert.ToInt32(ds.Tables[0].Rows[i]["total_Renda_Mes"]) + "',";
        }


        string chart;
        chart = "<canvas id='myChart' width='200' height='70'></canvas>";
        chart += "<script defer>";
        chart += "var ctx = document.getElementById('myChart').getContext('2d');";
        chart += "var myChart = new Chart(ctx, { type: 'line',";
        chart += "data: {";
        chart += "labels: [" + label + "],";
        chart += "datasets: [{";
        chart += "label: '# Renda nos Ultimos Anos',";
        chart += "data: [" + data + "],";
        chart += " borderColor: 'rgba(0, 13, 61, 1.0)', borderWidth: 2}]},";
        chart += "options: {scales: {y: {beginAtZero: true}}}});";
        chart += "</script>";

        ltl.Text = chart;
    }

    protected void ddlPeriodos_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddlPeriodos.SelectedValue == "dia")
        {
            dia = true;
            mes = false;
            ano = false;
            atualizarPagina();

        }
        else if (ddlPeriodos.SelectedValue == "mes")
        {
            dia = false;
            mes = true;
            ano = false;
            atualizarPagina();
        }
       else 
        {
            dia = false;
            mes = false;
            ano = true;
            atualizarPagina();
        }
    }
}