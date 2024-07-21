<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account Details</title>
</head>
<body>
    <h1>Success</h1>
    <h2>Account Details</h2>
    <%
        com.model.Account account = (com.model.Account) request.getAttribute("singleData");
        if (account == null) {
    %>
        <p>No account data available.</p>
    <%
        } else {
    %>
        <table border="1">
            <tr>
                <th>Property</th>
                <th>Value</th>
            </tr>
            <tr>
                <td>ID</td>
                <td><%= account.getId() %></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><%= account.getFullName() %></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><%= account.getAddress() %></td>
            </tr>
            <tr>
                <td>Aadhar Number</td>
                <td><%= account.getAadharNO() %></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td><%= account.getGender() %></td>
            </tr>
            <tr>
                <td>Age</td>
                <td><%= account.getAge() %></td>
            </tr>
            
        </table>
    <%
        }
    %>
</body>
</html>
