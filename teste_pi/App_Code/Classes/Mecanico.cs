using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Mecanico
/// </summary>
public class Mecanico{
    private int mec_id;
    private string mec_nome;
    private string mec_email;
    private string mec_senha;
    private string mec_cpfcnpj;

    public int Mec_id
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
    public string Mec_nome
    {
        get
        {
            return mec_nome;
        }

        set
        {
            mec_nome = value;
        }
    }

    public string Mec_email
    {
        get
        {
            return mec_email;
        }

        set
        {
            mec_email = value;
        }
    }

    public string Mec_senha
    {
        get
        {
            return mec_senha;
        }

        set
        {
            mec_senha = value;
        }
    }

    public string Mec_cpfcnpj
    {
        get
        {
            return mec_cpfcnpj;
        }

        set
        {
            mec_cpfcnpj = value;
        }
    }

    
}