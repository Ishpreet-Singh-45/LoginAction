<?php

try
{
    $conn = new PDO("mysql:host=localhost;dbname=test", "root", "");

    $conn -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}catch(PDOException $e)
{
    echo ("Error connecting to database... <br>" . $e -> getMessage());
}
    
// $_REQUEST['left'] = "left"; // debugging purposes
$rowData = [];


if(isset($_REQUEST['inner']))
{
    $query = "SELECT orders.orderID, customers.customer_name FROM orders INNER JOIN customers ON orders.customerID = customers.customerID ORDER BY orders.orderID;";
}
if(isset($_REQUEST['left']))
{
    $query = "SELECT customers.customer_name, orders.orderID FROM customers LEFT JOIN orders ON customers.customerID = orders.orderID; ORDER BY orders.orderID";
}
if(isset($_REQUEST['right']))
{
    $query = "SELECT orders.customerID, customers.customer_name, customers.country FROM orders RIGHT JOIN customers ON orders.orderId = customers.customerID; ORDER BY orders.customerID";
}



if($result = $conn -> query($query))
{

    if($result -> rowCount() > 0)
    {
        $i = 1;
        while($row = $result -> fetch(PDO::FETCH_ASSOC))
        {
            $rowData[$i] = json_encode($row);
            $i++;
        }
    }else
    {
        echo ("<div class=\"alert alert-danger\"><em>No Records Found!</em></div>");
    }
}else
{
    echo ("<div class=\"alert alert-danger\" style=\"font-size: 1.3rem;\"> Error connecting to Database. Please try again!</div>");
}


/*
if($_REQUEST['inner'])
{
    $query = "SELECT orders.orderID, customers.customer_name FROM orders INNER JOIN customers ON orders.customerID = customer.customerID;";
}
if($_REQUEST['left'])
{
    $query = "SELECT customers.customer_name, orders.orderID FROM customers LEFT JOIN orders ON customers.customerID = orders.orderID;";
}
if($_REQUEST['right'])
{
    $query = "SELECT orders.customerID, customer.customer_name, customer.country FROM orders RIGHT JOIN customers ON orders.orderId = customer.customerID;";
}
echo $query;*/



echo json_encode($rowData);


?>
