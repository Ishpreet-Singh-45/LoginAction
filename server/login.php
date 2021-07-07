<?php
session_start();


$username = $_POST['username'];
$password = $_POST['password'];


// Debugging data
// $username = "Rahul_dev";
// $password = "";

$details = [];
$data = [];

$data['user'] = $username;
$data['pass'] = $password;

function validate($data)
{
    // check if username does not contain numbers  
    $data = str_split($data);
    foreach($data as $char)
    {
        if(is_int($char))
        {
            return false;
        }
    }
    return true;
}

function login_match($username, $password)
{
    if(validate($username) && isset($password) && strlen($password) > 5) // validating only username
    {
        $GLOBALS['data']['is_valid'] = true;
        // Admin Authentication
        if($username === "admin@admin" && $password === "951236")
        {
            $GLOBALS['data']['adminauth'] = true;
            return;
        }

        // Not admin authentication
        require_once("config.php");

        $query = "SELECT Password FROM login WHERE Username=:username;";

        if($stmt = $conn -> prepare($query))
        {
            if($stmt -> execute(array(':username' => $username)) && $stmt -> rowCount() != 0)
            {
                $row = $stmt -> fetch(PDO::FETCH_ASSOC); // fetch the details of the specified user
                // check password match
                if ($password === $row['Password']) 
                {
                    $GLOBALS['details']['auth'] = true;
                    $GLOBALS['details']['records'] = $stmt -> rowCount();
                    // set session variables
                    $_SESSION['valid'] = true;
                    $_SESSION['username'] = $username;
                    $_SESSION['timeout'] = time();
                    return;
                }else
                {
                    $GLOBALS['details']['auth'] = false;
                    $GLOBALS['details']['error'] = "Access Denied! Please try again. ";
                    return;
                }
            }else
            {
                $GLOBALS['details']['auth'] = false;
                $GLOBALS['details']['error'] = "No record found!";
            }
            unset($stmt);
        }
        $conn = null;
    }else
    {
        $GLOBALS['data']['is_valid'] = false;
        $GLOBALS['details']['error'] = "Invalid Details. Please try again!";
    }
}



login_match($username, $password);




$data['details'] = $details;

echo (json_encode($data));

?>