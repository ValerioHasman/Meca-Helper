using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de Veiculo
/// </summary>
public class Veiculo{

    private int vei_id;
    private string vei_placa;
    private string vei_marca;
    private string vei_modelo;
    private string vei_ano;
    private Cliente cli_id;

    public int Vei_id
    {
        get
        {
            return vei_id;
        }

        set
        {
            vei_id = value;
        }
    }

    public string Vei_placa
    {
        get
        {
            return vei_placa;
        }

        set
        {
            vei_placa = value;
        }
    }

    public string Vei_marca
    {
        get
        {
            return vei_marca;
        }

        set
        {
            vei_marca = value;
        }
    }

    public string Vei_modelo
    {
        get
        {
            return vei_modelo;
        }

        set
        {
            vei_modelo = value;
        }
    }

    public string Vei_ano
    {
        get
        {
            return vei_ano;
        }

        set
        {
            vei_ano = value;
        }
    }

    public global::Cliente Cli_id
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
}