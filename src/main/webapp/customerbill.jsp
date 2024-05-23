<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ page import="com.jsp.shoppingcart.dto.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Bill</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        margin: 0;
        padding: 0;
        text-align: center;
    }
    h1 {
        color: #007bff;
        margin-top: 20px;
    }
    h2 {
        margin-top: 10px;
        color: #333;
    }
    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
    }
    th, td {
        padding: 10px;
        border: 1px solid #ccc;
    }
    th {
        background-color: #f2f2f2;
    }
</style>
</head>
<body>
<h1>${msg}</h1>
<%
    Orders orders=(Orders)request.getAttribute("orderdetails");
    List<Item> items=orders.getItems();
%>
<h2>Receiver's Name : <%= orders.getName() %> <br>
Receiver's Address : <%= orders.getAddress() %> <br>
Receiver's Mobile Number : <%= orders.getMobilenumber() %> <br>
</h2>
<table>
<tr>
<th>Brand</th>
<th>Model</th>
<th>Category</th>
<th>Price</th>
<th>Quantity</th>
</tr>
<% for(Item i:items){ %>
<tr>
<td><%= i.getBrand() %></td>
<td><%= i.getModel() %></td>
<td><%= i.getCategory() %></td>
<td><%= i.getPrice() %></td>
<td><%= i.getQuantity() %></td>
</tr>
<% } %>
</table>
<h2>Total Price : <%= orders.getTotal_price() %></h2>
</body> 
</html>


<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ page import="com.jsp.shoppingcart.dto.*" %>
      <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>${msg}</h1>
<%
Orders orders=(Orders)request.getAttribute("orderdetails");
List<Item> items=orders.getItems();
%>
<h2>Receiver's Name : <%= orders.getName() %> <br>
Receiver's Address : <%= orders.getAddress() %> <br>
Receiver's Mobile Number : <%= orders.getMobilenumber() %> <br>
</h2>
<table cellpadding="20px" border="1">
<tr>
<th>Brand</th>
<th>Model</th>
<th>category</th>
<th>Price</th>
<th>Quantity</th>
</tr>
<%for(Item i:items){ %>
<tr>
<td><%=i.getBrand()%></td>
<td><%=i.getModel() %></td>
<td><%=i.getCategory() %></td>
<td><%=i.getPrice() %></td>
<td><%=i.getQuantity() %></td>
</tr>
<%} %>
<h2>Total Price : <%= orders.getTotal_price() %></h2>
</table>

</body>
</html> --%>