<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f7f7f7;
        margin: 0;
        padding: 0;
    }
    .container {
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
    form {
        margin-top: 20px;
    }
    label {
        display: block;
        margin-bottom: 5px;
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
<div class="container">
    <h1>${msg}</h1>
    <form:form action="saveproduct" modelAttribute="productobj">
        <label for="brand">Enter Brand:</label>
        <form:input path="brand" id="brand" required="required"/><br>
        <label for="category">Enter Category:</label>
        <form:input path="category" id="category" required="required"/><br>
        <label for="model">Enter Model:</label>
        <form:input path="model" id="model" required="required"/><br>
        <label for="price">Enter Price:</label>
        <form:input path="price" id="price" required="required"/><br>
        <label for="stock">Enter Stock:</label>
        <form:input path="stock" id="stock" required="required"/><br>
        <input type="submit" value="Add Product">
    </form:form>
</div>
</body>
</html>



<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>${msg}</h1>
<form:form action="saveproduct" modelAttribute="productobj">
Enter Brand : <form:input path="brand"/><br>
Enter Category: <form:input path="category"/><br>
Enter Model : <form:input path="model"/><br>
Enter Price : <form:input path="price"/><br>
Enter Stock : <form:input path="stock"/><br>
<input type="submit" value="Add Product">
</form:form>

</body>
</html> --%>