<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="tour.css">
        <title>MY TOUR</title>
    </head>
    <body>
        
        <%
            try{
                String place,mode;
                place=request.getParameter("n1");
                mode=request.getParameter("n2");
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/travel","root","");
                PreparedStatement pst=con.prepareStatement("insert into tour values(?,?)");
                pst.setString(1,place);
                pst.setString(2,mode);
                int x=pst.executeUpdate();
                if(x==1){
                    response.sendRedirect("tour1.jsp");
                }
            }
            catch(Exception e){
                out.println(e);
            }
            %>
    </body>
</html>
