<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ page import="com.jsp.shoppingcart.dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Merchant Dashboard</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        margin: 0;
        padding: 0;
    }
    .container {
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h1 {
        margin-top: 0;
    }
    .message {
        color: blue;
    }
    .success-message {
        color: green;
    }
    .action-buttons {
        margin-top: 20px;
    }
    .action-buttons button {
        display: block;
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: none;
        border-radius: 5px;
        background-color: #007bff;
        color: #fff;
        cursor: pointer;
    }
    .action-buttons button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<div class="container">
    <h1>${message}</h1>
    <% Merchant m=(Merchant)session.getAttribute("merchantinfo"); %>
    <% if(m != null) { %>
        <h2 class="success-message">${msg}</h2>
        <div class="action-buttons">
            <button onclick="location.href='addproduct'">Add Product</button>
            <button onclick="location.href='viewallproducts.jsp'">View All Products</button>
            <button onclick="location.href='updatemerchant?id=<%= m.getId()%>'">Update Account</button>
            <button onclick="location.href='deleteaccount?id=<%= m.getId()%>'">Delete Account</button>
        </div>
    <% } else { %>
        <h2 class="message"><a href="merchantloginform.jsp">Please Login First</a></h2>
    <% } %>
</div>
</body>
</html>

<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ page import="com.jsp.shoppingcart.dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>${massage}</h1>
<% Merchant m=(Merchant)session.getAttribute("merchantinfo"); %>
<% if(m!=null) {  %>
<h1 style="color:green">${msg}</h1>
<h1><a href="addproduct">Add Product</a></h1><br>
<h1><a href="viewallproducts.jsp">View All Product</a></h1><br>

<h1><a href="updatemerchant?id=<%= m.getId()%>">Update Account</a></h1><br>
<h1><a href="deleteaccount?id=<%= m.getId()%>">Delete Account</a></h1><br>
<%}else { %>
<h1><a href="merchantloginform.jsp">Please Login First</a></h1>
<%} %>
</body>
</html> --%>