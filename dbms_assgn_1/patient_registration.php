<?php
session_start();

if (!isset($_SESSION['id'])) {
    header('Location: login.php');
    exit;
}

$userID = $_SESSION['id'];

require_once('connecting_database.php');

$name = $_SESSION['name'];


if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $patient_ssn = $_POST['patient_ssn'];
    $patient_address = $_POST['patient_address'];
    $patient_age = $_POST['patient_age'];
    $problem = $_POST['problem'];
    $conn->begin_transaction();

    try {
        $query = "SELECT * FROM doctor WHERE specialty = ? ORDER BY RAND() LIMIT 1";
    
        $st = $conn->prepare($query);
        $st->bind_param("s", $problem); // Assuming 'problem' corresponds to doctor's specialty
        $st->execute();
        
        
        $result = $st->get_result();
        if ($result->num_rows > 0){
            $random_doctor = $result->fetch_assoc();
            $doctor_ssn = $random_doctor['ssn'];
        } else {
            throw new Exception("No doctor available for the specified specialty");
        }
        $st->free_result();

        $stmt = $conn->prepare("INSERT INTO patient (ssn, name, address, Age, Pri_physician) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("sssis", $patient_ssn, $name, $patient_address, $patient_age, $doctor_ssn);
        $stmt->execute();
        $stmt->close();

        $conn->commit();
        $conn->close();
        header('Location: landing.html');
        echo "Patient registered successfully";

    } catch (Exception $e) {
        $conn->rollback();
        echo "Registration failed\n" . $e->getMessage();
        exit();
    }

}
    
?>