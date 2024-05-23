<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Registration</title>
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
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
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
<form:form action="savecustomer" modelAttribute="customerobj">
    <h2>Customer Registration</h2>
    <label>Enter Name :</label><br>
    <form:input path="name" required="required"/><br>
    <label>Enter Address :</label><br>
    <form:input path="address" required="required"/><br>
    <label>Enter Mobile Number :</label><br>
    <form:input path="mobile" required="required"/><br>
    <label>Enter Email :</label><br>
    <form:input path="email" required="required"/><br>
    <label>Enter Password :</label><br>
    <form:input path="password" type="password" required="required"/><br>
    <input type="submit" value="Register">
</form:form>
</body>
</html>


<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form:form action="savecustomer" modelAttribute="customerobj">
Enter Name : <form:input path="name"/><br>
Enter Address : <form:input path="address"/><br>
Enter Mobile Number : <form:input path="mobile"/><br>
Enter Email : <form:input path="email"/><br>
Enter Password : <form:input path="password"/><br>
<input type="submit" value="Register">

</form:form>
</body>
</html> --%>