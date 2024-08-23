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
        <h1>Your Assigned Work Items</h1>
        <p>Welcome, <c:out value="${user.username}" />!</p> <!-- Display user name -->
        <div class="button-wrapper">
            <a href="/logout" class="btn" id="logout-btn">Logout</a>
        </div>
        
        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>Work Item ID</th>
                        <th>Work Item Name</th>
                        <th>Number of Transactions</th>
                        <th>Number of Warehouses</th>
                        <th>Priority</th>
                        <th>Work Type</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="assignedWork" items="${AssignedWork}">
                        <tr>
                            <td>${assignedWork.workitem.workid}</td>
                            <td>${assignedWork.workitem.itemname}</td>
                             <td>${assignedWork.workitem.worktype}</td>
                            <td>${assignedWork.workitem.numoftrans}</td>
                            <td>${assignedWork.workitem.numofware}</td>
                            <td>${assignedWork.workitem.priority}</td>
                            
                           
                            <td>
                                <button
                                    type="button"
                                    id="button-${assignedWork.id}"
                                    class="${assignedWork.completed ? 'completed-button' : 'default-button'}"
                                    ${assignedWork.completed ? 'disabled' : ''}
                                    onclick="completeWork(${assignedWork.id}, this)">
                                    ${assignedWork.completed ? 'Completed' : 'Complete'}
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
     <script>
        function completeWork(assignedWorkId, buttonElement) {
            // Create a form and set it to submit to the completeWork endpoint
            var form = document.createElement('form');
            form.method = 'POST';
            form.action = '/completeWork';

            var input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'assignedWorkId';
            input.value = assignedWorkId;
            form.appendChild(input);

            document.body.appendChild(form);
            form.submit();

            // Change button to 'Completed' and disable it
            buttonElement.innerText = 'Completed';
            buttonElement.className = 'completed-button';
            buttonElement.disabled = true;
        }
    </script>
</body>
</html>
