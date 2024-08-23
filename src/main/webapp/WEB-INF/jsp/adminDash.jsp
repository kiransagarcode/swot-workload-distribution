<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | CodingLab</title>
    <link rel="stylesheet" href="css/adminDash.css">
    <style >
    .wrapper {
    position: relative;
    max-width: 1200px;
    width: 100%;
    background: #fff;
    padding: 34px;
    border-radius: 6px;
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
}

.status-wrapper {
    display: flex;
    justify-content: space-around;
    margin-top: 20px;
}

.status-box {
    text-align: center;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 6px;
    background-color: #f9f9f9;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.number {
    font-size: 24px;
    font-weight: bold;
    margin-top: 10px;
    
}
    </style>
  </head>
<body>
 <a href="/logout" class="btn" id="logout-btn"style="
    position: absolute;
    top: 20px;
    left: 20px;" >Logout</a>
  <div class="wrapper">
     
  
    <h2>Welcome Admin </h2>
    <div class="admin_buttons">
      <a href="${pageContext.request.contextPath}/addUser" class="btn admin_btn">Add User</a>
      <a href="${pageContext.request.contextPath}/viewusers" class="btn admin_btn">View Users</a>
      <a href="${pageContext.request.contextPath}/addwork" class="btn admin_btn">Add Work Item</a>
      <a href="${pageContext.request.contextPath}/viewAssignedWork" class="btn admin_btn">Distributed Work</a>
      <a href="${pageContext.request.contextPath}/viewmis" class="btn admin_btn">View MIS Report</a>
    </div>

    

 
   <div class="status-wrapper">
        <div class="status-box">
            <p style="color:green;">Total</p>
            <div class="number" id="total" style="color:red;">${totalCount}</div>
        </div>
        <div class="status-box">
            <p>Assigned</p>
            <div class="number" id="assigned"style="color:yellow;">${assignedCount}</div>
        </div>
        <div class="status-box">
            <p>Completed</p>
            <div class="number" id="completed"style="color:green;">${completedCount}</div>
        </div>
    </div>

   
  </div>

  <script>
   
  </script>
</body>
</html>
