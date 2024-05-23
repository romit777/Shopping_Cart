<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ page import="com.jsp.shoppingcart.dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Dashboard</title>
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
    h1, h2 {
        color: #007bff;
        margin-top: 20px;
    }
    a.button {
        display: block;
        padding: 10px 20px;
        margin: 10px;
        text-decoration: none;
        color: #fff;
        background-color: #007bff;
        border: 1px solid #007bff;
        border-radius: 5px;
    }
    a.button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<div class="container">
    <% Customer c = (Customer) session.getAttribute("customerinfo"); %>
    <% if (c != null) { %>
        <h1>${mesg}</h1>
        <h2><a href="displayallproducts" class="button">Display All products</a></h2>
        <h2><a href="displayproductsbybrand" class="button">Display Product By Brand</a></h2>
        <h2><a href="displayproductsbycategory" class="button">Display Product by Category</a></h2>
        <h2><a href="displaybetweenrange" class="button">Display Product between Range</a></h2>
    <% } else { %>
        <h1><a href="customerloginform.jsp">Please Login First</a></h1>
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
<% Customer c=(Customer)session.getAttribute("customerinfo"); %>
<% if(c!=null) {  %>
<h1>${mesg}</h1>
<h2><a href="displayallproducts">Display All products</a></h2>
<h2><a href="displayproductsbybrand">Display Product By Brand</a></h2>
<h2><a href="displayproductsbycategory">Display Product by Category</a></h2>
<h2><a href="displaybetweenrange">Display Product between  Range   </a></h2>
<%}else{ %>
<h1><a href="customerloginform.jsp">Please Login First</a></h1>
<%} %>
</body>
</html> --%>