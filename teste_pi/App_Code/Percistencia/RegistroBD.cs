using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Descrição resumida de RegistroBD
/// </summary>
public class RegistroBD{

    public static DataSet SelectRegistros(string id)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "select reg_id, vei_id, r.mec_id, reg_data, reg_descricao, reg_pago,  vei_placa, cli_nome  from registro r inner join veiculo v using (vei_id) inner join cliente c using (cli_id) where r.mec_id = "+ id + " and reg_excluido = 'N';";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);

        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }
    public static DataSet SelectRegistrosExcluidos(string id)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "select reg_id, vei_id, r.mec_id, reg_data, reg_descricao, reg_pago,  vei_placa, cli_nome  from registro r inner join veiculo v using (vei_id) inner join cliente c using (cli_id) where r.mec_id = " + id + " and reg_excluido = 'S';";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);

        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

    public static DataSet SelectRendaMes(int data, int ano, Mecanico mec)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "select sum(CASE reg_pago WHEN 'S' THEN reg_precototal ELSE NULL END) as Valor_total_Mes, count(*) as Serviços_no_Mes, count(CASE reg_pago WHEN 'N' THEN 1 ELSE NULL END ) as Serviços_do_Mes_NPago from registro where mec_id = ?mec_id and MONTH(reg_data) = ?data and YEAR(reg_data) = ?ano and reg_excluido = 'N'";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);
        objCommand.Parameters.Add(mapped.Parameter("?mec_id", mec.Mec_id));
        objCommand.Parameters.Add(mapped.Parameter("?data", data));
        objCommand.Parameters.Add(mapped.Parameter("?ano", ano));

        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

    public static DataSet SelectGraficoDia(int mes, int ano, Mecanico mec)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "SELECT sum(reg_precototal) as 'total_Renda_Mes', day(reg_data) as 'dia', month(reg_data) as 'mes', year(reg_data) as 'ano' FROM registro WHERE mec_id = ?mec_id and reg_pago = 'S' AND YEAR(reg_data) = ?ano AND month(reg_data) = ?mes and reg_excluido = 'N' GROUP BY dia ORDER BY mes;";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);
        objCommand.Parameters.Add(mapped.Parameter("?mec_id", mec.Mec_id));
        objCommand.Parameters.Add(mapped.Parameter("?mes", mes));
        objCommand.Parameters.Add(mapped.Parameter("?ano", ano));

        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

    public static DataSet SelectGraficoMes(int ano, Mecanico mec)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "SELECT sum(reg_precototal) as 'total_Renda_Mes', day(reg_data) as 'dia', month(reg_data) as 'mes', year(reg_data) as 'ano' FROM registro WHERE mec_id = ?mec_id and reg_pago = 'S' AND YEAR(reg_data) = ?ano and reg_excluido = 'N'  GROUP BY mes ORDER BY mes;";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);
        objCommand.Parameters.Add(mapped.Parameter("?mec_id", mec.Mec_id));
        objCommand.Parameters.Add(mapped.Parameter("?ano", ano));

        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

    public static DataSet SelectGraficoAno(Mecanico mec)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "SELECT sum(reg_precototal) as 'total_Renda_Mes', day(reg_data) as 'dia', month(reg_data) as 'mes', year(reg_data) as 'ano' FROM registro WHERE mec_id = ?mec_id and reg_pago = 'S' and reg_excluido = 'N' GROUP BY ano ORDER BY ano;";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);
        objCommand.Parameters.Add(mapped.Parameter("?mec_id", mec.Mec_id));

        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

    public static void UpdateExcluirRegistro(Registro reg)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;
        string query = "update registro set reg_excluido = 'S' where reg_id = ?reg_id;";
        objConexao = mapped.Connection();
        objCommand = mapped.Command(query, objConexao);
        objCommand.Parameters.Add(mapped.Parameter("?reg_id", reg.Reg_id));

        objDataAdapter = mapped.Adapter(objCommand);
        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

    }
    public static void UpdateRestaurarRegistro(Registro reg)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;
        string query = "update registro set reg_excluido = 'N' where reg_id = ?reg_id;";
        objConexao = mapped.Connection();
        objCommand = mapped.Command(query, objConexao);
        objCommand.Parameters.Add(mapped.Parameter("?reg_id", reg.Reg_id));

        objDataAdapter = mapped.Adapter(objCommand);
        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

    }

    public static void CadastroRegistro(Registro reg)
    {
       
        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;
        string query = "INSERT INTO `registro` (`reg_data`, `reg_precototal`, `reg_descricao`, `reg_pago`, `vei_id`, `mec_id`, `reg_observacoes`) VALUES (?reg_data, ?reg_precototal, ?reg_descricao, ?reg_pago, ?vei_id, ?mec_id, ?reg_observacoes);";
        objConexao = mapped.Connection();
        objCommand = mapped.Command(query, objConexao);
        objCommand.Parameters.Add(mapped.Parameter("?reg_data", reg.Reg_data));
        objCommand.Parameters.Add(mapped.Parameter("?reg_precototal", reg.Reg_precototal));
        objCommand.Parameters.Add(mapped.Parameter("?reg_descricao", reg.Reg_descricao));
        objCommand.Parameters.Add(mapped.Parameter("?reg_pago", reg.Reg_pago));
        objCommand.Parameters.Add(mapped.Parameter("?vei_id", reg.Vei_id.Vei_id));
        objCommand.Parameters.Add(mapped.Parameter("?mec_id", reg.Mec_id.Mec_id));
        objCommand.Parameters.Add(mapped.Parameter("?reg_observacoes", reg.Reg_observacao));

        
        objDataAdapter = mapped.Adapter(objCommand);
        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

      

    }

    public static DataSet SelectUltimoRegistro(string id)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "SELECT reg_id FROM registro where mec_id ="+ id +" ORDER BY reg_id DESC LIMIT 1;";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);

        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

    public static DataSet SelectRegistrosPesquisa(string id, string pesquisa)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;


        objConexao = mapped.Connection();
        string query = "select reg_id, vei_id, r.mec_id, reg_data, reg_descricao, reg_pago,  vei_placa, cli_nome  from registro r inner join veiculo v using (vei_id) inner join cliente c using (cli_id) where r.mec_id = " + id + " and reg_excluido = 'N' and  (reg_data like '%" + pesquisa + "%' or reg_descricao like '%" + pesquisa + "%' or reg_precototal like '%" + pesquisa + "%' or cli_nome like '%" + pesquisa + "%' or vei_placa like '%" + pesquisa + "%') order by reg_data;";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);

        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

    public static DataSet SelectLixeiraPesquisa(string id, string pesquisa)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;


        objConexao = mapped.Connection();
        string query = "select reg_id, vei_id, r.mec_id, reg_data, reg_descricao, reg_pago,  vei_placa, cli_nome  from registro r inner join veiculo v using (vei_id) inner join cliente c using (cli_id) where r.mec_id = " + id + " and reg_excluido = 'S' and  (reg_data like '%" + pesquisa + "%' or reg_descricao like '%" + pesquisa + "%' or reg_precototal like '%" + pesquisa + "%' or cli_nome like '%" + pesquisa + "%' or vei_placa like '%" + pesquisa + "%') order by reg_data;";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);

        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

    public static DataSet SelectFiltrosaz(string id)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "select reg_id, vei_id, r.mec_id, reg_data, reg_descricao, reg_pago,  vei_placa, cli_nome  from registro r inner join veiculo v using (vei_id) inner join cliente c using (cli_id) where r.mec_id = " + id + " and reg_excluido = 'N' order by cli_nome asc;";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);

        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

    public static DataSet SelectFiltrosza(string id)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "select reg_id, vei_id, r.mec_id, reg_data, reg_descricao, reg_pago,  vei_placa, cli_nome  from registro r inner join veiculo v using (vei_id) inner join cliente c using (cli_id) where r.mec_id = " + id + " and reg_excluido = 'N' order by cli_nome desc;";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);

        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

    public static DataSet SelectFiltroDataRec(string id)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "select reg_id, vei_id, r.mec_id, reg_data, reg_descricao, reg_pago,  vei_placa, cli_nome  from registro r inner join veiculo v using (vei_id) inner join cliente c using (cli_id) where r.mec_id = " + id + " and reg_excluido = 'N' order by reg_data asc;";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);

        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

    public static DataSet SelectFiltroDataAnt(string id)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "select reg_id, vei_id, r.mec_id, reg_data, reg_descricao, reg_pago,  vei_placa, cli_nome  from registro r inner join veiculo v using (vei_id) inner join cliente c using (cli_id) where r.mec_id = " + id + " and reg_excluido = 'N' order by reg_data desc;";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);

        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

    public static DataSet SelectFiltroPago(string id)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "select reg_id, vei_id, r.mec_id, reg_data, reg_descricao, reg_pago,  vei_placa, cli_nome  from registro r inner join veiculo v using (vei_id) inner join cliente c using (cli_id) where r.mec_id = " + id + " and reg_excluido = 'N' and reg_pago = 'S';";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);

        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

    public static DataSet SelectFiltronaoPago(string id)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "select reg_id, vei_id, r.mec_id, reg_data, reg_descricao, reg_pago,  vei_placa, cli_nome  from registro r inner join veiculo v using (vei_id) inner join cliente c using (cli_id) where r.mec_id = " + id + " and reg_excluido = 'N' and reg_pago = 'N';";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);

        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

    public static void UpdateRegistro(Registro reg, int IdRegistro)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;
        string query = "update registro set reg_data = ?reg_data, reg_precototal = ?reg_precototal, reg_descricao = ?reg_descricao, reg_pago = ?reg_pago, vei_id = ?vei_id, reg_observacoes = ?reg_observacoes where reg_id = ?reg_id;";
        objConexao = mapped.Connection();
        objCommand = mapped.Command(query, objConexao);
        objCommand.Parameters.Add(mapped.Parameter("?reg_id", IdRegistro));
        objCommand.Parameters.Add(mapped.Parameter("?reg_data", reg.Reg_data));
        objCommand.Parameters.Add(mapped.Parameter("?reg_precototal", reg.Reg_precototal));
        objCommand.Parameters.Add(mapped.Parameter("?reg_descricao", reg.Reg_descricao));
        objCommand.Parameters.Add(mapped.Parameter("?reg_pago", reg.Reg_pago));
        objCommand.Parameters.Add(mapped.Parameter("?vei_id", reg.Vei_id.Vei_id));
        objCommand.Parameters.Add(mapped.Parameter("?mec_id", reg.Mec_id.Mec_id));
        objCommand.Parameters.Add(mapped.Parameter("?reg_observacoes", reg.Reg_observacao));

        objDataAdapter = mapped.Adapter(objCommand);
        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

    }

    public static DataSet SelecRegistroEspecifico(string id, string idRegistro)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "select reg_id, vei_id, r.mec_id, cli_id,reg_observacoes, reg_precototal, reg_data, reg_descricao, reg_pago,  vei_placa, cli_nome  from registro r inner join veiculo v using (vei_id) inner join cliente c using (cli_id) where r.mec_id = ?mec_id and reg_id = ?reg_id;";

        objCommand = mapped.Command(query, objConexao);
        objCommand.Parameters.Add(mapped.Parameter("?mec_id", id));
        objCommand.Parameters.Add(mapped.Parameter("?reg_id", idRegistro));
        objDataAdapter = mapped.Adapter(objCommand);

        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }


}



