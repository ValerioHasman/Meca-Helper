using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Descrição resumida de VeiculoBD
/// </summary>
public class VeiculoBD{

    public static DataSet SelectVeiculos(Cliente cliente){

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "select * from veiculo where cli_id = ?Cli_id ";

        objCommand = mapped.Command(query, objConexao);
        objCommand.Parameters.Add(mapped.Parameter("?Cli_id", cliente.Cli_id));
        objDataAdapter = mapped.Adapter(objCommand);


        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

    public static void CadastroVeiculo(Veiculo vei){

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;
        string query = "insert into veiculo(vei_placa, vei_marca, vei_modelo, vei_ano, cli_id) values(?vei_placa, ?vei_marca, ?vei_modelo, ?vei_ano, ?cli_id)";
        objConexao = mapped.Connection();
        objCommand = mapped.Command(query, objConexao);
        objCommand.Parameters.Add(mapped.Parameter("?vei_placa", vei.Vei_placa));
        objCommand.Parameters.Add(mapped.Parameter("?vei_marca", vei.Vei_marca));
        objCommand.Parameters.Add(mapped.Parameter("?vei_modelo", vei.Vei_modelo));
        objCommand.Parameters.Add(mapped.Parameter("?vei_ano", vei.Vei_ano));
        objCommand.Parameters.Add(mapped.Parameter("?cli_id", vei.Cli_id.Cli_id));
      
        objDataAdapter = mapped.Adapter(objCommand);
        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose(); 

    }

    public static void UpdateVeiculo(Veiculo vei)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;
        string query = "update veiculo set vei_placa = ?vei_placa, vei_marca = ?vei_marca, vei_modelo = ?vei_modelo, vei_ano = ?vei_ano where vei_id = ?vei_id;";
        objConexao = mapped.Connection();
        objCommand = mapped.Command(query, objConexao);
        objCommand.Parameters.Add(mapped.Parameter("?vei_id", vei.Vei_id));
        objCommand.Parameters.Add(mapped.Parameter("?vei_placa", vei.Vei_placa));
        objCommand.Parameters.Add(mapped.Parameter("?vei_marca", vei.Vei_marca));
        objCommand.Parameters.Add(mapped.Parameter("?vei_modelo", vei.Vei_modelo));
        objCommand.Parameters.Add(mapped.Parameter("?vei_ano", vei.Vei_ano));

        objDataAdapter = mapped.Adapter(objCommand);
        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

    }

    public static DataSet ddlSelectVeiculo(Cliente cli)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;
        string query = "select vei_placa, vei_id from cliente c inner join veiculo v using (cli_id) where cli_id = ?cli_id;";
        objConexao = mapped.Connection();
        objCommand = mapped.Command(query, objConexao);
        objCommand.Parameters.Add(mapped.Parameter("?cli_id", cli.Cli_id));

        objDataAdapter = mapped.Adapter(objCommand);
        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;

    }

}