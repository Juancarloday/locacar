<%-- 
    Document   : recebedadoslocacao
    Created on : 11 de nov de 2020, 08:54:04
    Author     : entra21
--%>

<%@page import="java.sql.Date"%>
<%@page import="Modelos.Cliente"%>
<%@page import="Modelos.Carro"%>
<%@page import="Modelos.Locacao"%>
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
          String idcarro = request.getParameter("idcarro");
          String cpfcliente = request.getParameter("idcliente");
          String data = request.getParameter("data");
          
          Carro car = new Carro();
          car = car.consultar(Integer.parseInt(idcarro));
          
          Cliente cli = new Cliente();
          cli = cli.consultar(cpfcliente);
          
          Locacao locacao = new Locacao();
          locacao.setCarro(car);
                  
          locacao.setCliente(cli);
          locacao.setData(Date.valueOf(data));
          locacao.setDataEntrega(Date.valueOf(data));
          
          if(locacao.salvar()){
              out.write("locação inserida com sucesso");
          }
          

        %>
    </body>
</html>
