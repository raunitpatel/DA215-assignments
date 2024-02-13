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
    $company_phone = $_POST['company_phone'];
    $conn->begin_transaction();

    try {

        $stmt = $conn->prepare("INSERT INTO pharmaceutical_company (name, Phone_number) VALUES (?, ?)");
        $stmt->bind_param("ss", $name, $company_phone);
        $stmt->execute();
        $conn->commit();
        $stmt->close();
        $conn->close();
        header('Location: landing.html');
        echo "Pharmaceutical_company registered successfully";

    } catch (Exception $e) {
        $conn->rollback();
        echo "Registration failed" . $e->getMessage();
        exit();
    }

}
    
?>