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
</style>
<body>
<div class="container-fluid">
        <h1 class="display-3 text-center">Admin: <span>All Guests</span></h1>
        <div class="row mt-5">
            <!-- Search Users query -->
            <div class="col"></div>
            <div class="col-6">
                <form class="bg-light" action="<?php echo (htmlspecialchars($_SERVER['PHP_SELF']));?>" method="POST">
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="name">Name: </label>
                        <input type="text" class="form-control" placeholder="Joah Matte" arial-label="name" id="name" autocomplete="off" name="name">
                        <label class="input-group-text" for="contact">Contact: </label>
                        <input type="text" class="form-control" placeholder="" aria-label="contact" id="contact" autocomplete="off" name="contact">
                        <input type="submit" class="btn btn-secondary" value="Search" name="search" id="search">
                    </div>
                </form>
            </div>
            <div class="col">
            <div class="d-flex justify-content-end">
                    <a href="/LoginAction/templates/dashboard.html" class="btn btn-primary btn-md" id="viewAllUsers">
                        <span class="bi bi-arrow-bar-left me-2"></span>Dashboard
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="container mt-4">
        <div class="table-responsive">
            <?php
            require_once("config.php");
            
            if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['search'])
            {
                if (!empty($_POST['name']))
                {
                    $name = $_POST['name'];
                    $query = "SELECT * FROM " . TABLE_NAME . " WHERE Name=" . $name;
                }elseif(!empty($_POST['contact']))
                {
                    $contact = $_POST['contact'];
                    $query = "SELECT * FROM " . TABLE_NAME . " WHERE Contact=" . $contact;
                }
            }else
            {
                $query = "SELECT * FROM " . TABLE_NAME;
            }

            if($result = $conn -> query($query))
            {

                if($result -> rowCount() > 0)
                {
                    echo "<table class=\"table\">";
                        echo "<thead>";
                            echo "<tr>";
                                echo "<th>#</th>";
                                echo "<th>Name</th>";
                                echo "<th>Username</th>";
                                echo "<th>Contact</th>";
                            echo "</tr>";
                        echo "</thead>";
                        echo "<tbody>";
                            while($row = $result -> fetch(PDO::FETCH_ASSOC))
                            {
                                echo "<tr>";
                                    echo "<td>" . $row['Id'] . "</td>";
                                    echo "<td>" . $row['Name'] . "</td>";
                                    echo "<td>" . $row['Username'] . "</td>";
                                    echo "<td>" . $row['Contact'] . "</td>";
                                echo "</tr>";
                            }
                        echo "</tbody>";
                    echo "</table>";
                }else
                {
                    echo ("<div class=\"alert alert-danger\"><em>No Records Found!</em></div>");
                }
            }else
            {
                echo ("<div class=\"alert alert-danger\" style=\"font-size: 1.3rem;\"> Error connecting to Database. Please try again!</div>");
            }
            ?>
        </div>
    </table>





    <!-- Jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" ></script>
    <script src="../templates/scripts/users.js"></script>
</body>
</html>