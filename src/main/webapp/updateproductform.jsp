<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.jsp.shoppingcart.dto.*" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Update Product</title>
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
        input[type="text"] {
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
    <% Product p = (Product) request.getAttribute("updateobj"); %>

    <form action="updateandsave" method="post">
        <h1>Update Product</h1>
        <label for="id">Enter ID:</label>
        <input type="number" name="id" value="<%= p.getId() %>" readonly required="required"><br>
        <label for="brand">Enter Brand:</label>
        <input type="text" name="brand" value="<%= p.getBrand() %>" required="required"><br>
        <label for="category">Enter Category:</label>
        <input type="text" name="category" value="<%= p.getCategory() %>" required="required"><br>
        <label for="model">Enter Model:</label>
        <input type="text" name="model" value="<%= p.getModel() %>" required="required"><br>
        <label for="price">Enter Price:</label>
        <input type="number" name="price" value="<%= p.getPrice() %>" required="required"><br>
        <label for="stock">Enter Stock:</label>
        <input type="number" name="stock" value="<%= p.getStock() %>" required="required"><br>
        <input type="submit" value="Update">
    </form>
</body>
</html>


<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
       <%@ page import="com.jsp.shoppingcart.dto.*" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body><%Product  p=(Product)request.getAttribute("updateobj"); %>

<form action="updateandsave" >
Enter ID : <input type="number" name="id" value="<%=p.getId()%>" readonly="true" ><br>
Enter Brand : <input type="text" name="brand" value="<%= p.getBrand()%>" ><br>
Enter Category: <input type="text" name="category" value="<%= p.getCategory()%>"><br>
Enter Model : <input  type="text" name="model" value="<%=p.getModel()%>"><br>
Enter Price : <input type="number" name="price" value="<%=p.getPrice()%>"><br>
Enter Stock : <input type="number" name="stock" value="<%=p.getStock()%>"><br>
<input type="submit" value="Update">
</form>
</body>
</html> --%>