<?php
// Include database connection
require_once 'includes/db_connection.php';

// Include functions file
require_once 'includes/functions.php';

// Set page title
$page_title = 'Imperio Radio - Artists';

// Include header
include 'includes/header.php';

// Get artists info
$artists = getArtistsInfo($pdo);
?>

<main>
    <!-- Page heading -->
    <h1>Artists</h1>
    
    <!-- Artists section -->
    <div class="artists-detail-section">
        <?php foreach ($artists as $artist): ?>
            <article class="artist-detail-card">
                <!-- Artist subheading - FIXED COLUMN NAME -->
                <h2><?php echo htmlspecialchars($artist['name']); ?></h2>
                
                <div class="artist-detail-content">
                    <!-- Artist image - FIXED COLUMN NAME -->
                    <div class="artist-detail-image">
                        <img src="<?php echo htmlspecialchars($artist['image']); ?>" 
                             alt="<?php echo htmlspecialchars($artist['name']); ?>">
                    </div>
                    
                    <div class="artist-detail-text">
                        <!-- Artist description - FIXED COLUMN NAME -->
                        <p><?php echo htmlspecialchars($artist['description']); ?></p>
                        
                        <!-- Top 3 songs list -->
                        <h3>Top 3 Songs:</h3>
                        <ul class="top-songs-list">
                            <li><?php echo htmlspecialchars($artist['top_song_1']); ?></li>
                            <li><?php echo htmlspecialchars($artist['top_song_2']); ?></li>
                            <li><?php echo htmlspecialchars($artist['top_song_3']); ?></li>
                        </ul>
                    </div>
                </div>
            </article>
        <?php endforeach; ?>
    </div>
</main>

<script src="scripts/main.js"></script>
</body>
</html>