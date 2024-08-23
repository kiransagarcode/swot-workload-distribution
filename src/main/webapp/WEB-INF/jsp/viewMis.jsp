<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MIS Report | Dashboard</title>
    <link rel="stylesheet" href="css/viewMis.css">
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
        <h2>MIS Report</h2>
<c:if test="${not empty assignedWorkItems}">
    <p>Data is being passed to the JSP.</p>
</c:if>
<c:if test="${empty assignedWorkItems}">
    <p>No data available.</p>
</c:if>
<form action="/viewmis" method="get">
    <div class="filter-wrapper">
        <label for="priority">Filter by Priority:</label>
        <select name="priority" id="priority">
            <option value="">All</option>
            <option value="High">High</option>
            <option value="Medium">Medium</option>
            <option value="Low">Low</option>
        </select>

        <label for="status">Filter by Status:</label>
        <select name="status" id="status">
            <option value="">All</option>
            <option value="completed">Completed</option>
            <option value="inprogress">In Progress</option>
        </select>

        <button type="submit">Apply Filters</button>
    </div>
</form>

        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>Work Item ID</th>
                        <th>Work Type</th>
                        <th>Assistant</th>
                        <th>Assigned Date</th>
                        <th>Completion Date</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="assignedWork" items="${assignedWorkItems}">
                        <tr>
                            <td>${assignedWork.workitem.workid}</td>
                            <td>${assignedWork.workitem.worktype}</td>
                            <td>${assignedWork.assistant.username}</td>
                            <td>${assignedWork.assignedDate}</td>
                            <td>${assignedWork.completionDate}</td>
                            <td>${assignedWork.completed ? 'Completed' : 'In Progress'}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
