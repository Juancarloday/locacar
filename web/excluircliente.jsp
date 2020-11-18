<%-- 
    Document   : excluircliente
    Created on : 10 de nov de 2020, 09:35:57
    Author     : entra21
--%>

<%@page import="Modelos.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Exclusão no Cadastro de Clientes!</h1>
        <%
        String cpf = request.getParameter("cpf");
        Cliente cli = new Cliente();
        if(cpf != null){
           cli = cli.consultar(cpf);
           if(cli.excluir()){
            out.write("Cliente excluido com sucesso");
        }else
        {
            out.write("Erro ao excluir cliente");
        }
        }
        %>
        
        
    </body>
</html>
