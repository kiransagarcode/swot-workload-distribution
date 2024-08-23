<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Registration or Sign Up form in HTML CSS | CodingLab </title> 
    <link rel="stylesheet" href="css/userManagementForm.css">
   </head>
<body>
 <!-- Go Back to Home Button -->
  <a href="${pageContext.request.contextPath}/admindash" style="
    position: absolute;
    top: 20px;
    left: 20px;
    padding: 10px 20px;
    background-color: #28a745; /* Green color */
    color: white;
    text-decoration: none;
    border-radius: 20px; /* Bulgy effect */
    box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.2); /* Shadow for depth */
    font-weight: bold;
    font-size: 14px;
    transition: background-color 0.3s ease;
  "> Home</a>
  <div class="wrapper">
    <h2> user management</h2>
     <c:if test="${not empty message}">
            <div class="alert alert-success">
                ${message}
            </div>
        </c:if>
  <form action="/adduser" method="post" autocomplete="off">
    <div class="input-box">
        <input type="text" id="officer-name" placeholder="Officer name" name="officername" required autocomplete="off">
    </div>
    <input type="text" name="dummyUsername" id="dummyUsername" style="display:none;">
    <input type="password" name="dummyPassword" id="dummyPassword" style="display:none;">
    <div class="input-box">
        <input type="text" placeholder="Username" name="username" required autocomplete="off">
    </div> 
    <div class="input-box">
        <input type="password" placeholder="Create password" name="password" required autocomplete="off">
    </div>
    <div class="input-box">
        <select id="role" name="role" required>
            <option value="" disabled selected>Select Role</option>
            <option value="assistant">Assistant</option>
            <option value="joint-commissioner">Joint Commissioner</option>
            <option value="commissioner">Commissioner</option>
        </select>
    </div>
    <div class="checkbox">
        <input type="checkbox" id="hasskill" name="hasskill">
        <label for="hasskill">Has skill</label>
    </div>
    <div class="input-box button-group">
        <input type="submit" value="Create">
        <input type="button" value="Edit">
        <input type="button" value="Delete">
    </div>
</form>

  </div>
</body>
</html>
