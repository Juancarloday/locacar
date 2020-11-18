<%-- 
    Document   : consultacarro
    Created on : 30 de out de 2020, 08:36:32
    Author     : entra21
--%>

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
        <h1>Consulta Carros</h1>
        <hr />
        <%
        Carro carro = new Carro();
        List<Carro> carros = carro.consultar();
        %>
        <table>
            <thead>
            <th>Placa</th>
            <th>Marca</th>
            <th>Modelo</th>
            <th>Km</th>
            <th>Tem Ar Condicionado?</>
            <th>Tem Direcão Hidraulica?</>
            <th>Tem Vidro Eletrico?</>
            <th>Tem Cambio Automatico?</>
            <th>Editar</th>
            <th>Excluir</th>
            </thead>
            <tbody>
                <% for (Carro c : carros) {%>
                <tr>
                    <td><% out.write(""+c.getPlaca()); %></td>
                    <td><% out.write(c.getMarca()); %></td>
                    <td><% out.write(c.getModelo()); %></td>
                    <td><% out.write(""+c.getKm()); %></td>
                    
                    <% if(c.isArCondicionado()){%>
                         <td>sim</td>
                    <% }else{%>
                         <td>Não</td>
                    <%}%>
                    
                    <% if(c.isDirecaoHidraulica()){%>
                        <td>Sim</td>
                    <% }else{%>
                        <td>Não</td>
                    <%}%>
                    
                    <% if (c.isVidroEletrico()) {%>
                        <td>Sim</td>
                    <% }else{%>
                        <td>Não</td>
                    <%}%>
                    
                    <% if (c.isCambioAutomatico()) {%>
                        <td>Sim</td>
                    <% }else{%>
                        <td>Não</td>
                       <%}%>
                       
                    <td><%out.write("<a href=editarcarro.jsp?placa="+c.getPlaca()+">Editar</a>");%></td>                          
                  
                   
                   <td><%out.write("<a href=excluircarro.jsp?placa="+c.getPlaca()+">Excluir</a>");%></td>                          
                   </tr>
                    <%}%>         
                 
                    
                        
               
            </tbody>
        </table>
        
      
    </body>
</html>
