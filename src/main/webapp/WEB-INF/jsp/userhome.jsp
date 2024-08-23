<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pull Work Item</title>
    <link rel="stylesheet" href="css/pullWork.css">
</head>
<body>
    <div class="wrapper">
        <h1>officer Dashboard</h1>
<p>Welcome, <c:out value="${username}" />!</p> <!-- Display user name --><div class="button-wrapper">
    <a href="/logout" class="btn" id="logout-btn">Logout</a>
     <a href="${pageContext.request.contextPath}/pullwork"  class="btn" id="logout-btn">pullwork</a>
</div>
        
     
</body>
</html>
