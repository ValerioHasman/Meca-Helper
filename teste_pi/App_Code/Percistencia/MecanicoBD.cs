using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for MecanicoBD
/// </summary>
public class MecanicoBD{

    public static DataSet VerificaLogin(Mecanico mec) {

        DataSet ds = new DataSet();
        IDbConnection objConexao;
        IDbCommand command;
        IDbDataAdapter adap;
        string sql = "select * from mecanico where mec_email = ?mec_email and mec_senha = ?mec_senha";
        objConexao = mapped.Connection();
        command = mapped.Command(sql, objConexao);
        command.Parameters.Add(mapped.Parameter("?mec_email", mec.Mec_email));
        command.Parameters.Add(mapped.Parameter("?mec_senha", mec.Mec_senha));
        adap = mapped.Adapter(command);
        adap.Fill(ds);
        objConexao.Close();
        objConexao.Dispose();
        command.Dispose();
        

            return ds;
    }

    public static int Cadastro(Mecanico mec)
    {

        int retorno = 0;

       try{

            DataSet ds = new DataSet();
            IDbConnection objConexao;
            IDbCommand objCommand;
            IDataAdapter objDataAdapter;
            string query = "insert into mecanico(mec_nome, mec_email, mec_senha, mec_cpfcnpj) values(?mec_nome, ?mec_email, ?mec_senha, ?mec_cpfcnpj)";
            objConexao = mapped.Connection();
            objCommand = mapped.Command(query, objConexao);
            objCommand.Parameters.Add(mapped.Parameter("?mec_nome", mec.Mec_nome));
            objCommand.Parameters.Add(mapped.Parameter("?mec_email", mec.Mec_email));
            objCommand.Parameters.Add(mapped.Parameter("?mec_senha", mec.Mec_senha));
            objCommand.Parameters.Add(mapped.Parameter("?mec_cpfcnpj", mec.Mec_cpfcnpj));

            objDataAdapter = mapped.Adapter(objCommand);
            objDataAdapter.Fill(ds);
            objConexao.Close();
            objConexao.Dispose();
            objCommand.Dispose();

       }
        catch (Exception ex){
           retorno = -2;
        }
        return retorno;

    }

}