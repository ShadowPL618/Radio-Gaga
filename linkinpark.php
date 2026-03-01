<?php
// Include database connection
require_once '../includes/db_connection.php';

// Set page title
$page_title = 'Imperio Radio - Linkin Park';
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
                <li><a href="../playlists.php" class="active">Tracks</a></li>
            </ul>
        </nav>
    </header>

<main>
    <!-- Artist heading -->
    <h1>Linkin Park - Tracks</h1>
    <h2>Chronicles of the Aurelius' Legion</h2>
    
    <!-- Video player section -->
    <div class="video-player-container">
        <div class="video-display">
            <video id="mainVideo" controls>
                <source src="" type="video/mp4">
                Your browser does not support video.
            </video>
        </div>
        <div class="video-info">
            <h3 id="currentTitle">Select a hymn to begin</h3>
            <p id="currentArtist">Linkin Park</p>
        </div>
    </div>
    
    <!-- Playlist table -->
    <table id="playlist-table">
        <thead>
            <tr>
                <th>#</th>
                <th>Order Title</th>
                <th>Chronicle</th>
                <th>Duration(s)</th>
                <th>Category</th>
            </tr>
        </thead>
        <tbody>
            <?php
            // Fetch Linkin Park tracks
            $stmt = $pdo->prepare("
                SELECT t.*, a.artist_name, al.album_title 
                FROM tracks t
                JOIN artists a ON t.artist_id = a.artist_id
                JOIN albums al ON t.album_id = al.album_id
                WHERE a.artist_name = 'Linkin Park'
                ORDER BY al.release_year, t.track_number
            ");
            $stmt->execute();
            $tracks = $stmt->fetchAll();
            
            $counter = 1;
            foreach ($tracks as $track) {
                ?>
                <tr class="track-row" 
                    data-video="../<?php echo $track['video_file']; ?>"
                    data-title="<?php echo htmlspecialchars($track['track_title']); ?>"
                    data-artist="<?php echo htmlspecialchars($track['artist_name']); ?>">
                    <td><?php echo $counter++; ?></td>
                    <td class="song-title"><?php echo htmlspecialchars($track['track_title']); ?></td>
                    <td><?php echo htmlspecialchars($track['album_title']); ?></td>
                    <td class="duration"><?php echo $track['duration']; ?></td>
                    <td class="genre"><?php echo isset($track['genre']) ? $track['genre'] : 'Nu-Metal'; ?></td>
                </tr>
                <?php
            }
            ?>
        </tbody>
    </table>
</main>

<script src="../scripts/main.js"></script>
</body>
</html>