<?php
session_start();
require_once('connecting_database.php');


if ($_SERVER['REQUEST_METHOD']=='POST') {
    $doctor_ssn = $_POST['doctor_ssn'];
    $patient_ssn = $_POST['patient_ssn'];
    $drug_trade_name = $_POST['drug_trade_name'];
    $company_name = $_POST['company_name'];
    $date = $_POST['date'];
    $qty = $_POST['qty'];

    $query = "INSERT INTO Prescribes (doctor_ssn, patient_ssn, drug_trade_name, name, date, qty) VALUES (?, ?, ?, ?, ?, ?)";

    if ($stmt = $conn->prepare($query)) {
        $stmt->bind_param("sssssi", $doctor_ssn, $patient_ssn, $drug_trade_name, $company_name, $date, $qty);

        if ($stmt->execute()) {
            echo "Prescription added successfully.";
            header("Location: doctor.php");
        } else {
            echo "Error: " . $stmt->error;
        }

        $stmt->close();
    } else {
        echo "Error preparing statement: " . $conn->error;
    }
} else {
    echo "Invalid request.";
}

$conn->close();
?>
