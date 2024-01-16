<%-- 
    Document   : index
    Created on : 21/06/2021, 06:26:17 PM
    Author     : osdroix
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="backend.conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="backend.crud"%>
<%@page import="entidades.productos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Vaquita</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=6.0">
        <link href="CSS/style.css" rel="stylesheet" type="text/css" />
        <link href="CSS/ventana.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
            <div class="menu">
                <div class="party">
                    <div>
                        <img class="img" alt="Responsive image" src="Img/vaca.png" >         
                        <h1 class="media">
                                La Vaquita
                        </h1>
                        
                            <a href="">
                                <img class="salida" alt="Responsive image" src="Img/hogar.png" >
                            </a>
                    </div>

                    <div class="partys">
                        
                        <div>
                             <form action="index.jsp" method="post">
                                <select class="form" name="categoria">
                                <option value="1">Refrescos</option>
                                <option value="2">Cremeria</option>
                                <option value="3">Abarrotes</option>
                                <option value="4">Semillas Y Chiles</option>
                                <option value="5">Farmacia</option>
                                </select>
                               <button type="submit"  class="btn">Seleccionar</button> 
                            </form>
                        </div>   
                        <div >
                            <form action="index.jsp" method="post">
                                    <select class="form"  name="nom">
                                <%
                                  Connection c = conexion.getConnection();
                                    String x = "select * from productos ";                                    
                                    PreparedStatement set1 = c.prepareStatement(x);
                                    ResultSet rs = set1.executeQuery();
                                    while (rs.next()) {
                                        %>
                                        <option><%=rs.getString(5)%></option>
                                        <%
                                    }
                                        %>
                        </select>
                                    <button type="submit"  class="btn" name="btn">Buscar</button>
                            </form>
                        </div>
                    </div> 
                </div>
            </div>
        <%
          String i, nom;
          i = request.getParameter("categoria");
          nom = request.getParameter("nom");
        %>
        
                <%
         if (nom == null) {
                 
                %>
                <%
                 if (i == null) {
                %>
                    <div class="party">
                        <div class="muro">

                                   <%
                                     ArrayList<productos> us = new ArrayList();
                                     us=crud.Vistaproductos();
                                     for(productos o:us){%>
                                        <div class="producto">
                                            <div>
                                                <h3 class="model-nom"><%out.println(o.getNom_producto());%></h3><hr>
                                            </div>
                                            <p align="center"><img class="centro"src="Modelado?id=<%out.println(o.getId_producto());%>"></p>
                                             <h6 class="model-precio">
                                                 <%out.println(o.getMXN_producto());%>MXN-<%out.println(o.getMXN_producto_4());%>MXN
                                             <hr></h6>
                                              <div class="model-cap"> 
                                                <%out.println("<a class='a-agregar'>venta</a>");%>
                                                <%out.println("<a class='a' href='index.jsp?Id="+o.getId_producto()+"'>Seleccionar</a>");%>
                                              </div>  
                               </div>
                                    <% 
                                     }
                                     %>
                        </div>
                        <div class="control">
                            <h3 class="model-control">Control de productos.</h3><hr>
                            <div >
                                <button class="a" id="btn-abrir-popup">Agregar </button><br>
                                <button class="a-agregar" id="btn-abrir-popups">Editar</button><br>
                                <button class="a-eliminar" id="btn-abrir-popup2">Eliminar</button><br>
                            </div>
                        </div>   
                    </div>
                        <%
                 }else{
                        %>
                        <div class="party">
                        <div class="muro">

                                   <%
                                     ArrayList<productos> us = new ArrayList();
                                     us=crud.productos(i);%>
                                     <% 
                                     for(productos o:us){%>
                                        <div class="producto">
                                            <div>
                                                <h3 class="model-nom"><%out.println(o.getNom_producto());%></h3><hr>
                                            </div>
                                            <p align="center"><img class="centro"src="Modelado?id=<%out.println(o.getId_producto());%>"></p>
                                             <h6 class="model-precio">
                                                 <%out.println(o.getMXN_producto());%>MXN-<%out.println(o.getMXN_producto_4());%>MXN
                                             <hr></h6>
                                              <div class="model-cap"> 
                                                <%out.println("<a class='a-agregar'>venta</a>");%>
                                                <%out.println("<a class='a' href='index.jsp?Id="+o.getId_producto()+"'>Seleccionar</a>");%>
                                              </div>  
                               </div>
                                    <% 
                                     }
                                     %>
                        </div>
                        <div class="control">
                            <h3 class="model-control">Control de productos.</h3><hr>
                            <div >
                                <button class="a" id="btn-abrir-popup">Agregar </button><br>
                                <button class="a-agregar" id="btn-abrir-popups">Editar</button><br>
                                <button class="a-eliminar" id="btn-abrir-popup2">Eliminar</button><br>
                            </div>
                        </div>   
                    </div>
                                     <%
                 }
                                     %>
         <%
         }else{
         %>
         <div class="party">
                        <div class="muro">

                                   <%
                                     ArrayList<productos> us = new ArrayList();
                                     us=crud.productosnom(nom);%>
                                     <% 
                                     for(productos o:us){%>
                                        <div class="producto-mostrador">
                                            <div class="party"> 
                                            <p align="center"><img class="centro-mostrador"src="Modelado?id=<%out.println(o.getId_producto());%>"></p>
                                            <div>
                                                <h3 class="media"><%out.println(o.getNom_producto());%><hr></h3>
                                             <h6 class="media-pre">
                                                Precio Neto: <%out.println(o.getMXN_producto());%>MXN
                                                 <br>
                                                Precio Compuesto 1/2 o 1/4:<br><%out.println(o.getMXN_producto_4());%>MXN
                                                 <br><br>
                                                Descripción:
                                                <br>
                                                <%out.println(o.getDes_producto());%>
                                             <hr></h6>
                                              <div class="model-cap">
                                                  <p align="right">
                                                <%out.println("<a class='a-agregar'>venta</a>");%>
                                                   <%out.println("<a class='a' href='index.jsp?Id="+o.getId_producto()+"'>Seleccionar</a>");%>
                                                  </p>
                                              </div> 
                                            </div> 
                                        </div>
                                        </div>
                                    <% 
                                     }
                                     %>
                        </div>
                        <div class="control">
                            <h3 class="model-control">Control de productos.</h3><hr>
                            <div >
                                <button class="a" id="btn-abrir-popup">Agregar </button><br>
                                <button class="a-agregar" id="btn-abrir-popups">Editar</button><br>
                                <button class="a-eliminar" id="btn-abrir-popup2">Eliminar</button><br>
                            </div>
                        </div>   
                    </div>
        <%
         }
        %> 

     <div class="overlay" id="overlay">
                    <div class="popup" id="popup">

                        <a href="#" id="btn-cerrar-popup" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
                        <h3>Agregar</h3><hr>
                        <form action="Modelado?accion=Registro" method="post" enctype="multipart/form-data">
                            <div class="form-lent">
                                <label class="model-nom">Categoria:</label>
                                <select class="form-util" name="categoria">
                                <option value="1">Refrescos</option>
                                <option value="2">Cremeria</option>
                                <option value="3">Abarrotes</option>
                                <option value="4">Semillas Y Chiles</option>
                                <option value="5">Farmacia</option>
                                </select>
                                <input class="form-util" type="text" placeholder="Nombre-Producto" required="required" name="nom" />
                                <input class="form-util" type="text" placeholder="Codigo-Identificador" name="codigo" />
                                <input class="form-util" type="file" placeholder="Url-<Imagen>" required="required" name="img" />
                                <div class="party">
                                    <input class="form-util" type="text" placeholder="Precio-Neto" required="required" name="MXN" />
                                    <input class="form-util" type="text" placeholder="Precio-Compuesto" required="required" name="MXN-4" />
                                </div>
                                    <input class="form-util" type="text" placeholder="Descripción" required="required" name="des" />
                            </div>
                                <hr><center><button type="submit"  class="a" name="btn">Aceptar</button> </center>
                        </form> 
                    </div>
    </div>
                
      
           <%
            String id = request.getParameter("Id");
            if (id == null ) {
           %>
                <div class="overlay" id="overlays">
                                <div class="popup" id="popups">

                                    <a href="#" id="btn-cerrar-popups" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
                                    <h3 align="center">Selecciona el Producto</h3>
                                    <center><img alt="Responsive image" src="Img/navegador.png" width="300" height="250" > </center>         
                                </div>
                </div>
                <div class="overlay" id="overlay2">
                                <div class="popup" id="popup2">

                                    <a href="#" id="btn-cerrar-popup2" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
                                    <h3 align="center">Selecciona el Producto</h3>
                                    <center><img alt="Responsive image" src="Img/navegador.png" width="300" height="250" > </center>         
                                </div>
                </div>
       <%
            }else{
       %>
            <div class="overlay" id="overlays">
                         <div class="popup" id="popups">

                             <a href="#" id="btn-cerrar-popups" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
                             <h3>Editar</h3>
                    
                           <%
                           
                             ArrayList<productos> us = new ArrayList();
                            us=crud.productosEdit(id);%>
                             <% 
                             for(productos o:us){%>
                             <div class="party">
                                 <div>
                                     <p align="center"><img class="centro"src="Modelado?id=<%out.println(o.getId_producto());%>"></p>
                                 </div>
                                    <form action="Modelado?accion=Modificar" method="post" enctype="multipart/form-data">
                                 <div>
                                       <div class="form-lent">
                                           <input type="hidden" value="<%out.println(o.getId_producto());%>" name="id"/>
                                           <select class="form" name="categoria">
                                            <option value="1">Refrescos</option>
                                            <option value="2">Cremeria</option>
                                            <option value="3">Abarrotes</option>
                                            <option value="4">Semillas Y Chiles</option>
                                            <option value="5">Farmacia</option>
                                            </select>
                                           <input class="form-util" type="text" value="<%out.println(o.getNom_producto());%>" required="required" name="nom" />
                                           <input class="form-util" type="text" value="<%out.println(o.getId_buscador());%>" name="codigo" />
                                           <div class="party">
                                               <input class="form-util" type="text" value="<%out.println(o.getMXN_producto());%>" required="required" name="MXN" />
                                               <input class="form-util" type="text" value="<%out.println(o.getMXN_producto_4());%>" required="required" name="MXN-4" />
                                           </div>
                                               <input class="form-util" type="text" value="<%out.println(o.getDes_producto());%>" required="required" name="des" />
                                       </div>
                                 </div>
                                           <hr><center><button type="submit"  class="a" name="btn">Editar</button> </center>
                                   </form>
                                    <%
                                   }
                                    %>
                             </div>
                         </div>
         </div>
         <div class="overlay" id="overlay2">
                         <div class="popup" id="popup2">

                             <a href="#" id="btn-cerrar-popup2" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
                             <h3>Eliminar</h3>
                             <%
                            us=crud.productosEdit(id);
                             for(productos o:us){%>
                             <div class="party">
                                 <div>
                                     <p align="center"><img class="centro"src="Modelado?id=<%out.println(o.getId_producto());%>"></p>
                                 </div>
                                    <form action="Modelado?accion=eliminar" method="post" enctype="multipart/form-data">
                                 <div>
                                       <div class="form-lent">
                                           <input type="hidden" value="<%out.println(o.getId_producto());%>" name="id"/>
                                           <input type="hidden" value="<%out.println(o.getId_tipo_producto());%>" name="categoria"/>
                                           <input class="form-util" type="text" value="<%out.println(o.getNom_producto());%>" required="required" name="nom" />
                                           <input class="form-util" type="text" value="<%out.println(o.getId_buscador());%>" name="codigo" />
                                           <div class="party">
                                               <input class="form-util" type="text" value="<%out.println(o.getMXN_producto());%>" required="required" name="MXN" />
                                               <input class="form-util" type="text" value="<%out.println(o.getMXN_producto_4());%>" required="required" name="MXN-4" />
                                           </div>
                                               <input class="form-util" type="text" value="<%out.println(o.getDes_producto());%>" required="required" name="des" />
                                       </div>
                                 </div>
                                           <hr><center><button type="submit"  class="a-eliminar" name="btn">Eliminar</button> </center>
                                   </form>
                                    <%
                                   }
                                    %>
                         </div>
         </div>
         
       <%
            }
       %>
     <script src="JS/ventnas.js"></script>
    </body>
</html>
