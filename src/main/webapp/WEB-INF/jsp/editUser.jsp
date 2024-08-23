<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userManagementForm.css">
</head>
<body>
    <div class="wrapper">
        <h2>Edit User</h2>

        <%-- Debugging information --%>
        <c:if test="${not empty user}">
            <p>User ID: <c:out value="${user.userid}" /></p>
            <p>User Name: <c:out value="${user.username}" /></p>
        </c:if>
        <c:if test="${empty user}">
            <p>User object is empty.</p>
        </c:if>

        <form action="/updateUser" method="post">
            <input type="hidden" name="userid" value="${user.userid}">
            <div class="input-box">
                <input type="text" id="officer-name" placeholder="Officer name" name="officername" value="${user.officername}" required>
            </div>
            <div class="input-box">
                <input type="text" placeholder="Username" name="username" value="${user.username}" required>
            </div>
            <div class="input-box">
                <input type="password" placeholder="Password" name="password" value="${user.password}" required>
            </div>
            <div class="input-box">
                <select id="role" name="role" required>
                    <option value="" disabled>Select Role</option>
                    <option value="assistant" ${user.role == 'assistant' ? 'selected' : ''}>Assistant</option>
                    <option value="joint-commissioner" ${user.role == 'joint-commissioner' ? 'selected' : ''}>Joint Commissioner</option>
                    <option value="commissioner" ${user.role == 'commissioner' ? 'selected' : ''}>Commissioner</option>
                </select>
            </div>
            <div class="checkbox">
                <input type="checkbox" id="hasskill" name="hasskill" ${user.hasskill ? 'checked' : ''}>
                <label for="hasskill">Has skill</label>
            </div>
            <div class="input-box button-group">
                <input type="submit" value="Update">
                <input type="button" value="Cancel" onclick="location.href='${pageContext.request.contextPath}/viewUsers';">
            </div>
        </form>
    </div>
</body>
</html>
