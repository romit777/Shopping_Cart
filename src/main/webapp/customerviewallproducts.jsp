<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ page import="com.jsp.shoppingcart.dto.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Products</title>
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
    button {
        padding: 8px 16px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<%
List<Product> products=(List<Product>)request.getAttribute("productslist");
%>
<div class="container">
    <h2><a href="fetchitemsfromcart"><button>View Cart</button></a></h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Brand</th>
            <th>Model</th>
            <th>Category</th>
            <th>Price</th>
            <th>Stocks</th>
            <th>Add to Cart</th>
        </tr>
        <% for(Product p : products) { %>
        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getBrand() %></td>
            <td><%= p.getModel() %></td>
            <td><%= p.getCategory() %></td>
            <td><%= p.getPrice() %></td>
            <td><%= p.getStock() %></td>
            <td><a href="additem?id=<%= p.getId()%>"><button>Add To Cart</button></a></td>
        </tr>
        <% } %>
    </table>
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
<%
List<Product> products=(List<Product>)request.getAttribute("productslist");
%>
<h2><a href="fetchitemsfromcart"><button>View Cart</button></a></h2>
<table cellpadding="20px" border="1">
<tr>
<th>ID</th>
<th>Brand</th>
<th>Model</th>
<th>category</th>
<th>Price</th>
<th>Stocks</th>
<th>Add to Cart</th>
</tr>
<%for(Product p:products){ %>
<tr>
<td><%=p.getId() %></td>
<td><%=p.getBrand() %></td>
<td><%=p.getModel() %></td>
<td><%=p.getCategory() %></td>
<td><%=p.getPrice() %></td>
<td><%=p.getStock() %></td>
<td><a href="additem?id=<%= p.getId()%>"><button>Add To Cart</button></a></td>
</tr>
<%} %>
</table>
</body>
</html> --%>