<%-- 
    Document   : recebeeditarcarro
    Created on : 6 de nov de 2020, 09:36:49
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
        <h1>Carro Editado!</h1>
        <hr />
            <%
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
        //else carro.setArCondicionado(false);
        
        if(direcaohidraulica != null)
        carro.setDirecaoHidraulica(true);
        //else carro.setDirecaoHidraulica(false);
        
        //if(direcaohidraulica.contains("on"))
        //carro.setDirecaoHidraulica(true);
        
        if(vidroeletrico != null)
        carro.setVidroEletrico(true);
        //else carro.setVidroEletrico(false);
        
        if(cambioautomatico != null)
        carro.setCambioAutomatico(true);
       // else carro.setCambioAutomatico(false);
        
        
        if(carro.alterar()){
            out.write("Carro alterado com sucesso");
        }else
        {
            out.write("Erro ao alterar carro");
        }
        
        // if(carro.excluir()){
         //   out.write("Carro excluido com sucesso");
        //}else
       // {
          //  out.write("Erro ao excluir carro");
        //}


        %>
    </body>
</html>
