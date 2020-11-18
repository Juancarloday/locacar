<%-- 
    Document   : recebedadoscliente
    Created on : 6 de nov de 2020, 08:12:12
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
        <h1>Hello World!</h1>
            <%
        String cpf = request.getParameter("cpf");
        String nome = request.getParameter("nome");
        String numerocartao = request.getParameter("numerocartao");
        String email = request.getParameter("email");
        String fone = request.getParameter("fone");
               
        Cliente cliente = new Cliente();
        cliente.setCpf(cpf);
        cliente.setNome(nome);
        cliente.setNumerocartao(numerocartao);
        cliente.setEmail(email);
        cliente.setFone(Integer.parseInt(fone));
        
        
        if(cliente.salvar()){
            out.write("Cliente salvo com sucesso");
        }else
        {
            out.write("Erro ao salvar cliente");
        }
        
        


        %>
    </body>
</html>
