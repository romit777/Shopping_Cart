<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.jsp.shoppingcart.dto.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Update Merchant</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        form {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #007bff;
        }
        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }
        input[type="number"],
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <% Merchant m = (Merchant) request.getAttribute("merchantobj"); %>
    <form action="updateandsavemerchant" method="post">
        <h1>Update Merchant</h1>
        <input type="number" name="id" value="<%= m.getId() %>" readonly="true" ><br>
        <label for="name">Enter Name:</label>
        <input type="text" name="name" value="<%= m.getName() %>" required="required"><br>
        <label for="mobilenumber">Enter Mobile Number:</label>
        <input type="text" name="mobilenumber" value="<%= m.getMobilenumber() %>" required="required"><br>
        <label for="email">Enter Email:</label>
        <input type="text" name="email" value="<%= m.getEmail() %>" required="required"><br>
        <label for="password">Enter Password:</label>
        <input type="password" name="password" required="required"><br>
        <label for="cpassword">Confirm Password:</label>
        <input type="password" name="cpassword" required="required"><br>
        <input type="submit" value="Update">
    </form>
</body>
</html>


<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.jsp.shoppingcart.dto.*" %>
      <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% Merchant m=(Merchant)request.getAttribute("merchantobj"); %>
<form action="updateandsavemerchant" >
<input type="number" name="id" value="<%=m.getId()%>" readonly="true" ><br>
Enter Name : <input type="text" name="name" value="<%= m.getName()%>" ><br>
Enter Mobile Number: <input type="text" name="mobilenumber" value="<%= m.getMobilenumber()%>"><br>
Enter Email : <input  type="text" name="email" value="<%=m.getEmail()%>"><br>
Enter Password : <input type="text" name="password"><br>
Confirm Password : <input type="password" name="cpassword" ><br>
<input type="submit" value="Update">
</form>

</body>
</html> --%>