using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Descrição resumida de ClienteBD
/// </summary>
public class ClienteBD{

    public static DataSet SelectClientes(string id){

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "select * from cliente where mec_id = " + id + " order by cli_nome   ;"; 

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);

        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

    public static DataSet SelectClientesPesquisa(string id, string pesquisa)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        
        objConexao = mapped.Connection();
        string query = "select * from cliente where mec_id = " + id + " and  (cli_nome like '%" + pesquisa + "%' or cli_celular like '%" + pesquisa + "%' or cli_cpfcnpj like '%" + pesquisa + "%' or cli_endereco like '%" + pesquisa + "%' ) order by cli_nome;";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);

        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

    public static int CadastroCliente(Cliente cli){   

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;
        string query = "insert into cliente(mec_id, cli_nome, cli_celular, cli_cpfcnpj, cli_endereco) values(?mec_id, ?cli_nome, ?cli_celular, ?cli_cpfcnpj, ?cli_endereco); " +
            "SELECT cli_id FROM cliente ORDER BY cli_id DESC LIMIT 1;";
        objConexao = mapped.Connection();
        objCommand = mapped.Command(query, objConexao);
        objCommand.Parameters.Add(mapped.Parameter("?mec_id", cli.Mec_id.Mec_id));
        objCommand.Parameters.Add(mapped.Parameter("?cli_nome", cli.Cli_nome));
        objCommand.Parameters.Add(mapped.Parameter("?cli_celular", cli.Cli_celular));
        objCommand.Parameters.Add(mapped.Parameter("?cli_cpfcnpj", cli.Cli_cpfcnpj));
        objCommand.Parameters.Add(mapped.Parameter("?cli_endereco", cli.Cli_endereco));
       
        objDataAdapter = mapped.Adapter(objCommand);
        objDataAdapter.Fill(ds);

       
        int id = int.Parse(ds.Tables[0].Rows[0]["cli_id"].ToString());
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();           

        return id;

    }

    public static void UpdateCliente(Cliente cli)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;
        string query = "update cliente set cli_nome = ?cli_nome, cli_celular = ?cli_celular, cli_cpfcnpj = ?cli_cpfcnpj, cli_endereco = ?cli_endereco where cli_id = ?cli_id;";
        objConexao = mapped.Connection();
        objCommand = mapped.Command(query, objConexao);
        objCommand.Parameters.Add(mapped.Parameter("?cli_id", cli.Cli_id));
        objCommand.Parameters.Add(mapped.Parameter("?cli_nome", cli.Cli_nome));
        objCommand.Parameters.Add(mapped.Parameter("?cli_celular", cli.Cli_celular));
        objCommand.Parameters.Add(mapped.Parameter("?cli_cpfcnpj", cli.Cli_cpfcnpj));
        objCommand.Parameters.Add(mapped.Parameter("?cli_endereco", cli.Cli_endereco));

        objDataAdapter = mapped.Adapter(objCommand);
        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

    }

    public static DataSet ddlSelectCliente(Mecanico mec)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;
        string query = "select cli_nome, cli_id from cliente where mec_id = ?mec_id;";
        objConexao = mapped.Connection();
        objCommand = mapped.Command(query, objConexao);
        objCommand.Parameters.Add(mapped.Parameter("?mec_id", mec.Mec_id));

        objDataAdapter = mapped.Adapter(objCommand);
        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;

    }

    public static DataSet SelectFiltroasc(string id)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "select * from cliente where mec_id = " + id + " order by cli_nome asc;";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);

        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }

    public static DataSet SelectFiltrodesc(string id)
    {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand objCommand;
        IDataAdapter objDataAdapter;

        objConexao = mapped.Connection();
        string query = "select * from cliente where mec_id = " + id + " order by cli_nome desc;";

        objCommand = mapped.Command(query, objConexao);
        objDataAdapter = mapped.Adapter(objCommand);

        objDataAdapter.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        objCommand.Dispose();

        return ds;
    }



    //public static void ddlSelectVeiculo(Mecanico mec, Cliente cli)
    //{

    //}
}