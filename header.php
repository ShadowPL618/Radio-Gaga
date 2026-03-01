<?php
// Include functions file
require_once 'includes/functions.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Your Name">
    <title><?php echo isset($page_title) ? $page_title : 'Imperio Radio'; ?></title>
    <link rel="stylesheet" href="styles/styles.css">
</head>
<body>
    <header>
        <!-- Logo link to homepage -->
        <a href="index.php" class="logo">IMPERIO RADIO</a>
        
        <?php
        // Display navigation from database
        displayNavigation($pdo, basename($_SERVER['PHP_SELF']));
        ?>
    </header>