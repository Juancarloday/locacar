/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.sql.PreparedStatement;
import java.util.List;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.Conexao;
import java.sql.ResultSet;

/**
 *
 * @author entra21
 */
public class Carro {
    private int id;   
    private String placa;
    private String marca;
    private String modelo;
    private float km;
    private boolean arCondicionado;
    private boolean direcaoHidraulica;
    private boolean vidroEletrico;
    private boolean cambioAutomatico;
    private Connection PreparedStatement;
    
    public boolean salvar(){
        String sql = "insert into carro(placa, marca, modelo, km, arCondicionado,";
               sql +="direcaoHidraulica, vidroEletrico, cambioAutomatico)";
               sql +="values(?,?,?,?,?,?,?,?)";
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.placa);
            stm.setString(2, this.marca);
            stm.setString(3, this.modelo);
            stm.setFloat(4, this.km);
            stm.setBoolean(5, this.vidroEletrico);
            stm.setBoolean(6, this.arCondicionado);
            stm.setBoolean(7, this.direcaoHidraulica);
            stm.setBoolean(8, this.cambioAutomatico);
            stm.execute();
            
        }
        catch (SQLException ex) {
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }
        return true;
    }
    public boolean alterar(){
        Connection con = Conexao.conectar();
        String sql = "update carro set ";
               sql +="marca = ?,";
               sql +="modelo = ?,";
               sql +="km = ?,";
               sql +="arCondicionado = ?,";
               sql +="direcaohidraulica = ?,";
               sql +="vidroeletrico = ?,";
               sql +="cambioautomatico = ? ";
               sql +=" Where placa = ?";
               
        
           
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.marca);
            stm.setString(2, this.modelo);
            stm.setFloat(3, this.km);
            stm.setBoolean(4, this.vidroEletrico);
            stm.setBoolean(5, this.arCondicionado);
            stm.setBoolean(6, this.direcaoHidraulica);
            stm.setBoolean(7, this.cambioAutomatico);
            stm.setString(8, this.placa);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }
           
        return true;
    }
    
    
    public boolean excluir(){
        Connection con = Conexao.conectar();
        String sql = "delete from carro";
               sql +=" Where placa = ?";
      
        
         
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.placa);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }
           
        return true;
    }
       
    public Carro consultar (String placa){
        Connection con = Conexao.conectar();
        String sql = "select * from carro where placa = ?";
        Carro carro = null;
        
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, placa);
           ResultSet rs = stm.executeQuery();
           if(rs.next()){
             carro = new Carro();
             carro.setId(rs.getInt("id"));
             carro.setPlaca(rs.getString("placa"));
             carro.setMarca(rs.getString("marca"));
             carro.setModelo(rs.getString("modelo"));
             carro.setKm(rs.getInt("km"));
             carro.setArCondicionado(rs.getBoolean("arcondicionado"));
             carro.setDirecaoHidraulica(rs.getBoolean("direcaoHidraulica"));
             carro.setVidroEletrico(rs.getBoolean("vidroEletrico"));
             carro.setCambioAutomatico(rs.getBoolean("cambioAutomatico"));
           }
        } catch (SQLException ex) {
            System.out.println("Erro: "+ex.getMessage());
        }
        
        return carro;
    }
    
    
   public Carro consultar(int idcarro){     
      Connection con = Conexao.conectar();
        String sql = "select * from carro where id = ?";
        Carro carro = null;
        
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, idcarro);
           ResultSet rs = stm.executeQuery();
           if(rs.next()){
             carro = new Carro();
             carro.setId(rs.getInt("id"));
             carro.setPlaca(rs.getString("placa"));
             carro.setMarca(rs.getString("marca"));
             carro.setModelo(rs.getString("modelo"));
             carro.setKm(rs.getInt("km"));
             carro.setArCondicionado(rs.getBoolean("arcondicionado"));
             carro.setDirecaoHidraulica(rs.getBoolean("direcaoHidraulica"));
             carro.setVidroEletrico(rs.getBoolean("vidroEletrico"));
             carro.setCambioAutomatico(rs.getBoolean("cambioAutomatico"));
           }
        } catch (SQLException ex) {
            System.out.println("Erro: "+ex.getMessage());
        }
        
        return carro;
   }
   
   public List<Carro> consultar(){     
        Connection con = Conexao.conectar();
        String sql = "select * from carro";
        List<Carro> lista = new ArrayList<>();        
        try {
           PreparedStatement stm = con.prepareStatement(sql);
           
           ResultSet rs = stm.executeQuery();
           while(rs.next()){
             Carro carro = new Carro();
             carro.setId(rs.getInt("id"));
             carro.setPlaca(rs.getString("placa"));
             carro.setMarca(rs.getString("marca"));
             carro.setModelo(rs.getString("modelo"));
             carro.setKm(rs.getInt("km"));
             carro.setArCondicionado(rs.getBoolean("arcondicionado"));
             carro.setDirecaoHidraulica(rs.getBoolean("direcaoHidraulica"));
             carro.setVidroEletrico(rs.getBoolean("vidroEletrico"));
             carro.setCambioAutomatico(rs.getBoolean("cambioAutomatico"));
             lista.add(carro);
           }
        } catch (SQLException ex) {
            System.out.println("Erro: "+ex.getMessage());
        }
        
        return lista;
   }
   
    @Override
    public String toString() {
        return "Carro{" + "placa=" + placa + ", marca=" + marca + ", modelo=" + modelo + ", km=" + km + ", arCondicionado=" + arCondicionado + ", direcaoHidraulica=" + direcaoHidraulica + ", vidroEletrico=" + vidroEletrico + ", cambioAutomatico=" + cambioAutomatico + ", PreparedStatement=" + PreparedStatement + '}';
    }
  

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public float getKm() {
        return km;
    }

    public void setKm(float km) {
        this.km = km;
    }

    public boolean isArCondicionado() {
        return arCondicionado;
    }

    public void setArCondicionado(boolean arCondicionado) {
        this.arCondicionado = arCondicionado;
    }

    public boolean isDirecaoHidraulica() {
        return direcaoHidraulica;
    }

    public void setDirecaoHidraulica(boolean direcaoHidraulica) {
        this.direcaoHidraulica = direcaoHidraulica;
    }

    public boolean isVidroEletrico() {
        return vidroEletrico;
    }

    public void setVidroEletrico(boolean vidroEletrico) {
        this.vidroEletrico = vidroEletrico;
    }

    public boolean isCambioAutomatico() {
        return cambioAutomatico;
    }

    public void setCambioAutomatico(boolean cambioAutomatico) {
        this.cambioAutomatico = cambioAutomatico;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
    
    
    
}
