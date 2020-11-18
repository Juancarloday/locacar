<%-- 
    Document   : cadastrocliente
    Created on : 6 de nov de 2020, 07:59:53
    Author     : entra21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Locacar</h1>
         </head>
    <body>
        <h1>Cadastro Cliente</h1>
        <hr />
        <form action="recebedadoscliente.jsp" method ="POST">
        
        <label>informe o CPF</label>
            <input type="text" name="cpf" />
            
            <br />
            <label>informe o Nome</label>
            <input type="text" name="nome" />
            
            <br />
            <label>informe o Numero do Cartao</label>
            <input type="text" name="numerocartao" />
            
            <br />
            <label>informe email</label>
            <input type="text" name="email" />
            
        
            <hr />
            <input type="submit" value="Salvar" />
            
                    
            <form />
    </body>
</html>

        
        
        
   
