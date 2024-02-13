<?php
    session_start();
    require_once("connecting_database.php");
     
    if($_SERVER['REQUEST_METHOD']=='POST'){
        $username=$_POST['username'];
        $password_data=$_POST['password'];

        $sql = $conn->prepare("SELECT * FROM users WHERE username = ?");
        $sql->bind_param("s", $username);
        $sql->execute();
        $result = $sql->get_result();
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            if ($password_data==$row['password_data']) {
                $_SESSION['id'] = $row['id'];
                $_SESSION['role'] = $row['role'];
                $_SESSION['name'] = $row['name'];
                switch ($row['role']) {
                    case 'Patient':
                        header('Location: patient.php');
                        break;
                    case 'Doctor':
                        header('Location: doctor.php');
                        break;
                    case 'Pharmacist':
                        header('Location: pharmacist.php');
                        break;
                    case 'Company':
                        header('Location: company.php');
                        break;
                    default:
                        header('Location: error.html' );
                        break;
                }
            } else {
                echo "Invalid password";
            }
        } else {
            echo "Invalid username";
        }
    
        $sql->close();
        $conn->close();

    }
?>