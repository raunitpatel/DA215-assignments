<?php
session_start();
require_once('connecting_database.php');

$patientDetails = [];
$prescriptions = [];
$error = '';

if ($_SESSION['role'] !== 'Patient') {
    $error = "Access Denied. You must be logged in as a Patient.";
} else {
    $name = $_SESSION['name'];

    
    $ssnQuery = "SELECT p.ssn FROM Patient p JOIN Users u ON p.name = u.name WHERE u.name = ?";
    if ($stmt = $conn->prepare($ssnQuery)) {
        $stmt->bind_param("s", $name);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($row = $result->fetch_assoc()) {
            $patient_ssn = $row['ssn'];
        } else {
            $error = "Patient information not found.";
        }
        $stmt->close();
    } else {
        $error = "Error preparing query: " . $conn->error;
    }

    if (!empty($patient_ssn)) {
        $patientQuery = "SELECT * FROM Patient WHERE ssn = ?";
        if ($stmt = $conn->prepare($patientQuery)) {
            $stmt->bind_param("s", $patient_ssn);
            $stmt->execute();
            $result = $stmt->get_result();
            if ($row = $result->fetch_assoc()) {
                $patientDetails = $row;
            }
            $stmt->close();
        }

        $prescriptionQuery = "SELECT p.*, d.Trade_name, d.formula, d.Company_name FROM Prescribes p JOIN Drug d ON p.drug_Trade_name = d.Trade_name AND p.name = d.Company_name WHERE p.patient_ssn = ?";
        if ($stmt = $conn->prepare($prescriptionQuery)) {
            $stmt->bind_param("s", $patient_ssn);
            $stmt->execute();
            $result = $stmt->get_result();
            while ($row = $result->fetch_assoc()) {
                $prescriptions[] = $row;
            }
            $stmt->close();
        }
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Patient Dashboard</title>
</head>
<body>
<?php if (!empty($error)): ?>
    <p><?php echo $error; ?></p>
<?php else: ?>
    <center>
        <h2 style="margin-bottom: 30px;">Patient Details</h2>
        <p>SSN: <?php echo $patientDetails['ssn']; ?></p>
        <p>Name: <?php echo $patientDetails['name'] ?></p>
        <p>Address: <?php echo $patientDetails['address']; ?></p>
        <p>Age: <?php echo $patientDetails['Age']; ?></p>
        <button onclick="window.location.href='landing.html';" style="padding: 5px;">Log Out</button>
    </center>
    <h2 style="margin-top: 20px; padding-left:20px">Prescriptions</h2>
    <?php foreach ($prescriptions as $prescription): ?>
        <div style="background-color: #fff;
    margin: 10px;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    max-width: 600px;">
            <p>Prescription Date:<?php echo $prescription['date']; ?></p>
            <p>Drug Name: <?php echo $prescription['Trade_name'] ?></p>
            <p>Formula: <?php echo $prescription['formula']; ?></p>
            <p>Company Name: <?php echo $prescription['Company_name']; ?></p>
            <p>Quantity: <?php echo $prescription['qty']; ?></p>
        </div>
    <?php endforeach; ?>
<?php endif; ?>
</body>
</html>
