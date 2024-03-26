<?php
session_start();

if (!isset($_SESSION['id'])) {
    header('Location: login.php');
    exit;
}

$userID = $_SESSION['id'];


require_once('connecting_database.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = $_SESSION['name'];
    $pharmacy_address = $_POST['pharmacy_address'];
    $pharmacy_phone = $_POST['pharmacy_phone'];
    $conn->begin_transaction();

    try {

        $stmt = $conn->prepare("INSERT INTO pharmacy (name, address, Phone_number) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $name, $pharmacy_address ,$pharmacy_phone);
        $stmt->execute();
        $conn->commit();
        $stmt->close();
        $conn->close();
        header('Location: landing.html');
        echo "Pharmacy registered successfully";

    } catch (Exception $e) {
        $conn->rollback();
        echo "Registration failed" . $e->getMessage();
        exit();
    }

}
    
?>