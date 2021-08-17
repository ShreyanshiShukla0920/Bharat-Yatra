<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>MY TOUR</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="tour.css">
        
    </head>
    <body>
        <h1 style="text-align:center;">MY TOUR</h1><br />
        <% 
            try{
              Class.forName("com.mysql.jdbc.Driver");
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/travel","root","");
              Statement smt=con.createStatement();
              ResultSet rs=smt.executeQuery("select * from tour");
              out.println("<h2>DESTINATION &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MODE OF CONVEYANCE</h2>"+"<br />");
              while(rs.next()){
                  out.println("<h3>"+rs.getString(1)+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+rs.getString(2)+"</h3>"+"<br />");
                  
              }
              
            }
            catch(Exception e){
                out.println(e);
            }
            %>
    </body>
</html>
