    <%-- 
    Document   : editarcliente
    Created on : 9 de nov de 2020, 08:44:58
    Author     : entra21
--%>

<%@page import="Modelos.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EDITAR CLIENTE</title>
    </head>
    <body>
        <h1>Edição de Cliente!</h1>
         <hr />
        <%
        String cpf = request.getParameter("cpf");
        Cliente c = new Cliente();
        if(cpf != null){
        c = c.consultar(cpf);
        }
        %>
        <form action="recebeeditarcliente.jsp" method = "POST">
            
            
            <label>CPF</label>
            <input type="text" name="cpf"
                   disable="true"
                   value="<%out.write(""+c.getCpf());%>"/>
            <br />
            <label>Nome</label>
            <input type="text" name="nome"
                   value=""<%out.write(c.getNome());%> />
            <br />
            <label>Numero do Cartao</label>
            <input type="text" name="numerocartao"
                   value=""<%out.write(c.getNumerocartao());%> />
            <br />
            <label>email</label>
            <input type="text" name="email"
                   value="<%out.write(""+c.getEmail());%>" />
            <br />
            <label>Fone</label>
            <input type="text" name="fone"
                   value="<%out.write(""+c.getFone());%>" />
            <br />
            <hr />
            <input type="submit" value="ALTERAR" />
            
        </form>
    </body>
</html>
