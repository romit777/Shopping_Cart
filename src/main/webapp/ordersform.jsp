<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page import="com.jsp.shoppingcart.dto.*" %>
<%@ page import="java.util.*" %> 

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Place Order</title>
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
    <% Orders o = (Orders) request.getAttribute("ordersobj"); %>
    <form:form action="saveorder" modelAttribute="ordersobj">
        <h1>Place Order</h1>
        <label for="name">Enter Name:</label>
        <form:input path="name" id="name" required="required"/><br>
        <label for="address">Enter Address:</label>
        <form:input path="address" id="address" required="required"/><br>
        <label for="mobilenumber">Enter Mobile Number:</label>
        <form:input path="mobilenumber" id="mobilenumber" required="required"/><br>
        <label for="total_price">Total Price:</label>
        <form:input path="total_price" id="total_price" value="<%= o.getTotal_price()%>" required="required"/><br>
        <input type="submit" value="Place the Order">
    </form:form>
</body>
</html>

<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
      <%@ page import="com.jsp.shoppingcart.dto.*" %>
      <%@ page import="java.util.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%Orders o=(Orders)request.getAttribute("ordersobj"); %>
<form:form action="saveorder" modelAttribute="ordersobj">
Enter Name : <form:input path="name"/><br>
Enter Address : <form:input path="address"/><br>
Enter Mobile Number : <form:input path="mobilenumber"/><br>
Total Price :<form:input path="total_price" value="<%= o.getTotal_price()%>"/><br>

<input type="submit" value="Place the Order">

</form:form>

</body>
</html> --%>