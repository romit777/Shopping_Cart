<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Merchant Registration</title>
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
    input[type="text"],
    input[type="password"] {
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
    <h1>Merchant Registration</h1>
    <form:form action="savemerchant" modelAttribute="merchantobj">
        <label for="name">Enter Name :</label>
        <form:input path="name" id="name"/><br>
        <label for="mobilenumber">Enter Mobile Number :</label>
        <form:input path="mobilenumber" id="mobilenumber"/><br>
        <label for="email">Enter Email :</label>
        <form:input path="email" id="email"/><br>
        <label for="password">Enter Password :</label>
        <form:input path="password" id="password" type="password"/><br>
        <input type="submit" value="Register">
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

<form:form action="savemerchant" modelAttribute="merchantobj">
Enter Name : <form:input path="name"/><br>
Enter Mobile Number : <form:input path="mobilenumber"/><br>
Enter Email : <form:input path="email"/><br>
Enter Password : <form:input path="password"/><br>
<input type="submit" value="Register">
</form:form>
</body>
</html> --%>