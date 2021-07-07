<?php
session_start();
ob_start();

unset($_SESSION['username']);
unset($_SESSION['password']);

header("Referesh: 2; URL = /LoginAction/templates/login.html");

?>