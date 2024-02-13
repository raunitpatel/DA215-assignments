<?php
session_start();

if (!isset($_SESSION['id'])) {
    header('Location: login.php');
    exit;
}

$userID = $_SESSION['id'];

require_once('connecting_database.php');


if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $doctor_name = $_SESSION['name'];
    $doctor_ssn = $_POST['doctor_ssn'];
    $doctor_exp = $_POST['doctor_exp'];
    $doctor_specialization = $_POST['specialty'];
    $conn->begin_transaction();

    try {
        $stmt = $conn->prepare("INSERT INTO doctor (ssn, name, specialty, Years_exp) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("sssi", $doctor_ssn, $doctor_name, $doctor_specialization, $doctor_exp);
        $stmt->execute();
        $conn->commit();
        $stmt->close();
        $conn->close();
        header('Location: landing.html');
        echo "Doctor registered successfully";    

    } catch (Exception $e) {
        $conn->rollback();
        echo "Registration failed\n" . $e->getMessage();
        exit();
    }
}
    
?>