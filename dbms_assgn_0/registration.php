<?php
    session_start();
    require_once("connecting_database.php");

    if($_SERVER['REQUEST_METHOD']=='POST'){
        $name=$_POST['name'];
        $username=$_POST['username'];
        $password_data=$_POST['password'];
        $role=$_POST['role'];
        $conn->begin_transaction();
        
        try{
            // Check if username already exists
            $stmt_check_username = $conn->prepare("SELECT id FROM Users WHERE username = ?");
            $stmt_check_username->bind_param("s", $username);
            $stmt_check_username->execute();
            $stmt_check_username->store_result();
            
            if ($stmt_check_username->num_rows > 0) {
                throw new Exception("Username already exists. Please choose a different username.");
            }

            // Insert new user
            $stmt = $conn->prepare("INSERT INTO Users (name,username, password_data,  role) VALUES (?, ?, ?, ?)");
            $stmt->bind_param("ssss",$name, $username, $password_data , $role);
            $stmt->execute();
            $conn->commit();

            $_SESSION['id'] = $stmt->insert_id;
            $_SESSION['role'] = $role;
            $_SESSION['name'] = $name;

            $stmt->close();
            $conn->close();

            switch ($role) {
                case 'Patient':
                    header('Location: patient_registration.html');
                    break;
                case 'Doctor':
                    header('Location: doctor_registration.html');
                    break;
                case 'Pharmacist':
                    header('Location: pharmacist_registration.html');
                    break;
                case 'Company':
                    header('Location: company_registration.html');
                    break;
                default:
                    header('Location: error_page.html' );
                    break;
            }
            echo "Success";
        }
        catch (Exception $e) {
            $conn->rollback();
            echo "Registration failed" . $e->getMessage();
            exit();
        }
    }


?>