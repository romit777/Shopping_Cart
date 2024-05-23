<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.jsp.shoppingcart.dto.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            text-align: center;
        }
        form {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #007bff;
        }
        input[type="text"],
        input[type="number"] {
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
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <% Product p=(Product)request.getAttribute("prodobj"); %>
    <form action="additemtocart">
        <input type="hidden" name="id" value="<%=p.getId() %>" readonly="true"> 
        <h2>Add Item to Cart</h2>
        <label for="brand">Brand:</label>
        <input type="text" name="brand" value="<%=p.getBrand() %>" readonly="true"><br>
        <label for="category">Category:</label>
        <input type="text" name="category" value="<%= p.getCategory() %>" readonly="true"><br>
        <label for="model">Model:</label>
        <input type="text" name="model" value="<%= p.getModel() %>" readonly="true"><br>
        <label for="price">Price:</label>
        <input type="text" name="price" value="<%= p.getPrice() %>" readonly="true"><br>
        <label for="quantity">Quantity:</label>
        <input type="number" name="quantity" required><br>
        <input type="submit" value="ADD TO CART">
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
<% Product p=(Product)request.getAttribute("prodobj"); %>

<form action="additemtocart">
<input type="hidden" name="id" value="<%=p.getId() %>" readonly="true"> 
<!-- Hidden form field ,this data will not be shown to the user..-->

Brand : <input type="text" name="brand" value="<%=p.getBrand() %>" readonly="true"><br>
Category :<input type="text" name="category" value="<%= p.getCategory() %>" readonly="true"><br>
Model : <input type="text" name="model" value="<%= p.getModel() %>" readonly="true"><br>
Price : <input type="text" name="price" value="<%= p.getPrice() %>" readonly="true"><br>
Quantity : <input type="number" name="quantity"><br>

<input type="submit" value="ADD TO CART">
</form>
</body>
</html> --%>