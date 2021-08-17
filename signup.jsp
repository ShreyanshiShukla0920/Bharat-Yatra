<%@page import="java.sql.*,java.io.IOException.*" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SignUp Page</title>
    </head>
    <body>
        <%
            try{
            String name=request.getParameter("n1");
            String email=request.getParameter("n2");
            String pass=request.getParameter("n3");
            String confirm=request.getParameter("n4");
                
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/travel","root","");
            String q="select * from login";
            Statement smt=con.createStatement();
            PreparedStatement pst=con.prepareStatement("insert into login(name,email,password)values(?,?,?)");
            pst.setString(1,name);
            pst.setString(2,email);
            pst.setString(3,pass);
           
            
            ResultSet rs=smt.executeQuery(q);
          int pos=0;
            while(rs.next()){
                int c=0;
                if(rs.getString(2).equals(email)){
                    c++;
                    pos=c;
                    break;
                }
            }
           if(pos==0){
                int x=pst.executeUpdate();
           
            
                out.println("Registered Successfully");
           }
            else{
                out.println("Username or password is invlaid");
            }
                 
            }
            
            catch(Exception e){
                out.println(e);
            }
           

        %>
         
    </body>
</html>
