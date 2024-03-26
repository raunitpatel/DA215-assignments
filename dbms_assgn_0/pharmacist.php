<?php
session_start();
require_once('connecting_database.php');

// Initialize variables
$pharmacistDetails = [];
$contracts = [];
$drugPrices = [];
$error = '';

if ($_SESSION['role'] != 'Pharmacist') {
    $error = "Access Denied. You must be logged in as a pharmacist.";
} else {
    $name = $_SESSION['name'];

    $pharmacistQuery = "SELECT * FROM pharmacy WHERE name = ?";
    if ($stmt = $conn->prepare($pharmacistQuery)) {
        $stmt->bind_param("s", $name);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($row = $result->fetch_assoc()) {
            $pharmacistDetails = $row;
        } else {
            $error = "Pharmacy not found.";
        }
        $stmt->close();
    }

    if (!empty($pharmacistDetails)) {
        $pharmacyName = $pharmacistDetails['name'];

        $contractsQuery = "SELECT * FROM contracts_with WHERE pharmacy_name = ?";
        if ($stmt = $conn->prepare($contractsQuery)) {
            $stmt->bind_param("s", $pharmacyName);
            $stmt->execute();
            $contracts = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
            $stmt->close();
        }

        
        $pricesQuery = "SELECT * FROM sells WHERE pharmacy_name = ?"; 
        if ($stmt = $conn->prepare($pricesQuery)) {
            $stmt->bind_param("s", $pharmacyName);
            $stmt->execute();
            $drugPrices = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
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
    <title>Pharmacy Dashboard</title>
</head>
<body>
    <?php if ($error): ?>
        <p><?php echo $error; ?></p>
    <?php else: ?>
        <center>
            <h1>Pharmacy Details</h1>
            <p><strong>Name:</strong> <?php echo $pharmacistDetails['name']; ?></p>
            <p><strong>Phone number:</strong> <?php echo $pharmacistDetails['Phone_number']; ?></p>
            <button onclick="window.location.href='landing.html';" style="padding: 5px;">Log Out</button>
        </center>
        
        

        <h2 style="margin-left: 20px;">Contracts with Pharmaceutical Companies : </h2>
        <?php foreach ($contracts as $contract): ?>
            <div style="margin-left: 20px;">
                <p><strong>Company Name:</strong> <?php echo $contract['pharmaceutical_company_name']; ?></p>
                <p><strong>Start Date:</strong> <?php echo $contract['Start_date']; ?></p>
                <p><strong>End Date:</strong> <?php echo $contract['end_date']; ?></p>
                <p><strong>Supervisor:</strong> <?php echo $contract['supervisor']; ?></p>
            </div>
        <?php endforeach; ?>

        <h2 style="margin-left: 20px;">Drug Prices</h2>
        <?php foreach ($drugPrices as $price): ?>
            <div style="margin-left: 20px;">
                <p><strong>Drug Name:</strong> <?php echo $price['drug_Trade_name']; ?></p>
                <p><strong>Price:</strong> <?php echo $price['price']; ?></p>
            </div>
        <?php endforeach; ?>
    <?php endif; ?>
</body>
</html>
