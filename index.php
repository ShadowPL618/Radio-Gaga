<?php
// Include database connection
require_once 'includes/db_connection.php';

// Set page title
$page_title = 'Imperio Radio - Home';

// Include header
include 'includes/header.php';
?>

<main>
    <!-- Main heading -->
    <h1>Welcome to Imperio Radio</h1>
    <h2>Ave, True to Caesar - Broadcasting the Legion's Finest</h2>
    
    <!-- Home content -->
    <div class="home-content">
        <p>
            Welcome to Imperio Radio, the official broadcasting station of the Legion. 
            Here you will find our collection of artists and tracks.
        </p>
        <p>
            Choose your composer below to hear their tracks, or explore their origins.
        </p>
        
        <!-- Artist gallery -->
        <div class="artist-gallery">
            <?php
            // Fetch all artists
            $stmt = $pdo->query("SELECT * FROM artists ORDER BY artist_name");
            $artists = $stmt->fetchAll();
            
            foreach ($artists as $artist) {
                // Count tracks per artist
                $count_stmt = $pdo->prepare("SELECT COUNT(*) as count FROM tracks WHERE artist_id = ?");
                $count_stmt->execute([$artist['artist_id']]);
                $track_count = $count_stmt->fetch()['count'];
                
                // Create proper artist page link
                $artist_slug = strtolower(str_replace(' ', '', $artist['artist_name']));
                ?>
                <a href="playlists/<?php echo $artist_slug; ?>.php" style="text-decoration: none;">
                    <div class="artist-card">
                        <img src="<?php echo $artist['artist_image']; ?>" alt="<?php echo $artist['artist_name']; ?>">
                        <h3><?php echo $artist['artist_name']; ?></h3>
                        <p><?php echo $track_count; ?> Tracks</p>
                    </div>
                </a>
                <?php
            }
            ?>
        </div>
        
    </div>
</main>

<script src="scripts/main.js"></script>
</body>
</html>