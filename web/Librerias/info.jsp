
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Backend.conexion"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Backend.CRUD"%>
<%@page import="Entidades.usuarios"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
    %>
   <%
    HttpSession sesion=request.getSession(true);
    usuarios u=(usuarios)sesion.getAttribute("user");
    if (sesion.getAttribute("user")!=null){
       
      
%>
<!DOCTYPE html>
<html>
<head>
	 <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="keywords" content="Art Sign Up Form Responsive Widget, 
              Audio and Video players, Login Form Web Template, Flat Pricing 
              Tables, Flat Drop-Downs, Sign-Up Web Templates, 
	Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone 
        Compatible Web Template, Free Web Designs for Nokia, Samsung, 
        LG, Sony Ericsson, Motorola Web Design"
    />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
         integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <link rel="stylesheet" type="text/css" href="CSS/ventana.css">
    <link href="CSS/diseño.css" rel="stylesheet" type="text/css" />
	<title>
		agenda
	</title>
</head>
<body class="clases">
    <div class="superiorr">
	<h1  class="hy" >
            <% out.println(u.getNom_usu());  %> 
                <button class="btn btn-outline-light" id="btn-abrir-popups">Perfil</button>
                <button class="btn btn-primary " id="btn-abrir-popup">Agregar Nota</button>
                <div class="p">
                   <form action="info.jsp" method="POST">
                         <p align="left">Buscar Agenda</p>
                   <div class="party">
                    <select class="form-control"  name="nota">
                                <%
                                  Connection c = conexion.getConnection();
                                    String x = "select * from usuario INNER JOIN agenda ON usuario.Id_usua=agenda.Id_usuario where Id_usuario like '"+u.getId_usuario()+"'";                                    
                                    PreparedStatement set1 = c.prepareStatement(x);
                                    ResultSet rs = set1.executeQuery();
                                    while (rs.next()) {
                                        %>
                                        <option><%=rs.getString(6)%></option>
                                        <%
                                    }
                                        %>
                        </select>
                        <button type="submit" class="btn btn-link">
                            <img  alt="Responsive image"src="/aut/img/lup.png"width="30" height="30"/>
                        </button>
                        
                </div>
                     </form>
                </div>
        </h1>
          
    </div>
                  <%
                    String nota= request.getParameter("nota");
                    if(nota == null){
                 %>
                 <div class="party">         
                        <div class="muro">
                             <% 
                             ArrayList<usuarios> us = new ArrayList();
                             us=CRUD.getagendalista(u.getId_usuario());
                             for(usuarios o:us){%>
                                  <div class="Agenda">
                                     <h3 align="center"><%out.println(o.getNom_Agenda());%></h3>
                                     <h6 align="center"><%out.println(o.getFecha_Agenda());%></h6><hr>
                                     <h6>Descripción</h6>
                                     <label><%out.println(o.getAgenda());%></label><hr>
                                      <div align="right"> 
                                         <%out.println("<a class='btn btn-primary' href='info.jsp?Id="+o.getId_agenda()+"&titulo="+o.getNom_Agenda()+"&des="+o.getAgenda()+"'>Seleccionar</a>");%>
                                      </div>       
                                 </div>
                            <% 
                             }
                             %>
                        
                </div>
                        <div class="Agenda-menu">
                            <h5>Control de notas</h5><hr><br>
                            <button class="btn btn-primary btn-block" id="btn-abrir-popup2">Editar</button>
                            <button class="btn btn-danger btn-block" id="btn-abrir-popup3">Eliminar</button><hr>
                            <center><A  class="btn btn-warning" href="Modelador?accion=cerrar-sesion" >Cerrar sesión</A></center>

                        </div>
                 </div>
                    <% 
                    }else if (nota != null) {
                    %>
               
                 <div class="party">  
                 <div class="muro">
                    <% 
                    ArrayList<usuarios> us = new ArrayList();
                    us=CRUD.getagenda(nota);
                    for(usuarios o:us){%>
                         <div class="Agenda">
                            <h3 align="center"><%out.println(o.getNom_Agenda());%></h3>
                            <h6 align="center"><%out.println(o.getFecha_Agenda());%></h6><hr>
                            <h6>Descripción</h6>
                            <label><%out.println(o.getAgenda());%></label><hr>
                                <div align="right"> 
                                         <%out.println("<a class='btn btn-primary' href='info.jsp?Id="+o.getId_agenda()+"&titulo="+o.getNom_Agenda()+"&des="+o.getAgenda()+"'>Seleccionar</a>");%>
                             </div>     
                        </div>
                   <% 
                    }
                    %>
               </div>
               <div class="Agenda-menu">
                            <h5>Control de notas</h5><hr><br>
                            <button class="btn btn-primary btn-block" id="btn-abrir-popup2">Editar</button>
                            <button class="btn btn-danger btn-block" id="btn-abrir-popup3">Eliminar</button><hr>
                            <center><A  class="btn btn-warning" href="Modelador?accion=cerrar-sesion" >Cerrar sesión</A></center>

               </div>
        </div>
                    <% 
                    }
                    %>
                
                    <div class="overlay" id="overlay">
                    <div class="popup" id="popup">

                        <a href="#" id="btn-cerrar-popup" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
                    <form action="Modelador?accion=Registro-Nota" method="post">
                        <h5 align="center">Notas<hr></h5>
                        <input type="hidden" value="<% out.println(u.getId_usuario());  %>" name="id"/>
                        Título:
                        <input class="form-control" type="text" placeholder="" required="required" name="titulo" /><hr>
                        Descripcion:<br>
                        <textarea name="des" placeholder="" cols="40" rows="3">
                        </textarea><br>
                        <br><center><button type="submit"  class="btn btn-success" name="btn">Registro</button></center>
                </form>
                    </div>
                    </div>
                        
                        <div class="overlay" id="overlays">
                    <div class="popup" id="popups">

                        <a href="#" id="btn-cerrar-popups" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
                        <h5 align="center">Perfil<hr></h5>
                        Nombre:
                        <input type="text" class="form-control" value="<% out.println(u.getNom_usu());  %>" name="id"/><br>
                        Contraseña:
                        <input type="text" class="form-control" value="<% out.println(u.getContraseña_usu());  %>" name="id"/>
                    </div>
                    </div>
                         <%
                            String identificador= request.getParameter("Id");
                            String titulo= request.getParameter("titulo");
                            String des= request.getParameter("des");
                            if(identificador != null){
                         %>
                        <div class="overlay" id="overlay2">
                    <div class="popup" id="popup2">

                        <a href="#" id="btn-cerrar-popup2" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
                    <form action="Editar" method="post">
                        <h5 align="center">Editar<hr></h5>
                        <input type="hidden" value="<% out.println(identificador);  %>" name="id"/>
                        <input type="hidden" value="<% out.println(u.getId_usuario());  %>" name="vamos"/>
                        Título:
                        <input class="form-control" type="text" placeholder="" required="required" value="<% out.println(titulo);  %>"name="titulo" /><hr>
                        Descripcion:<br>
                        <textarea name="des" placeholder="" cols="40" rows="3">
                            <% out.println(des);  %>
                        </textarea><br>
                        <br><center><button type="submit"  class="btn btn-success" name="btn">Editar</button></center>
                </form>
                    </div>
                    </div>
                        <div class="overlay" id="overlay3">
                    <div class="popup" id="popup3">

                        <a href="#" id="btn-cerrar-popup3" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
                    <form action="eliminar" method="post">
                        <h5 align="center">Eliminar<hr></h5>
                        <input type="hidden" value="<% out.println(identificador);  %>" name="id"/>
                        Título:
                        <input class="form-control" readonly type="text" placeholder="" required="required" value="<% out.println(titulo);  %>"name="titulo" /><hr>
                        Descripcion:<br>
                        <textarea name="des" readonly placeholder="" cols="40" rows="3">
                            <% out.println(des);  %>
                        </textarea><br>
                        <br><center><button type="submit"  class="btn btn-danger" name="btn">eliminar</button></center>
                </form>
                    </div>
                    </div>
                        <%
                            }else if (identificador == null) {
                        %>
                    <div class="overlay" id="overlay2">
                    <div class="popup" id="popup2">

                        <a href="#" id="btn-cerrar-popup2" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
                        <h1>Selecciona una nota</h1>
                    </div>
                    </div>
                    <div class="overlay" id="overlay3">
                    <div class="popup" id="popup3">

                        <a href="#" id="btn-cerrar-popup3" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
                        <h1>Selecciona una nota</h1>
                    </div>
                    </div>
                        <%
                        }
                        %>
                    
  <script src="/aut/JS/ventnas.js"></script>
</body>
</html>
<%   }else{
response.sendRedirect("Dashboard.jsp?in=Usuario &error=Sesion caducada&img=Img/enojo.jpg");
    }
%>