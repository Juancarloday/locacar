<%-- 
    Document   : excluircarro
    Created on : 9 de nov de 2020, 08:15:36
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
        <h1>Exclusão no Cadastro de Carros!</h1>
        <%
        String placa = request.getParameter("placa");
        Carro c = new Carro();
        if(placa != null){
           c = c.consultar(placa);
           if(c.excluir()){
            out.write("Carro excluido com sucesso");
        }else
        {
            out.write("Erro ao excluir carro");
        }
        }
        %>
        
    </body>
</html>
