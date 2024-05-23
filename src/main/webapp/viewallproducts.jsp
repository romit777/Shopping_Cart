<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.jsp.shoppingcart.dto.*" %>
<%@ page import="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Merchant Products</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        a {
            text-decoration: none;
            color: #007bff;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <% 
    Merchant m = (Merchant) session.getAttribute("merchantinfo"); 
    List<Product> products = m.getProducts();
    %>

    <table>
        <tr>
            <th>ID</th>
            <th>Brand</th>
            <th>Model</th>
            <th>Category</th>
            <th>Price</th>
            <th>Stocks</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        <% for(Product p : products) { %>
        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getBrand() %></td>
            <td><%= p.getModel() %></td>
            <td><%= p.getCategory() %></td>
            <td>Rs.<%= p.getPrice() %></td>
            <td><%= p.getStock() %></td>
            <td><a href="updateproduct?id=<%= p.getId()%>">Update</a></td>
            <td><a href="deleteproduct?id=<%= p.getId()%>">Delete</a></td>
        </tr>
        <% } %>
    </table>
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
<%Merchant m=(Merchant)session.getAttribute("merchantinfo"); 
List<Product> products=m.getProducts();
%>

<table cellpadding="20px" border="1">
<tr>
<th>ID</th>
<th>Brand</th>
<th>Model</th>
<th>category</th>
<th>Price</th>
<th>Stocks</th>
<th>Update</th>
<th>Delete</th>
</tr>
<%for(Product p:products){ %>
<tr>
<td><%=p.getId() %></td>
<td><%=p.getBrand() %></td>
<td><%=p.getModel() %></td>
<td><%=p.getCategory() %></td>
<td><%=p.getPrice() %></td>
<td><%=p.getStock() %></td>
<td><a href="updateproduct?id=<%= p.getId()%>">update</a></td>
<td><a href="deleteproduct?id=<%= p.getId()%>">delete</a></td>
</tr>
<%} %>
</table>

</body>
</html> --%>