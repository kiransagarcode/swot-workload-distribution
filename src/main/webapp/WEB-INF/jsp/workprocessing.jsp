<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Work Item Form</title>
    <link rel="stylesheet" href="css/workitem.css">
</head>
<body>
<div class="wrapper">
    <h2>Work Item Form</h2>
    <c:if test="${not empty message}">
            <div class="alert alert-success">
                ${message}
            </div>
        </c:if>
    <form action="/addwork" method="post"> <!-- Updated action URL -->
       
        <div class="input-box">
            <select id="work-type" name="worktype" required> <!-- Updated name to match entity field -->
                <option value="" disabled selected>Work Type</option>
                <option value="registration">Registration</option>
                <option value="refund-processing">Refund Processing</option>
                <option value="cst-declaration">CST Declaration</option>
            </select>
        </div>
        <div class="input-box">
            <input type="text" id="description" placeholder="Description" name="itemname" required> <!-- Updated name to match entity field -->
        </div>
        <div class="input-box">
            <input type="number" id="num-transactions" placeholder="Number of Transactions" name="numoftrans" required>
        </div>
        <div class="input-box">
            <input type="number" id="num-warehouse" placeholder="Number of Warehouse" name="numofware" required>
        </div>
        <div class="checkbox">
            <input type="checkbox" id="requires-skill" name="skill"> <!-- Ensure correct field name for boolean value -->
            <label for="requires-skill">Requires skill</label>
        </div>
        <div class="priority-group">
            <label>Priority:</label>
            <div class="checkbox">
              <input type="radio" id="priority-high" name="priority" value="high">
              <label for="priority-high">High</label>
         
              <input type="radio" id="priority-medium" name="priority" value="medium">
              <label for="priority-medium">Medium</label>
          
              <input type="radio" id="priority-low" name="priority" value="low">
              <label for="priority-low">Low</label>
            </div>
        </div>
        <div class="input-box button-group">
            <input type="submit" value="Add Work Item">
            <input type="reset" value="Reset">
        </div>
    </form>
</div>
</body>
</html>
