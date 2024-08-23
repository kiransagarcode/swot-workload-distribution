<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Users | CodingLab</title>
    <link rel="stylesheet" href="css/viewUsers.css">
      <style >
    .filter-wrapper {
    margin-bottom: 20px;
}

.filter-wrapper label {
    margin-right: 10px;
}

.filter-wrapper select {
    margin-right: 20px;
    padding: 5px;
}

.filter-wrapper button {
    padding: 5px 10px;
}
    </style>
  </head>
<body>
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
    <h2>View Users</h2>
    <div class="admin_buttons">
     
    </div>

    <form id="filter-form" action="/viewusers" method="get">
   <div class="filter-wrapper">
 <select id="role-filter" name="role">
                <option value="" ${empty param.role ? 'selected' : ''}>All</option>
                <option value="assistant" ${param.role == 'assistant' ? 'selected' : ''}>Assistant</option>
                <option value="joint-commissioner" ${param.role == 'joint-commissioner' ? 'selected' : ''}>Joint Commissioner</option>
                <option value="commissioner" ${param.role == 'commissioner' ? 'selected' : ''}>Commissioner</option>
            </select>

  </div>
   <button type="submit">Apply Filters</button>
</form>


    <div class="table-wrapper">
      <table>
        <thead>
          <tr>
            <th>User ID</th>
            <th>Officer Name</th>
            <th>Username</th>
            <th>Password</th>
            <th>Role</th>
            <th>Skill</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="user" items="${Users}">
            <tr>
              <td>${user.userid}</td>
              <td>${user.officername}</td>
              <td>${user.username}</td>
              <td>${user.password}</td>
              <td>${user.role}</td>
              <td><c:if test="${user.hasskill}">Yes</c:if><c:if test="${!user.hasskill}">No</c:if></td>
              <td>
                <!-- Edit Button -->
                <form action="/editUser/${user.userid}" method="get" style="display:inline;">
                  <input type="hidden" name="userid" value="${user.userid}" />
                  <button type="submit" class="btn adm_btn">Edit User</button>
                </form>
                <!-- Delete Button -->
                <form action="/deleteUser/${user.userid}" method="get" style="display:inline;">
                  <button type="submit" class="btn adm_btn">Delete User</button>
                </form>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>

  
</body>
</html>
