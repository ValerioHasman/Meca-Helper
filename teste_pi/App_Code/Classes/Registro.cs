using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrição resumida de Registro
/// </summary>
public class Registro{

    private int reg_id;
    private DateTime reg_data;
    private Double reg_precototal;
    private string reg_descricao;
    private string reg_observacao;
    private string reg_pago;
    private Veiculo vei_id;
    private Mecanico mec_id;

    public int Reg_id
    {
        get
        {
            return reg_id;
        }

        set
        {
            reg_id = value;
        }
    }

    public DateTime Reg_data
    {
        get
        {
            return reg_data;
        }

        set
        {
            reg_data = value;
        }
    }

    public Double Reg_precototal
    {
        get
        {
            return reg_precototal;
        }

        set
        {
            reg_precototal = value;
        }
    }

    public string Reg_descricao
    {
        get
        {
            return reg_descricao;
        }

        set
        {
            reg_descricao = value;
        }
    }

    public string Reg_pago
    {
        get
        {
            return reg_pago;
        }

        set
        {
            reg_pago = value;
        }
    }

    public global::Veiculo Vei_id
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

    public string Reg_observacao
    {
        get
        {
            return reg_observacao;
        }

        set
        {
            reg_observacao = value;
        }
    }
}