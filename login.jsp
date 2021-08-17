<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        
        <%
            try{
            String email,pass;
            int c=0;
            int pos=0;
            email=request.getParameter("n1");
            pass=request.getParameter("n2");
            
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/travel","root","");
        String q="select * from login";
       Statement st=con.createStatement();
       ResultSet rs=st.executeQuery(q);
        while(rs.next()){
           
            if((email.equals(rs.getString(2))) && (pass.equals(rs.getString(3))) ){
                c++;
                break;
            }
        }
        if(c==1){
            response.sendRedirect("index1.html");
        }
        
           }
            catch(Exception e){
                out.println(e.getMessage());
            }
        
        %>
        
        
        
    </body>
</html>
