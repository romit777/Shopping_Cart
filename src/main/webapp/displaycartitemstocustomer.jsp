<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ page import="com.jsp.shoppingcart.dto.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopping Cart</title>
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
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    th, td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #f2f2f2;
    }
    h3 {
        margin-bottom: 10px;
    }
    .buy-button {
        margin-top: 20px;
    }
    .buy-button button {
        padding: 10px 20px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .buy-button button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<div class="container">
    <% 
    List<Item> items = (List<Item>) request.getAttribute("itemslist");
    double totalprice = (double) request.getAttribute("totalprice");    %>
    <table>
        <tr>
            <th>Brand</th>
            <th>Model</th>
            <th>Category</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Remove Item</th>
        </tr>
        <% for(Item p : items) { %>
        <tr>
            <td><%= p.getBrand() %></td>
            <td><%= p.getModel() %></td>
            <td><%= p.getCategory() %></td>
            <td><%= p.getQuantity() %></td>
            <td><%= p.getPrice() %></td>
            <td><a href="removeitem?id=<%= p.getId()%>">remove</a></td>
        </tr>
        <% } %>
    </table>
    <h3>Total Price: <%= totalprice %></h3>
    <div class="buy-button">
        <a href="addorder?tp=<%= totalprice %>">
            <button>Buy Now</button>
        </a>
    </div>
</div>
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
<% List<Item> items=(List<Item>)request.getAttribute("itemslist");
double totalprice=(double)request.getAttribute("totalprice");
%>
<table cellpadding="20px" border="1">
<tr>
<th>Brand</th>
<th>Model</th>
<th>category</th>
<th>Quantity</th>
<th>Price</th>
<th>Remove Item</th>
</tr>
<%for(Item p:items){ %>
<tr>
<td><%=p.getBrand() %></td>
<td><%=p.getModel() %></td>
<td><%=p.getCategory() %></td>
<td><%=p.getQuantity() %></td>
<td><%=p.getPrice() %></td>
<td><a href="removeitem?id=<%=p.getId()%>">remove</a></td>
</tr>
<%} %>
</table>
<h3>Total  Price : <%=totalprice %></h3>
<h2><a href="addorder?tp=totalprice"><button style="background-color: aqua;">Buy Now</button></a></h2>
</body>
</html> --%>