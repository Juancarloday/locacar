<%-- 
    Document   : cadastrolocacao
    Created on : 11 de nov de 2020, 08:12:21
    Author     : entra21
--%>

<%@page import="Modelos.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="Modelos.Carro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Cadastro Locação</h1>
        <hr />
        <%
            Carro carro = new Carro();
            List<Carro> carros = carro.consultar();
        %>
            <form action="recebedadoslocacao.jsp" method="POST">"
        <label>Selecione o CARRO para a Locação</label>
               
        <select name="idcarro">
            <%for(Carro c : carros){%>
            <option value="<%out.write(""+c.getId());%>">
                <%out.write(c.getMarca()+"-"+c.getModelo());%>
            </option>
                <%}%>
                </select>
                <hr/>    
                <%--<input type=""submit" value="SALVAR"/>--%>
           
        
         <%
            Cliente cli = new Cliente();
            List<Cliente> clientes = cli.consultar();
        %>
        <label>Selecione o CLIENTE para a Locação</label> 
        
        <select name="idcliente">
            <%for(Cliente c : clientes){%>
            <option value="<%out.write(""+c.getCpf());%>">
                <%out.write(c.getNome());%>
            </option>
                <%}%>
                </select>
                <br />
                <label>Informe data</label>
                <input type="date" name="data" />
                <hr/>    
                <input type="submit" value="SALVAR"/>
            </form>       
      
    </body>
</html>
