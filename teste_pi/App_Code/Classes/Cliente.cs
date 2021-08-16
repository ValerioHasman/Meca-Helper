using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de Cliente
/// </summary>
public class Cliente{

    private int cli_id;
    private string cli_nome;
    private string cli_celular;
    private string cli_cpfcnpj;
    private string cli_endereco;
    private Mecanico mec_id;


    public int Cli_id
    {
        get
        {
            return cli_id;
        }

        set
        {
            cli_id = value;
        }
    }

    public string Cli_nome
    {
        get
        {
            return cli_nome;
        }

        set
        {
            cli_nome = value;
        }
    }

    public string Cli_celular
    {
        get
        {
            return cli_celular;
        }

        set
        {
            cli_celular = value;
        }
    }

    public string Cli_cpfcnpj
    {
        get
        {
            return cli_cpfcnpj;
        }

        set
        {
            cli_cpfcnpj = value;
        }
    }

    public string Cli_endereco
    {
        get
        {
            return cli_endereco;
        }

        set
        {
            cli_endereco = value;
        }
    }

    public global::Mecanico Mec_id
    {
        get
        {
            return mec_id;
        }

        set
        {
            mec_id = value;
        }
    }
}