<%-- <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Account" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Accounts </title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background: linear-gradient(to right, #e0eafc, #cfdef3);
        display: flex;
        flex-direction: column;
        align-items: center;
        height: 100vh;
        margin: 0;
        padding: 20px;
    }
    h1, h2 {
        color: #333;
    }
    table {
        width: 80%;
        margin: 20px 0;
        border-collapse: collapse;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
    }
    th, td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #007acc;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    tr:hover {
        background-color: #e0eafc;
    }
    a {
        color: #007acc;
        text-decoration: none;
        font-weight: bold;
    }
    a:hover {
        text-decoration: underline;
    }
    .add-button {
        background-color: #007acc;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        text-decoration: none;
        font-size: 16px;
        transition: background 0.3s ease;
    }
    .add-button:hover {
        background-color: #005f99;
        color: white;
    }
</style>
</head>
<body>
<h1>Accounts Information Page</h1>
<h2>List of the Customers</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Address</th>
        <th>Aadhar Number</th>
        <th>Gender</th>
        <th>Age</th>
        <th>Delete</th>
        <th>Update</th>
    </tr>
    <%
    List<Account> students = (List<Account>) request.getAttribute("allStudentData");
            if (students != null) {
                for (Account student : students) {
    %>
    <tr>
        <td><%= student.getId() %></td>
        <td><%= student.getFullName() %></td>
        <td><%= student.getAddress() %></td>
        <td><%= student.getAadharNO() %></td>
        <td><%= student.getGender() %></td>
        <td><%= student.getAge() %></td>
        <td><a href="delete/<%= student.getId() %>">delete</a></td>
        <td><a href="update/<%= student.getId() %>">update</a></td>
    </tr>
    <%
                }
            } else {
    %>
    <tr>
        <td colspan="9">No data exists</td>
    </tr>
    <%
            }
    %>
</table>
<a href="login" class="add-button">ADD CUSTOMER</a>
</body>
</html>

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Account" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Accounts</title>
<!-- Include AOS CSS -->
<link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" rel="stylesheet">
<style>
    body {
        font-family: 'Arial', sans-serif;
        background: linear-gradient(to right, #e0eafc, #cfdef3);
        display: flex;
        flex-direction: column;
        align-items: center;
        min-height: 100vh;
        margin: 0;
        padding: 20px;
        transition: opacity 0.5s ease;
    }
    body.fade-out {
        opacity: 0;
    }
    nav {
        width: 100%;
        background-color: #004080;
        padding: 15px 0;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
    }
    nav ul {
        list-style: none;
        display: flex;
        justify-content: center;
        padding: 0;
        margin: 0;
    }
    nav ul li {
        margin: 0 25px;
    }
    nav ul li a {
        color: white;
        text-decoration: none;
        font-size: 20px;
        font-weight: bold;
        padding: 10px 20px;
        border-radius: 5px;
        transition: background 0.3s ease;
    }
    nav ul li a:hover {
        background-color: #005f99;
    }
    h1, h2 {
        color: #333;
        text-align: center;
    }
    table {
        width: 80%;
        margin: 20px 0;
        border-collapse: collapse;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        opacity: 0;
        transform: translateY(50px);
        animation: fadeInUp 1s forwards;
    }
    th, td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #007acc;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    tr:hover {
        background-color: #e0eafc;
    }
    a {
        color: #007acc;
        text-decoration: none;
        font-weight: bold;
    }
    a:hover {
        text-decoration: underline;
    }
    .add-button {
        background-color: #007acc;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        text-decoration: none;
        font-size: 16px;
        transition: background 0.3s ease;
        display: inline-block;
        margin-top: 20px;
    }
    .add-button:hover {
        background-color: #005f99;
        color: white;
    }
    .guidelines-container {
        width: 80%;
        margin: 20px 0;
    }
    .guideline {
        background-color: #fff;
        padding: 20px;
        margin: 20px 0;
        border-radius: 10px;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        opacity: 0;
        transform: translateY(50px);
        animation: fadeInUp 1s forwards;
        transition: transform 0.3s ease, opacity 0.3s ease;
    }
    .guideline:hover {
        transform: translateY(-5px);
    }
    .guideline h3 {
        margin-top: 0;
        color: #004080;
    }
    .guideline p {
        margin: 0;
        color: #333;
    }
    .guideline ul {
        padding-left: 20px;
    }
    .guideline ul li {
        margin-bottom: 10px;
    }
    @keyframes fadeInUp {
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>
<!-- Include AOS JS -->
<script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var links = document.querySelectorAll('nav ul li a');

        links.forEach(function(link) {
            link.addEventListener('click', function(event) {
                event.preventDefault();
                document.body.classList.add('fade-out');
                setTimeout(function() {
                    window.location.href = link.href;
                }, 500); // Match with the fade-out duration
            });
        });

        // Initialize AOS
        AOS.init({
            duration: 1000, // Animation duration
            easing: 'ease-in-out', // Animation easing
            once: true, // Whether animation should happen only once - while scrolling down
        });

        // Mouse move animation
        document.addEventListener('mousemove', function(e) {
            var guidelines = document.querySelectorAll('.guideline');
            var x = (e.clientX / window.innerWidth) * 2 - 1;
            var y = (e.clientY / window.innerHeight) * 2 - 1;

            guidelines.forEach(function(guideline) {
                var depth = guideline.getAttribute('data-depth');
                var moveX = depth * x * 10;
                var moveY = depth * y * 10;

                guideline.style.transform = `translate(${moveX}px, ${moveY}px)`;
            });
        });
    });
