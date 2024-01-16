<%-- 
    Document   : index
    Created on : 18/06/2021, 11:47:09 PM
    Author     : osdroix
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="entidades.productos"%>
<%@page import="backend.crud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Vaquita</title>
        <link href="CSS/style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
            <div class="menu">
                <div class="party">
                    <div>
                        <img class="img" alt="Responsive image" src="Img/vaca.png" >         
                        <h1 class="media">
                                La Vaquita
                        </h1>
                    </div>

                    <div class="partys"> 
                        <div>
                             <form action="Modelador?accion=Buscar" method="post">
                                <select class="form" name="select">
                                <option value="1">Refrescos</option>
                                <option value="2">Cremeria</option>
                                <option value="3">Abarrotes</option>
                                <option value="4">Semillas Y Chiles</option>
                                <option value="5">Farmacia</option>
                                </select>
                               <button type="submit"  class="btn" name="btn">seleccionar</button> 
                            </form>
                        </div>   
                        <div >
                            <form action="Modelador?accion=Buscar" method="post">
                                    <input class="form" type="text" placeholder="Buscador" required="required" name="busca" />
                                    <button type="submit"  class="btn" name="btn">Buscar</button>
                            </form>
                        </div>
                    </div> 
                </div>
            </div>
        <article>
            <div class="party">
                <div class="muro">
                       <div class="muro">
                             <% 
                             ArrayList<productos> us = new ArrayList();
                             us=crud.Vistaproductos();
                             for(productos o:us){%>
                                  <div class="Agenda">
                                     <h3 align="center"><%out.println(o.getNom_producto());%></h3>
                                     <h6 align="center"><%out.println(o.getMXN_producto());%></h6><hr>
                                     <h6>Descripción</h6>
                                     <label><%out.println(o.getMXN_producto_4());%></label><hr>
                                      <div align="right"> 
                                         <%out.println("<a class='btn btn-primary' href='info.jsp?Id="+o.getId_producto()+"'>Seleccionar</a>");%>
                                      </div>       
                                 </div>
                            <% 
                             }
                             %>
                        
                </div>
                </div>
                <div class="control">
                 </div>   
            </div>
        </article>
    </body>
</html>

