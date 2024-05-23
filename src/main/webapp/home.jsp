<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopping Cart</title>
<style>
    /* Styles for h2 */
    h2 {
        margin-top: 20px;
    }

    /* Styles for buttons */
    a.button {
        display: inline-block;
        padding: 10px 20px;
        margin: 10px;
        text-decoration: none;
        color: #fff;
        background-color: #007bff;
        border: 1px solid #007bff;
        border-radius: 5px;
    }

    /* Hover effect for buttons */
    a.button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<h2>${deletemsg}</h2>
<h1><a href="menu.jsp" class="button">Merchant</a></h1><br>
<h1><a href="Customermenu.jsp" class="button">Customer</a></h1>
</body>
</html>


<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopping Cart</title>
 <link rel="stylesheet" href="homestyle.css">
</head>
<body>
<h2>${deletemsg}</h2>
<h1><a href="menu.jsp">Merchant</a></h1><br>
<h1><a href="Customermenu.jsp">Customer</a></h1>
</body>
</html> --%>