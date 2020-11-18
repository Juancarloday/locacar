<%-- 
    Document   : consultacliente
    Created on : 6 de nov de 2020, 08:05:41
    Author     : entra21
--%>

<%@page import="java.util.List"%>
<%@page import="Modelos.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Consulta Cliente!</h1>
           <hr />
        <%
        Cliente cliente = new Cliente();
        List<Cliente> retorno = cliente.consultar();
        %>
        <table>
            <thead>
            <th>CPF</th>
            <th>Nome</th>
            <th>NumeroCartao</th>
            <th>email</th>
            <th>Fone</>
            </thead>
            <tbody>
                <% for (Cliente cli : retorno) {%>
                <tr>
                    <td><% out.write(cli.getCpf());%></td>
                    <td><% out.write(cli.getNome()); %></td>
                    <td><% out.write(cli.getNumerocartao()); %></td>
                    <td><% out.write(cli.getEmail()); %></td>
                    <td><% out.write(""+cli.getFone()); %></td>
                
                 
                <td><%out.write("<a href=editarcliente.jsp?cpf="+cli.getCpf()+">Editar</a>");%></td>  
                <%--<td><%out.write("<a href=excluircarro.jsp?placa="+c.getPlaca()+">Excluir</a>");%></td>--%>  
                <%}%>
                
                   </tr>
            </tbody>
        </table>
      </body>
</html>
