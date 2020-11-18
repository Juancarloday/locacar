<%-- 
    Document   : recebedadoscarro
    Created on : 30 de out de 2020, 09:10:54
    Author     : entra21
--%>
<%@page import="Modelos.Carro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Locacar</h1>
        <%
        //recebe os valores da tela HTML
        String placa = request.getParameter("placa");
        String marca = request.getParameter("marca");
        String modelo = request.getParameter("modelo");
        String km = request.getParameter("km");
        String arcondicionado = request.getParameter("arcondicionado");
        String direcaohidraulica =request.getParameter("direcaohidraulica");
        String vidroeletrico = request.getParameter("vidroeletrico");
        String cambioautomatico =request.getParameter("cambioautomatico");
     
        
        Carro carro = new Carro();
        carro.setPlaca(placa);
        carro.setMarca(marca);
        carro.setModelo(modelo);
        
        if(!km.equals(""))
        carro.setKm(Integer.parseInt(km));
        
        if(arcondicionado != null)
        carro.setArCondicionado(true);
        else carro.setArCondicionado(false);
        
        if(direcaohidraulica != null)
        carro.setDirecaoHidraulica(true);
        else carro.setDirecaoHidraulica(false);
        
        //if(direcaohidraulica.contains("on"))
        //carro.setDirecaoHidraulica(true);
        
        if(vidroeletrico != null)
        carro.setVidroEletrico(true);
        else carro.setVidroEletrico(false);
        
        if(cambioautomatico != null)
        carro.setCambioAutomatico(true);
        else carro.setCambioAutomatico(false);
        
        
        if(carro.salvar()){
            out.write("Carro salvo com sucesso");
        }else
        {
            out.write("Erro ao salvar carro");
        }
        
        


        %>
    </body>
</html>

  