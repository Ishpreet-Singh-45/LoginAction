<?php
session_start();

ini_set("display_errors", 1);
ini_set("display_startup_errors", 1);
error_reporting(E_ALL);

$name = $_REQUEST['name'];
$email = $_REQUEST['email'];
$contact = $_REQUEST['contact'];
$username = $_REQUEST['username'];
$password = $_REQUEST['password'];

// debugging purposes
// $name = "asda";
// $email = "asda@asda.adsa";
// $password = "asd@asda";
// $username = "asdassa_Asdas";
// $contact = "156-1656-15";

$errors = [];
$data = [];

function validate()
{
    $name = htmlspecialchars(stripslashes(trim($GLOBALS['name'])));
    $email = htmlspecialchars(stripslashes(trim($GLOBALS['email'])));
    $contact = htmlspecialchars(stripslashes(trim($GLOBALS['contact'])));
    $username = htmlspecialchars(stripslashes(trim($GLOBALS['username'])));
    $password = htmlspecialchars(stripslashes(trim($GLOBALS['password'])));


    // Pattern matching 
    $pattern = "<^([a-zA-Z\s])+$>";
    if (preg_match($pattern, $name) == 0 && strlen($name) < 5)
    {
        $GLOBALS['errors']['name'] = "Invalid Name. Please enter your name properly. ";
        $GLOBALS['errors']['errorPoint'] = 'name';
        return false;
        
    }
    
    $pattern = "<^\w+([\.-]?\w)+@\w+([\.]?\w)+(\.[a-zA-Z]{2,3})$>i"; // format for type: student-uid.CSE@school.alumni.edu
    if (preg_match($pattern, $email) == 0)
    {
        $GLOBALS['errors']['email'] = "Invalid Email! Please enter a valid email. ";
        $GLOBALS['errors']['errorPoint'] = 'email';
        return false;
    }

    $pattern = "<^\d{3}+-\d{4}+-\d{3}+$>";
    if(preg_match($pattern, $contact) == 0)
    {
        $GLOBALS['errors']['contact'] = "Please fill your Contact information according to the given format. ";
        $GLOBALS['errors']['errorPoint'] = 'contact';
        return false;
        
    }
    $pattern = "<^([a-zA-Z_-])+$>";
    if(preg_match($pattern, $username) == 0 && strlen($username) < 5)
    {
        $GLOBALS['errors']['username'] = "Please fill a valid username. Refer the format specified. ";
        $GLOBALS['errors']['errorPoint'] = 'username';
        return false;
        
    }
    if(strlen($password) > 16)
    {
        $GLOBALS['errors']['password'] = "The length of password cannot exceed 16 characters. ";
        $GLOBALS['errors']['errorPoint'] = 'password';
        return false;
    }
    return true;

}

if (validate())
{
    require_once('config.php');

    $query = "INSERT INTO " . TABLE_NAME . "(Name, Email, Contact, Username, Password) VALUES (:name, :email, :contact, :username, :password);";

    if($stmt = $conn -> prepare($query))
    {
        if($stmt -> execute(array(":name" => $name, ":email" => $email, ":contact" => $contact, ":username" => $username, ":password" => $password)))
        {
            $data['is_valid'] = true;
            $data['message'] = "Records saved successfully! ";
        }   
        unset($stmt);
    }else
    {
        $errors['message'] = "Error connecting to the Server! Please check your connection and try again. ";
    }
    $conn = null;
}else
{
    $data['is_valid'] = false;
}

$data['errors'] = $errors;

echo (json_encode($data)); // returning data


?>