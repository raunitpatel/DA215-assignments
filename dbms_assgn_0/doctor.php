<?php
session_start();
require_once('connecting_database.php');

$patientsData = [];
$doctor_ssn = '';
$error = '';

if ($_SESSION['role'] !== 'Doctor') {
    $error = "Access Denied. You must be logged in as a Doctor.";
} else {
    $name = $_SESSION['name'];

    // Fetch the doctor's SSN based on the username
    $doctorSSNQuery = "SELECT d.ssn FROM doctor d JOIN users u ON d.name = u.name WHERE u.name = ?";
    if ($stmt = $conn->prepare($doctorSSNQuery)) {
        $stmt->bind_param("s", $name);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($row = $result->fetch_assoc()) {
            $doctor_ssn = $row['ssn'];
        } else {
            $error = "Doctor information not found.";
        }
        $stmt->close();
    } else {
        $error = "Error preparing query: " . $conn->error;
    }

    if (!empty($doctor_ssn)) {
        // Fetch patients assigned to this doctor
        $patientQuery = "SELECT * FROM Patient WHERE Pri_physician = ?";
        if ($stmt = $conn->prepare($patientQuery)) {
            $stmt->bind_param("s", $doctor_ssn);
            $stmt->execute();
            $result = $stmt->get_result();

            while ($row = $result->fetch_assoc()) {
                $patientsData[] = $row;
            }
            $stmt->close();
        } else {
            $error = "Error preparing query: " . $conn->error;
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
    <title>Doctor Dashboard</title>
</head>
<body>
    
<?php if (!empty($error)): ?>
    <p><?php echo $error; ?></p>
<?php else: ?>
    <div style="text-align: center;">
        <h1>Doctor Details</h1>
        <p>SSN: <?php echo $doctor_ssn; ?></p>
        <p>Name : Dr. <?php echo $name; ?></p>
        <button onclick="window.location.href='landing.html';" style="padding: 5px;">Log Out</button>
    </div>
    <center><h2>My Patients</h2></center>
    <?php $serialNumber = 1; ?>
    <?php foreach ($patientsData as $patient): ?>
        <div style="display: flex;
    justify-content: space-around;
    padding: 10px;
    margin: 10px;
    background-color: #f9f9f9;
    border-radius: 4px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    max-width: 100%;
    overflow: hidden;
    
">
            <span style="flex: 1;
    text-align: center;
    font-size: 0.9rem;
    color: #333;">Patient number: <?php echo $serialNumber; ?></span>
            <span style="flex: 1;
    text-align: center;
    font-size: 0.9rem;
    color: #333;">Patient SSN: <?php echo $patient['ssn']; ?></span>
            <span style="flex: 1;
    text-align: center;
    font-size: 0.9rem;
    color: #333;">Name: <?php echo $patient['name']; ?></span>
        </div>
        <?php $serialNumber++; ?>
    <?php endforeach; ?>


    <center><h2>Prescribe Medication</h2></center>
    <form action="prescription.php" method="POST">
        <input type='hidden' name='doctor_ssn' value='<?php echo $doctor_ssn; ?>' style="padding: 5px; margin: 10px">
        <input type='text' name='patient_ssn' placeholder='Patient SSN' required style="padding: 5px; margin: 10px">
        <input type='text' name='drug_trade_name' placeholder='Drug Trade Name' required style="padding: 5px; margin: 10px">
        <input type='text' name='company_name' placeholder='Company Name' required style="padding: 5px; margin: 10px">
        <input type='date' name='date' placeholder='Date' required style="padding: 5px; margin: 10px">
        <input type='integer' name='qty' placeholder='Quantity' required style="padding: 5px; margin: 10px">
        <center><button type='submit' name='submit' style="padding: 5px; margin: 10px">Prescribe</button></center>
    </form>
<?php endif; ?>
</body>
</html>
