/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.util.Calendar;
import utils.Conexao;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.Conversor;




/**
 *
 * @author entra21
 */
public class Locacao {
    
    private int id;
    private Carro carro;
    private Cliente cliente;
    private Date data;
    private Date dataEntrega;
    private Date dataDevolucao;
    private String cpfcliente;
    private int idcarro;
    
    
   public boolean salvar() {
        Connection con = Conexao.conectar();
        String sql = "insert into locacao ";
               sql += "(idcarro, cpfcliente, data, dataentrega) ";
               sql += "values(?,?,?,?)";        
        
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.carro.getId());
            stm.setString(2, this.cliente.getCpf());            
            stm.setDate(3, this.data);
            stm.setDate(4, this.dataEntrega);
            //stm.setDate(5, this.dataDevolucao);
            stm.execute();
            
        } catch (SQLException ex) {
             System.out.println("Erro: " + ex.getMessage());
             return false;
        }
        return true;
    }
   
 public ResultSet consultarInner(){
     Connection con = Conexao.conectar();
     String sql = "select l.id, l.idcarro, c.placa, c.modelo,"+
                  "       l.cpfcliente, cli.nome, l.data, "+
                  "       l.dataretirada, l.datadevolucao " +
                  "from locacao l, carro c, cliente cli " +
                  "where l.idcarro = c.id " +
                  "and l.cpfcliente = cli.cpf";
             
     ResultSet rs = null;
    
         try {
             PreparedStatement stm = con.prepareStatement(sql);
             rs = stm.executeQuery();
         } catch (SQLException ex) {
             
         }
         return rs;
 }
 public Locacao consultar (int id){
        Connection con = Conexao.conectar();
        String sql = "select * from locacao where id = ?";
        Locacao locacao = null;
        
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                locacao = new Locacao();
                locacao.setData(rs.getDate("data"));
                locacao.setDataEntrega(rs.getDate("dataEntrega"));                
                //setar composição de cliente
                Cliente cli = new Cliente();
                cli = cli.consultar(rs.getString("cpf"));                
                locacao.setCliente(cli);
                
                //
                
             }
        } catch (SQLException ex) {
            System.out.println("Erro: "+ex.getMessage());
        }
        
        return locacao;
    }
  public List<Locacao> consultar(String cliente){
     List<Locacao> lista = new ArrayList<>();
     Connection con = Conexao.conectar();     
     String sql = "select id, idcarro, cpfcliente, data, dataentrega";
            sql += " from locacao where cpfcliente = ?";
      try {
          PreparedStatement stm = con.prepareStatement(sql);
          stm.setString(1, cliente);
          ResultSet rs = stm.executeQuery();
         
          while(rs.next()){
             Locacao locacao = new Locacao();
             locacao.setId(rs.getInt("id"));
             locacao.setData(rs.getDate("data"));
             locacao.setDataEntrega(rs.getDate("dataentrega"));
             Carro car = new Carro();
             car = car.consultar(rs.getInt("idcarro"));
             locacao.setCarro(car);
             
             Cliente cli = new Cliente();
             cli = cli.consultar(rs.getString("cpfcliente"));
             locacao.setCliente(cli);
             
           // locacao.setData(Conversor.conv(rs.getDate("data")));
           //  locacao.setDataEntrega(rs.getDate("dataentrada"));
             
             lista.add(locacao);
          }
      } catch (SQLException ex) {
          System.out.println("Erro: " + ex.getMessage());
      }     
     return lista;
  }

    @Override
    public String toString() {
        return "Locacao{" + "id=" + id + ", carro=" + carro + ", cliente=" + cliente + ", data=" + data + ", dataEntrega=" + dataEntrega + ", dataDevolucao=" + dataDevolucao + '}';
    }
            
           
     public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }  

    

    public Carro getCarro() {
        return carro;
    }

    public void setCarro(Carro carro) {
        this.carro = carro;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public Date getDataEntrega() {
        return dataEntrega;
    }

    public void setDataEntrega(Date dataEntrega) {
        this.dataEntrega = dataEntrega;
    }

    public Date getDataDevolucao() {
        return dataDevolucao;
    }

    public void setDataDevolucao(Date dataDevolucao) {
        this.dataDevolucao = dataDevolucao;
    }

    public String getCpfcliente() {
        return cpfcliente;
    }

    public void setCpfcliente(String cpfcliente) {
        this.cpfcliente = cpfcliente;
    }

    public int getIdcarro() {
        return idcarro;
    }

    public void setIdcarro(int idcarro) {
        this.idcarro = idcarro;
    }
    
}


   
