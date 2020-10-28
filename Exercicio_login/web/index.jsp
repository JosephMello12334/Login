<%@page import="java.sql.*"%>
<%@page import="config.Conexao"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/template.css" rel="stylesheet">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
    </head>
    
            <%     
                Statement st = null;
                ResultSet rs = null;
             %>
    <body>
        
<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->



    <!-- Login Form -->
    <form>
      <input type="text" id="login" class="fadeIn second" name="usuario" placeholder="Insira seu email">
      <input type="text" id="password" class="fadeIn third" name="senha" placeholder="Insira sua senha">
      <input type="submit" class="fadeIn fourth" value="Login">
    </form>

                         <%
                          String user = request.getParameter("usuario"); 
                          String pass = request.getParameter("senha"); 
                          String nomeUsuario = "";
                          String usuario = "";
                          String senha = "";
                          
                          int i = 0;


                          try{
                          st = new Conexao().conectar().createStatement();
                          rs = st.executeQuery("SELECT * FROM usuarios WHERE email = '"+user+"' and senha= '"+pass+"'");
                          while (rs.next()){
                             // out.println(rs.getString(2));
                             usuario = rs.getString(3);
                             senha = rs.getString(4);
                             nomeUsuario = rs.getString(2);
                             rs.last();
                             i = rs.getRow();
                          }
                          } catch (Exception e){
                              out.println(e);
                          }
                          
                          if((user == null) || (pass == null)){
                              out.println("Preencha os dados");
                          } else{
                              if(i>0){
                                  session.setAttribute("nomeUsuario", nomeUsuario);
                                  response.sendRedirect("usuarios.jsp");
                              }
                          }
                        %>
</div>
    </body>
</html>
