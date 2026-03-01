<?php
// Include database connection
require_once 'includes/db_connection.php';

// Include functions file
require_once 'includes/functions.php';

// Set page title
$page_title = 'Imperio Radio - Contact';

// Include header
include 'includes/header.php';

// Handle form submission
$showThankYou = false;
$firstName = '';
$lastName = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $firstName = htmlspecialchars($_POST['firstname']);
    $lastName = htmlspecialchars($_POST['lastname']);
    $showThankYou = true;
}
?>

<main>
    <!-- Page heading -->
    <h1>Contact</h1>
    
    <?php if ($showThankYou): ?>
        <!-- Thank you message -->
        <div class="thank-you-message">
            <p>Thank you <?php echo $firstName . ' ' . $lastName; ?> for contacting Imperio Radio.</p>
        </div>
    <?php endif; ?>
    
    <!-- Contact form -->
    <div class="contact-form-container">
        <form method="POST" action="contact.php" class="contact-form">
            
            <!-- First Name field -->
            <div class="form-group">
                <label for="firstname">First Name *</label>
                <input type="text" 
                       id="firstname" 
                       name="firstname" 
                       required>
            </div>
            
            <!-- Last Name field -->
            <div class="form-group">
                <label for="lastname">Last Name *</label>
                <input type="text" 
                       id="lastname" 
                       name="lastname" 
                       required>
            </div>
            
            <!-- Email or Phone field -->
            <div class="form-group">
                <label for="contact">Email or Phone</label>
                <input type="text" 
                       id="contact" 
                       name="contact">
            </div>
            
            <!-- Message field -->
            <div class="form-group">
                <label for="message">Message</label>
                <textarea id="message" 
                          name="message" 
                          rows="6"></textarea>
            </div>
            
            <!-- Buttons -->
            <div class="form-buttons">
                <button type="submit" class="submit-button">Submit</button>
                <button type="reset" class="reset-button">Reset</button>
            </div>
            
        </form>
    </div>
</main>

<script src="scripts/main.js"></script>
</body>
</html>