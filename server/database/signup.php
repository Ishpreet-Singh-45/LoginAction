<?php
session_start();

ini_set("display_errors", 1);
ini_set("display_startup_errors", 1);
error_reporting(E_ALL);

$name = $_REQUEST['name'];
$username = $_REQUEST['username'];
$contact = $_REQUEST['contact'];
$password = $_REQUEST['password'];

$errors = [];
$data = [];

if(empty($name) && empty($username) && empty($password) && empty($contact))
{
    $errors['details'] = "Invalid details! Please provide the details correctly. ";
}
if(empty($name))
{
    $error['name'] = "Please fill in your name correctly!";
}
if (empty($username) && is_int($username))
{
    $error['username'] = "Username/Email not correct! Please try again!";
}
if (empty($contact) && !is_long($contact))
{
    $error['contact'] = "Phone Number is invalid! Please try again. ";
}
if(empty($password))
{
    $error['password'] = "Password is required for authentication. Please provide a valid password. ";
}
if(!empty($errors))
{
    $data['success'] = false;
    $data['errors'] = $errors;
}else
{
    require_once('config.php');

    $query = "INSERT INTO " . TABLE_NAME . "(Name, Username, Contact) VALUES (:name, :username, :contact);";

    if($stmt = $conn -> prepare($query))
    {
        $stmt -> bindParam(":name", $name);
        $stmt -> bindParam(":username", $username);
        $stmt -> bindParam(":contact", $contact);

        if($stmt -> execute())
        {
            $data['username'] = $username;
            $data['password'] = $password;
            $data['success'] = true;
            $data['message'] = "Details successfully posted. Thank You!";
            echo (json_encode($data)); // returning data
        }
        unset($stmt);
    }
    $conn = null;

}




?>