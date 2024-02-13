<?php
session_start();
require_once('connecting_database.php');

$companyName = '';
$drugs = [];
$contracts = [];
$error = '';
$companyphone='';

if ($_SESSION['role'] != 'Company') {
    $error = "Access Denied. You must be logged in as a company.";
} else {
    $name = $_SESSION['name'];

    $companyNameQuery = "SELECT * FROM Pharmaceutical_Company WHERE name = ?";
    if ($stmt = $conn->prepare($companyNameQuery)) {
        $stmt->bind_param("s", $name);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($row = $result->fetch_assoc()) {
            $companyName = $row['name'];
            $companyphone=$row['Phone_number'];
        } else {
            $error = "Company not found.";
        }
        $stmt->close();
    }

    if (!empty($companyName)) {
        $drugsQuery = "SELECT * FROM Drug WHERE Company_name = ?";
        if ($stmt = $conn->prepare($drugsQuery)) {
            $stmt->bind_param("s", $companyName);
            $stmt->execute();
            $drugs = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
            $stmt->close();
        }

        $contractsQuery = "SELECT * FROM Contracts_with WHERE pharmaceutical_company_name = ?";
        if ($stmt = $conn->prepare($contractsQuery)) {
            $stmt->bind_param("s", $companyName);
            $stmt->execute();
            $contracts = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Company Dashboard</title>
</head>
<body>
    <?php if ($error): ?>
        <p><?php echo $error; ?></p>
    <?php else: ?>
        <center>
            <h1 style="margin-left: 20px;">Your Details</h1>
            <div style="margin-left: 20px;">
                <p><strong>Company Name:</strong> <?php echo $companyName; ?></p>
                <p>Phone Number: <?php echo $companyphone; ?></p>
                <button onclick="window.location.href='landing.html';" style="padding: 5px;">Log Out</button>
            </div>
        </center>
        
        <h2 style="margin-left: 20px;">Drugs Manufactured</h2>
        <?php foreach ($drugs as $drug): ?>
            <p style="margin-left: 20px;"><?php echo $drug['Trade_name'] . " - " . $drug['formula']; ?></p>
        <?php endforeach; ?>

        <h2 style="margin-left: 20px;">Contracts with Pharmacies</h2>
        <?php foreach ($contracts as $contract): ?>
            <div style="margin-left: 20px;">
                <p><strong>Pharmacy Name:</strong> <?php echo $contract['pharmacy_name']; ?></p>
                <p><strong>Start Date:</strong> <?php echo $contract['Start_date']; ?></p>
                <p><strong>End Date:</strong> <?php echo $contract['end_date']; ?></p>
                <p><strong>Supervisor:</strong> <?php echo $contract['supervisor']; ?></p>
            </div>
        <?php endforeach; ?>
    <?php endif; ?>
</body>
</html>
