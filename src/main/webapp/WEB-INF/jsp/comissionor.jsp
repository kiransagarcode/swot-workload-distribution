<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Work Item Status Page | CodingLab </title> 
    <link rel="stylesheet" href="css/comDash.css">
   </head>
<body>
  <div class="wrapper">
    <h2>Commissioner-dashboard</h2>
    <form id="filter-form">
      <div class="input-box">
        <select id="work-type" required>
          <option value="" disabled selected>Filter by Work Type</option>
          <option value="registration">Registration</option>
          <option value="refund-processing">Refund Processing</option>
          <option value="cst-declaration">CST Declaration</option>
        </select>
      </div>
      <div class="input-box">
        <select id="status" required>
          <option value="" disabled selected>Filter by Status</option>
          <option value="assigned">Assigned</option>
          <option value="in-progress">In Progress</option>
          <option value="completed">Completed</option>
        </select>
      </div>
      <div class="input-box">
        <select id="priority" required>
          <option value="" disabled selected>Filter by Priority</option>
          <option value="low">Low</option>
          <option value="medium">Medium</option>
          <option value="high">High</option>
        </select>
      </div>
      <div class="input-box button">
        <input type="submit" value="Filter">
      </div>
    </form>
    <div class="status-wrapper">
      <div class="status-box">
        <p>Assigned</p>
        <div class="percent" id="percent-assigned">0%</div>
      </div>
      <div class="status-box">
        <p>In Progress</p>
        <div class="percent" id="percent-in-progress">0%</div>
      </div>
      <div class="status-box">
        <p>Completed</p>
        <div class="percent" id="percent-completed">0%</div>
      </div>
    </div>
    <div class="table-wrapper">
      <table>
        <thead>
          <tr>
            <th>Work Item ID</th>
            <th>Description</th>
            <th>Assigned To</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          <!-- Example rows; you can replace these with dynamic rows from your server -->
          <tr>
            <td>1</td>
            <td>Registration</td>
            <td>Officer A</td>
            <td>Completed</td>
          </tr>
          <tr>
            <td>2</td>
            <td>Refund Processing</td>
            <td>Officer B</td>
            <td>In Progress</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
  <script>
    document.getElementById('filter-form').addEventListener('submit', function(e) {
      e.preventDefault();
      // Add your filtering and percentage calculation logic here
    });
  </script>
</body>
</html>
