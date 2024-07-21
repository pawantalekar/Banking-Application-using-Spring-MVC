<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.model.Account" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Account Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 0;
        }
        
        form {
            background-color: #fff;
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border: 1px solid #ccc;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }
        
        input[type="text"], select {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        
        button {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        
        button:hover {
            background-color: #0056b3;
        }
        
        h1 {
            text-align: center;
            color: #333;
        }
    </style>
</head>
<body>
    <% 
    Account account = (Account) request.getAttribute("student");
    String contextPath = request.getContextPath();
    %>
    
    <form action="<%= contextPath %>/update/updateform" method="post">
        <input type="hidden" name="id" value="<%= account.getId() %>">
        
        <label for="name">Account Name:</label><br>
        <input type="text" id="name" name="fullName" value="<%= account.getFullName() %>"><br><br>
        
        <label for="address">Address:</label><br>
        <input type="text" id="address" name="address" value="<%= account.getAddress() %>"><br><br>
        
        <label for="aadharNO">Aadhar Number:</label><br>
        <input type="text" id="aadharNO" name="aadharNO" value="<%= account.getAadharNO() %>"><br><br>
        
        <label for="gender">Gender:</label><br>
        <select id="gender" name="gender">
            <option value="male" <%= account.getGender().equals("male") ? "selected" : "" %>>Male</option>
            <option value="female" <%= account.getGender().equals("female") ? "selected" : "" %>>Female</option>
            <option value="other" <%= account.getGender().equals("other") ? "selected" : "" %>>Other</option>
        </select><br><br>
        
        <label for="age">Age:</label><br>
        <input type="text" id="age" name="age" value="<%= account.getAge() %>"><br><br>
        
        <button type="submit">UPDATE</button>
    </form>
</body>
</html>
