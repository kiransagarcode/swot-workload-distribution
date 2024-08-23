<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/loginstyle.css">
    <title>Login</title>
   </head>
<body>
  <div class="wrapper">
    <h2>Welcome back officer</h2>
    <form action="/login" method="post">
     <input type="text" name="dummyUsername" id="dummyUsername" style="display:none;">
    <input type="password" name="dummyPassword" id="dummyPassword" style="display:none;">
      <div class="input-box">
        <input type="text" placeholder="Enter your Username" name="username" required>
      </div>
      
      <div class="input-box">
        <input type="password" placeholder="Enter your password" name="password" required>
      </div> 
      
       <div class="input-box button-group">
     
      <button type="submit" class="btn adm_btn">Login </button>
     
      </div>
      
      <!-- Display error message if login fails -->
      <c:if test="${not empty error}">
        <div class="alert alert-danger">
          <p style="color: red;">${error}</p>
        </div>
      </c:if>
    </form>
  </div>
</body>
</html>
