<?php

try
{
    $conn = new PDO("mysql:host=localhost;dbname=test", "root", "");

    $conn -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}catch(PDOException $e)
{
    echo ("Error connecting to database... <br>" . $e -> getMessage());
}


?>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Home</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css">
    <!-- Bootstrap Icons CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
</head>
<style>
    body
    {
        font-size: 1rem;
    }
    .container-fluid h1:first-child span
    {
        color: #D28425;
    }
    .justify-content-end
    {
        margin-right: 10%;
    }
    .table th, .table td
    {
        padding-left: 30px !important;
        padding-right: 30px !important;
    }
</style>
<body>
<div class="container-fluid">
        <h1 class="display-3 text-center">User: <span id="headingUsername"></span></h1>
        <div class="d-flex justify-content-end">
            <button class="btn btn-primary me-6" id="logout">Log Out</button>
        </div>
        <div class="row mt-2">
            <!-- Search Users query -->
            <div class="col">
                <div class="d-flex justify-content-end">
                    <a href="/LoginAction/templates/dashboard.html" class="btn btn-primary btn-md" id="viewAllUsers">
                        <span class="bi bi-arrow-bar-left me-2"></span>Dashboard
                    </a>
                </div>
            </div>
            <div class="col-6 d-flex justify-content-center">
                <button class="btn btn-primary ms-4" name="inner" id="inner">INNER JOIN</button>
                <button class="btn btn-primary ms-4" name="left" id="left">LEFT JOIN</button>
                <button class="btn btn-primary ms-4" name="right" id="right">RIGHT JOIN</button>
            </div>
            <div class="col"></div>
        </div>
    </div>
    <div class="container mt-4">
        <table class="table caption-top" id="table">
            <caption>Table Name: Employees</caption>
            <?php
            
            $query = "SELECT employeeID, first_name, last_name,  birthdate FROM employees WHERE employeeID < 11;";
            if($result = $conn -> query($query))
            {

                if($result -> rowCount() > 0)
                {
                    echo "<thead class='table-dark'>";
                        echo "<tr class=\"table-header-row\">";
                            echo "<th>Employee ID</th>";
                            echo "<th>First Name</th>";
                            echo "<th>Last Name</th>";
                            echo "<th>Birthdate</th>";
                        echo "</tr>";
                    echo "</thead>";
                    echo "<tbody>";
                        while($row = $result -> fetch(PDO::FETCH_ASSOC))
                        {
                            echo "<tr class=\"table-data-row\">";
                                echo "<td>" . $row['employeeID'] . "</td>";
                                echo "<td>" . $row['first_name'] . "</td>";
                                echo "<td>" . $row['last_name'] . "</td>";
                                echo "<td>" . $row['birthdate'] . "</td>";
                            echo "</tr>";
                        }
                    echo "</tbody>";
                }else
                {
                    echo ("<div class=\"alert alert-danger\"><em>No Records Found!</em></div>");
                }
            }else
            {
                echo ("<div class=\"alert alert-danger\" style=\"font-size: 1.3rem;\"> Error connecting to Database. Please try again!</div>");
            }
            ?>
        </table>
        <!-- Table 2 -->
        <table class="table caption-top tables" >
            <caption>Table Name: Customers</caption>
            <?php
            
            $query = "SELECT customerID, customer_name, address, country FROM customers WHERE customerID < 11;";
            if($result = $conn -> query($query))
            {

                if($result -> rowCount() > 0)
                {
                    echo "<thead class='table-dark'>";
                        echo "<tr>";
                            echo "<th>Employee ID</th>";
                            echo "<th>Name</th>";
                            echo "<th>Address</th>";
                            echo "<th>Country</th>";
                        echo "</tr>";
                    echo "</thead>";
                    echo "<tbody>";
                        while($row = $result -> fetch(PDO::FETCH_ASSOC))
                        {
                            echo "<tr>";
                                echo "<td>" . $row['customerID'] . "</td>";
                                echo "<td>" . $row['customer_name'] . "</td>";
                                echo "<td>" . $row['address'] . "</td>";
                                echo "<td>" . $row['country'] . "</td>";
                            echo "</tr>";
                        }
                    echo "</tbody>";
                }else
                {
                    echo ("<div class=\"alert alert-danger\"><em>No Records Found!</em></div>");
                }
            }else
            {
                echo ("<div class=\"alert alert-danger\" style=\"font-size: 1.3rem;\"> Error connecting to Database. Please try again!</div>");
            }
            ?>
        </table>
        <table class="table caption-top tables">
            <caption>Table Name: Orders</caption>
            <?php
            
            $query = "SELECT orderID, customerID, employeeID, shipperID FROM orders WHERE orderID < 10258;";
            if($result = $conn -> query($query))
            {
                if($result -> rowCount() > 0)
                {
                    echo "<thead class='table-dark'>";
                        echo "<tr>";
                        echo "<th>#</th>";
                        echo "<th>Order Id</th>";
                        echo "<th>Customer Id</th>";
                        echo "<th>Employee Id</th>";
                            echo "<th>Shipper Id</th>";
                        echo "</tr>";
                    echo "</thead>";
                    echo "<tbody>";
                        $i = 1;
                        while($row = $result -> fetch(PDO::FETCH_ASSOC))
                        {
                            echo "<tr>";
                                echo "<td>" . $i . "</td>";
                                echo "<td>" . $row['orderID'] . "</td>";
                                echo "<td>" . $row['customerID'] . "</td>";
                                echo "<td>" . $row['employeeID'] . "</td>";
                                echo "<td>" . $row['shipperID'] . "</td>";
                            echo "</tr>";
                            $i++;
                        }
                    echo "</tbody>";
                }else
                {
                    echo ("<div class=\"alert alert-danger\"><em>No Records Found!</em></div>");
                }
            }else
            {
                echo ("<div class=\"alert alert-danger\" style=\"font-size: 1.3rem;\"> Error connecting to Database. Please try again!</div>");
            }
            ?>
        </table>
    </div>





    <!-- Jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" ></script>
    <script src="../templates/scripts/dashboard.js"></script>
</body>
</html>