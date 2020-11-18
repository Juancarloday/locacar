<%-- 
    Document   : cadastrocarro
    Created on : 30 de out de 2020, 08:35:47
    Author     : entra21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOCACAR</title>
    </head>
    <body>
        <h1>Cadastro Carro</h1>
        <hr />
        <form action="recebedadoscarro.jsp" method ="POST">
        
        <label>informe a placa</label>
            <input type="text" name="placa" />
            
            <br />
            <label>informe a marca</label>
            <input type="text" name="marca" />
            
            <br />
            <label>informe o modelo</label>
            <input type="text" name="modelo" />
            
            <br />
            <label>informe km</label>
            <input type="number" name="km" />
            
            <br />
             <label>informe arcondicionado</label>
             <input type="checkbox" name="arcondicionado">Ar Condicionado?</input>
            
            <br />
            <label>informe direcao hidraulica</label>
            <input type="checkbox" name="direcaohidraulica">Direcao Hidraulica?</input>
            
            <br />
            <label>informe vidro eletrico</label>
            <input type="checkbox" name="vidroeletrico">Vidro Eletrico?</input>
            
            <br />
            <label>informe cambio automatico</label>
            <input type="checkbox" name="cambioautomatico">Cambio Automatico?</input>
            
            <hr />
            <input type="submit" value="Salvar" />
            
            <form />
    </body>
</html>
