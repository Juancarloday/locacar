<%-- 
    Document   : editarcarro
    Created on : 6 de nov de 2020, 08:36:37
    Author     : entra21
--%>

<%@page import="Modelos.Carro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EDITAR CARROS</title>
    </head>
    <body>
        <h1>Edição de Carro!</h1>
        <hr />
        <%
        String placa = request.getParameter("placa");
        Carro c = new Carro();
        if(placa != null){
        c = c.consultar(placa);
        }
        %>
        <form action="recebeeditarcarro.jsp" method = "POST">
            
            
            <label>Placa</label>
            <input type="text" name="placa"
                   disable="true"
                   value="<%out.write(""+c.getPlaca());%>"/>
            <br />
            <label>Marca</label>
            <input type="text" name="marca"
                   value=""<%out.write(c.getMarca());%> />
            <br />
            <label>Modelo</label>
            <input type="text" name="modelo"
                   value=""<%out.write(c.getModelo());%> />
            <br />
            <label>Km</label>
            <input type="text" name="km"
                   value="<%out.write(""+c.getKm());%>" />
            <br />
            <input type="checkbox"
                   name="arcondicionado"
                   value="<%
                       if (c.isArCondicionado()){
                           out.write("true");
                       }
                   %>" >Ar Condicionado? </input>
            <br />
            <input type="checkbox"
                   name="direcaohidraulica"
                   value="<%
                       if (c.isDirecaoHidraulica()){
                           out.write("true");
                       }
                   %>" >Direção Hidraulica? </input>
            <br />
            <input type="checkbox"
                   name="vidroeletrico"
                   value="<%
                       if (c.isVidroEletrico()){
                           out.write("true");
                       }
                   %>" >Vidro Eletrico? </input>
            <br />
            <input type="checkbox"
                   name="cambioautomatico"
                   value="<%
                       if (c.isCambioAutomatico()){
                           out.write("true");
                       }
                   %>" >Teu Possante tem Cambio Automatico? </input>
            <br />
            <hr />
            <input type="submit" value="ALTERAR" />
            
        </form>
    </body>
</html>
