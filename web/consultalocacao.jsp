<%-- 
    Document   : consultalocacao
    Created on : 13 de nov de 2020, 08:22:39
    Author     : entra21
--%>
<%@page import="java.util.List"%>
<%@page import="Modelos.Locacao"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelos.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%
          List<Locacao> locacoes = new ArrayList<>();
          String cpfcliente = request.getParameter("cpfcliente");
          if(cpfcliente != null){
            Locacao locacao = new Locacao();
            locacoes = locacao.consultar(cpfcliente);
          }
        %>
        <h1>CONSULTA LOCAÇÃO</h1>
        <hr/>
         <form action="consultalocacao.jsp" method="POST">
            <label>Digite o cpf do cliente</label>
            <input type="text" name="cpfcliente" />
          
            <input type="submit" value="Consultar" />
            <hr />
            <table>
                <thead>
                  <th>Id</th> 
                  <th>Carro</th>
                  <th>Cliente</th>
                  <th>Data</th>
                  <th>Data Retirada</th>
                </thead>
                <tbody>
                    <%for(Locacao loc: locacoes){%>
                        <tr>
                            <td><%out.write(""+loc.getId());%></td>
                            <td><%out.write(""+loc.getIdcarro());%></td>
                            <td><%out.write(""+loc.getCpfcliente());%></td>
                            <td><%out.write(""+String.valueOf(loc.getData()));%></td>
                            <td><%out.write(""+String.valueOf(loc.getDataEntrega()));%></td>
                        </tr>
                    <%}%>
                </tbody>    
            </table>
            
        </form>
    </body>
</html>
