<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Work Assigned | Dashboard</title>
    <link rel="stylesheet" href="css/workAssigned.css">
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
        <h2>Work Assigned</h2>

        <form id="filter-form" action="${pageContext.request.contextPath}/viewAssignedWork" method="get">
            <div class="input-box">
                <select id="work-type" name="workType">
                    <option value="" ${empty workType ? 'selected' : ''}>Filter by Work Type</option>
                    <option value="registration" ${workType == 'registration' ? 'selected' : ''}>Registration</option>
                    <option value="refund-processing" ${workType == 'refund-processing' ? 'selected' : ''}>Refund Processing</option>
                    <option value="cst-declaration" ${workType == 'cst-declaration' ? 'selected' : ''}>CST Declaration</option>
                </select>
            </div>
            <div class="input-box">
                <select id="priority" name="priority">
                    <option value="" ${empty priority ? 'selected' : ''}>Filter by Priority</option>
                    <option value="low" ${priority == 'low' ? 'selected' : ''}>Low</option>
                    <option value="medium" ${priority == 'medium' ? 'selected' : ''}>Medium</option>
                    <option value="high" ${priority == 'high' ? 'selected' : ''}>High</option>
                </select>
            </div>
            <div class="input-box button">
                <input type="submit" value="Filter">
            </div>
        </form>

        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>Work Item ID</th>
                        <th>Work Item Type</th>                        
                        <th>Work Item Name</th>
                        <th>Assistant</th>
                        <th>Priority</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="assignedWork" items="${assignedWorkItems}">
                        <tr>
                            <td>${assignedWork.workitem.workid}</td>
                            <td>${assignedWork.workitem.worktype}</td>
                            <td>${assignedWork.workitem.itemname}</td>
                            <td>${assignedWork.assistant.username}</td>
                            <td>${assignedWork.workitem.priority}</td>
                            <td>${assignedWork.assigned ? 'Assigned' : 'Unassigned'}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
