<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Registration Form</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background: linear-gradient(to right, #74ebd5, #acb6e5);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    form {
        background: white;
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
    }
    input[type="text"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
        font-size: 16px;
    }
    input[type="text"]:focus {
        border-color: #74ebd5;
        box-shadow: 0 0 8px 0 #74ebd5;
        outline: none;
    }
    button {
        width: 100%;
        padding: 10px;
        background: #74ebd5;
        border: none;
        border-radius: 5px;
        color: white;
        font-size: 18px;
        cursor: pointer;
        transition: background 0.3s ease;
    }
    button:hover {
        background: #acb6e5;
    }
</style>
</head>
<body>
<form action="loginform" method="post">
    <input type="text" placeholder="Enter  Id" name="id"><br><br>
    <input type="text" placeholder="Enter Full Name" name="fullName"><br><br>
    <input type="text" placeholder="Enter Address" name="address"><br><br>
    <input type="text" placeholder="Enter Aadhar Number" name="aadharNO"><br><br>
    
    <label for="gender">Gender:</label>
    <select id="gender" name="gender">
        <option value="male">Male</option>
        <option value="female">Female</option>
        <option value="other">Other</option>
    </select><br><br>
    
    <input type="text" placeholder="Enter Age" name="age"><br><br>
    
    <button type="submit">REGISTER</button>
</form>

</body>
</html>
