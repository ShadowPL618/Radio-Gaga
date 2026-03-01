<?php
// Include database connection
require_once '../includes/db_connection.php';

// Set page title
$page_title = 'Imperio Radio - Artists';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $page_title; ?></title>
    <link rel="stylesheet" href="../styles/styles.css">
</head>
<body>
    <header>
        <a href="../index.php" class="logo">IMPERIO RADIO</a>
        <nav>
            <ul>
                <li><a href="../index.php">Home</a></li>
                <li><a href="Artist_Info.php" class="active">Artists</a></li>
                <li><a href="../playlists.php">Tracks</a></li>
            </ul>
        </nav>
    </header>

<main>
    <!-- Main heading -->
    <h1>Legion Composers</h1>
    <h2>Meet the Masters Behind the Chronicles</h2>
    
    <!-- Artists section -->
    <div class="artists-info-section">
        <?php
        // Fetch all artists with track count
        $artists_stmt = $pdo->query("
            SELECT a.*, COUNT(t.track_id) as track_count 
            FROM artists a
            LEFT JOIN tracks t ON a.artist_id = t.artist_id
            GROUP BY a.artist_id
            ORDER BY a.artist_name
        ");
        $artists = $artists_stmt->fetchAll();
        
        foreach ($artists as $artist):
            // Get albums by artist
            $album_stmt = $pdo->prepare("
                SELECT COUNT(*) as album_count 
                FROM albums 
                WHERE artist_id = ?
            ");
            $album_stmt->execute([$artist['artist_id']]);
            $album_count = $album_stmt->fetch()['album_count'];
            
            // Create artist page link
            $artist_slug = strtolower(str_replace(' ', '', $artist['artist_name']));
        ?>
            
            <div class="artist-info-card">
                <!-- Artist image -->
                <div class="artist-image-container">
                    <img src="../<?php echo $artist['artist_image']; ?>" 
                         alt="<?php echo htmlspecialchars($artist['artist_name']); ?>"
                         class="artist-info-image">
                </div>
                
                <!-- Artist details -->
                <div class="artist-details">
                    <h3><?php echo htmlspecialchars($artist['artist_name']); ?></h3>
                    <p class="artist-bio"><?php echo htmlspecialchars($artist['artist_bio']); ?></p>
                    
                    <div class="artist-stats">
                        <div class="stat-item">
                            <span class="stat-number"><?php echo $album_count; ?></span>
                            <span class="stat-label">Albums</span>
                        </div>
                        <div class="stat-item">
                            <span class="stat-number"><?php echo $artist['track_count']; ?></span>
                            <span class="stat-label">Tracks</span>
                        </div>
                    </div>
                    
                    <a href="<?php echo $artist_slug; ?>.php" class="view-artist-button">
                        View Tracks
                    </a>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</main>

<script src="../scripts/main.js"></script>
</body>
</html>