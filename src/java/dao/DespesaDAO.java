package dao;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table (name="tb_despesa")

public class DespesaDAO implements Serializable {
	Long id_despesa;
    private String descricao_despesa;
    private String tipo_despesa;
    private Float valor_despesa;
    private String data_despesa;
    private String id_usuario;

	
    @Id
    public Long getId_despesa() {
        return id_despesa;
    }

    public void setId_despesa(Long id_despesa) {
        this.id_despesa = id_despesa;
    }

    public String getData_despesa() {
        return data_despesa;
    }

    public void setData_despesa(String data_despesa) {
        this.data_despesa = data_despesa;
    }

    public String getDescricao_despesa() {
        return descricao_despesa;
    }

    public void setDescricao_despesa(String descricao_despesa) {
        this.descricao_despesa = descricao_despesa;
    }


    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getTipo_despesa() {
        return tipo_despesa;
    }

    public void setTipo_despesa(String tipo_despesa) {
        this.tipo_despesa = tipo_despesa;
    }

    public Float getValor_despesa() {
        return valor_despesa;
    }

    public void setValor_despesa(Float valor_despesa) {
        this.valor_despesa = valor_despesa;
    }
    


}