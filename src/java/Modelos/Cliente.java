/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;

/**
 *
 * @author entra21
 */
public class Cliente {
    private String cpf;
    private String nome;
    private String numerocartao;
    private String email;
    private int fone;
    
    public boolean salvar(){
        String sql = "insert into cliente(cpf, nome, numerocartao, email, fone)";
               sql +="values(?,?,?,?,?)";
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cpf);
            stm.setString(2, this.nome);
            stm.setString(3, this.numerocartao);
            stm.setString(4, this.email);
            stm.setInt(5, this.fone);
            stm.execute();
            
        } catch (SQLException ex) {
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }
        
        return true;
    }
    
    public boolean alterar(){
        Connection con = Conexao.conectar();
        String sql = "update cliente set ";
               sql +="nome = ?,";
               sql +="numerocartao = ?,";
               sql +="email = ?,";
               sql +="fone = ? ";
               sql +=" Where cpf = ?";
               
        
            PreparedStatement stm;
        try {
            stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.setString(2, this.numerocartao);
            stm.setString(3, this.email);
            stm.setInt(4, this.fone);
            stm.setString(5, this.cpf);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: "+ex.getMessage());
        }
           
        return true;
    }
     public boolean excluir(){
        Connection con = Conexao.conectar();
        String sql = "delete from cliente";
               sql +=" Where cpf = ?";
      
        
         
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cpf);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }
           
        return true;
    }
     
     public Cliente consultar (String cpf){
        Connection con = Conexao.conectar();
        String sql = "select * from cliente where cpf = ?";
        Cliente cliente = null;
        
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, cpf);
           ResultSet rs = stm.executeQuery();
           if(rs.next()){
             cliente = new Cliente();
             cliente.setCpf(rs.getString("cpf"));
             cliente.setNome(rs.getString("nome"));
             cliente.setNumerocartao(rs.getString("numerocartao"));
             cliente.setEmail(rs.getString("email"));
             cliente.setFone(rs.getInt("fone"));
             }
        } catch (SQLException ex) {
            System.out.println("Erro: "+ex.getMessage());
        }
        
        return cliente;
    }
      public List<Cliente> consultar(){     
      List<Cliente> lista = new ArrayList<>();      
      Connection con = Conexao.conectar();
      String sql = "select cpf, nome, numerocartao, email, fone from cliente ";
       
       try {
           PreparedStatement stm = con.prepareStatement(sql);
           ResultSet rs = stm.executeQuery();
           
           while(rs.next()){
             Cliente cli = new Cliente();
             cli.setCpf(rs.getString("cpf"));
             cli.setNome(rs.getString("nome"));
             cli.setNumerocartao(rs.getString("numerocartao"));
             cli.setEmail(rs.getString("email"));
             cli.setFone(Integer.parseInt(rs.getString("fone")));
                         
             lista.add(cli);
           }
           
       } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage());
       }      
       return lista;
   }
    
    @Override
    public String toString() {
        return "Cliente{" + "cpf=" + cpf + ", nome=" + nome + ", numerocartao=" + numerocartao + ", email=" + email + ", fone=" + fone + '}';
    }
      

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getNumerocartao() {
        return numerocartao;
    }

    public void setNumerocartao(String numerocartao) {
        this.numerocartao = numerocartao;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getFone() {
        return fone;
    }

    public void setFone(int fone) {
        this.fone = fone;
    }
     
     


    
    
    
}