</script>
</head>
<body>
<nav>
    <ul>
        <li><a href="">Home</a></li>
        <li><a href="">About</a></li>
        <li><a href="">Contact</a></li>
    </ul>
</nav>
<h1>Accounts Information Page</h1>
<h2>List of the Customers</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Address</th>
        <th>Aadhar Number</th>
        <th>Gender</th>
        <th>Age</th>
        <th>Delete</th>
        <th>Update</th>
    </tr>
    <%
    List<Account> students = (List<Account>) request.getAttribute("allStudentData");
    if (students != null) {
        for (Account student : students) {
    %>
    <tr>
        <td><%= student.getId() %></td>
        <td><%= student.getFullName() %></td>
        <td><%= student.getAddress() %></td>
        <td><%= student.getAadharNO() %></td>
        <td><%= student.getGender() %></td>
        <td><%= student.getAge() %></td>
        <td><a href="delete/<%= student.getId() %>">delete</a></td>
        <td><a href="update/<%= student.getId() %>">update</a></td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="8">No data exists</td>
    </tr>
    <%
    }
    %>
</table>
<a href="login" class="add-button">ADD CUSTOMER</a>
<div class="guidelines-container">
    <div class="guideline" data-aos="fade-up" data-depth="0.2">
        <h3>Confidentiality</h3>
        <p>Always keep your account details confidential. Avoid sharing your password or PIN with anyone.</p>
        <ul>
            <li>Keep your banking information secure and private.</li>
            <li>Do not disclose your password or PIN to anyone.</li>
            <li>Be cautious of phishing scams and suspicious emails.</li>
            <li>Regularly update your password and security questions.</li>
            <li>Ensure that your contact information is up-to-date.</li>
            <li>Monitor your account activity regularly for any unauthorized transactions.</li>
            <li>Report any suspicious activity to your bank immediately.</li>
            <li>Use secure connections when accessing your account online.</li>
            <li>Do not store sensitive information on shared or public devices.</li>
            <li>Enable two-factor authentication for an extra layer of security.</li>
        </ul>
    </div>
    <div class="guideline" data-aos="fade-up" data-aos-delay="100" data-depth="0.4">
        <h3>Account Updates</h3>
        <p>Ensure that your contact information is up-to-date to receive important notifications.</p>
        <ul>
            <li>Regularly update your address and contact details with the bank.</li>
            <li>Check your email and phone number for accuracy.</li>
            <li>Sign up for electronic statements to stay informed.</li>
            <li>Maintain an updated list of authorized signatories for business accounts.</li>
            <li>Check for any discrepancies in your account statements regularly.</li>
            <li>Update your account information promptly if there are changes.</li>
            <li>Ensure your bank has your correct mobile number for OTPs.</li>
            <li>Opt-in for email notifications for transaction alerts.</li>
            <li>Use online banking to update your details as needed.</li>
            <li>Review your account settings periodically for accuracy.</li>
        </ul>
    </div>
    <div class="guideline" data-aos="fade-up" data-aos-delay="200" data-depth="0.6">
        <h3>Transaction Monitoring</h3>
        <p>Regularly monitor your account for any unauthorized transactions and report them immediately.</p>
        <ul>
            <li>Review your account statements at least once a month.</li>
            <li>Set up alerts for large or unusual transactions.</li>
            <li>Report any unauthorized transactions to your bank immediately.</li>
            <li>Be aware of your bank's fraud detection services.</li>
            <li>Consider enrolling in transaction monitoring services for added security.</li>
            <li>Be cautious of any unsolicited requests for personal or account information.</li>
            <li>Keep track of your spending and identify any unusual activity.</li>
            <li>Regularly update your contact information to receive transaction alerts.</li>
            <li>Use secure passwords and change them regularly.</li>
            <li>Monitor your credit report for any suspicious activity.</li>
        </ul>
    </div>
    <div class="guideline" data-aos="fade-up" data-aos-delay="300" data-depth="0.8">
        <h3>Card Security</h3>
        <p>Report lost or stolen cards immediately to prevent unauthorized use.</p>
        <ul>
            <li>Keep your debit and credit cards in a safe place.</li>
            <li>Report lost or stolen cards to your bank immediately.</li>
            <li>Do not share your card details with untrusted sources.</li>
            <li>Use chip-enabled cards for added security.</li>
            <li>Monitor your card transactions regularly.</li>
            <li>Be cautious when using your card at ATMs or POS terminals.</li>
            <li>Do not write down your card PIN.</li>
            <li>Enable transaction alerts for your cards.</li>
            <li>Use virtual card numbers for online transactions when available.</li>
            <li>Set transaction limits on your cards for added security.</li>
        </ul>
    </div>
    <div class="guideline" data-aos="fade-up" data-aos-delay="400" data-depth="1">
        <h3>Password Protection</h3>
        <p>Use strong passwords and change them regularly. Avoid using easily guessed information.</p>
        <ul>
            <li>Create strong and unique passwords for your online accounts.</li>
            <li>Change your passwords regularly and do not reuse them across multiple sites.</li>
            <li>Use a combination of letters, numbers, and special characters in your passwords.</li>
            <li>Avoid using easily guessed information such as birthdays or names.</li>
            <li>Enable two-factor authentication for added security.</li>
            <li>Do not share your passwords with anyone.</li>
            <li>Be cautious of phishing scams and suspicious emails asking for your password.</li>
            <li>Use a reputable password manager to store and generate passwords.</li>
            <li>Regularly review and update your security questions and answers.</li>
            <li>Monitor your accounts for any suspicious login attempts.</li>
        </ul>
    </div>
    <div class="guideline" data-aos="fade-up" data-aos-delay="500" data-depth="1.2">
        <h3>Two-Factor Authentication</h3>
        <p>Enable two-factor authentication for an extra layer of security on your account.</p>
        <ul>
            <li>Enable two-factor authentication (2FA) on your online banking accounts.</li>
            <li>Choose the most secure method of 2FA available, such as an authenticator app.</li>
            <li>Be aware of the backup options available if you lose access to your 2FA device.</li>
            <li>Regularly review your 2FA settings and update them as needed.</li>
            <li>Do not share your 2FA codes with anyone.</li>
            <li>Be cautious of phishing scams asking for your 2FA codes.</li>
            <li>Enable 2FA on all your online accounts, not just banking.</li>
            <li>Keep your 2FA recovery codes in a secure place.</li>
            <li>Use a different 2FA method for each account if possible.</li>
            <li>Regularly monitor your account activity for any unauthorized access attempts.</li>
        </ul>
    </div>
</div>
</body>
</html>
