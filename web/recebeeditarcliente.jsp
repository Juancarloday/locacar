<%-- 
    Document   : recebeeditarcliente
    Created on : 9 de nov de 2020, 08:55:38
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
        <h1>Cliente Editado!</h1>
        <hr />
            <%
        String cpf = request.getParameter("cpf");
        String nome = request.getParameter("nome");
        String numerocartao = request.getParameter("numerocartao");
        String email = request.getParameter("email");
        String fone = request.getParameter("fone");
               
        Cliente cli = new Cliente();
        cli.setCpf(cpf);
        cli.setNome(nome);
        cli.setNumerocartao(numerocartao);
        cli.setEmail(email);
        cli.setFone(Integer.parseInt(fone));
        
        if(cli.alterar()){
            out.write("Carro alterado com sucesso");
        }else
        {
            out.write("Erro ao alterar carro");
        }
        
        %>
    </body>
</html>
