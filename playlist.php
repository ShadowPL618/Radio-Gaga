<?php
// Include database connection
require_once 'includes/db_connection.php';

// Include functions file
require_once 'includes/functions.php';

// Set page title
$page_title = 'Imperio Radio - Tracks';

// Include header
include 'includes/header.php';

// Fetch all albums with artist info
$album_stmt = $pdo->query("
    SELECT al.*, a.artist_name 
    FROM albums al
    JOIN artists a ON al.artist_id = a.artist_id
    ORDER BY a.artist_name, al.release_year
");
$albums = $album_stmt->fetchAll();
?>

<main>
    <!-- Main heading -->
    <h1>Legion Tracks Archive</h1>
    <h2>Complete Collection of Legion Chronicles</h2>
    
    <!-- Video player section -->
    <div class="video-player-container">
        <div class="video-display">
            <video id="mainVideo" controls>
                <source src="" type="video/mp4">
                Your browser does not support video.
            </video>
        </div>
        <div class="video-info">
            <h3 id="currentTitle">Select a track to begin</h3>
            <p id="currentArtist">No track playing</p>
        </div>
    </div>
    
    <!-- Albums section -->
    <div class="albums-section">
        <?php foreach ($albums as $album): ?>
            <?php
            // Fetch tracks for album
            $track_stmt = $pdo->prepare("
                SELECT t.*, a.artist_name 
                FROM tracks t
                JOIN artists a ON t.artist_id = a.artist_id
                WHERE t.album_id = ?
                ORDER BY t.track_number
            ");
            $track_stmt->execute([$album['album_id']]);
            $tracks = $track_stmt->fetchAll();
            ?>
            
            <div class="album-container">
                <!-- Album header with cover -->
                <div class="album-header">
                    <img src="<?php echo htmlspecialchars($album['cover_image']); ?>" 
                         alt="<?php echo htmlspecialchars($album['album_title']); ?>" 
                         class="album-cover">
                    <div class="album-info">
                        <h3><?php echo htmlspecialchars($album['album_title']); ?></h3>
                        <p><?php echo htmlspecialchars($album['artist_name']); ?></p>
                        <p class="album-year"><?php echo $album['release_year']; ?></p>
                    </div>
                </div>
                
                <!-- Tracks table -->
                <table class="playlist-table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Track Title</th>
                            <th>Duration</th>
                            <th>Genre</th>
                            <th>Audio</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($tracks as $track): ?>
                            <?php
                            // Get file paths safely
                            $videoFile = !empty($track['video_file']) ? $track['video_file'] : '';
                            $audioFile = !empty($track['audio_file']) ? $track['audio_file'] : '';
                            $genre = !empty($track['genre']) ? $track['genre'] : 'Unknown';
                            ?>
                            <tr class="track-row" 
                                data-video="<?php echo htmlspecialchars($videoFile); ?>"
                                data-title="<?php echo htmlspecialchars($track['track_title']); ?>"
                                data-artist="<?php echo htmlspecialchars($track['artist_name']); ?>">
                                <td><?php echo $track['track_number']; ?></td>
                                <td class="song-title"><?php echo htmlspecialchars($track['track_title']); ?></td>
                                <td class="duration"><?php echo htmlspecialchars($track['duration']); ?></td>
                                <td class="genre"><?php echo htmlspecialchars($genre); ?></td>
                                <td class="audio-cell">
                                    <?php if ($audioFile): ?>
                                        <audio controls>
                                            <source src="<?php echo htmlspecialchars($audioFile); ?>" type="audio/mpeg">
                                            Your browser does not support audio.
                                        </audio>
                                    <?php else: ?>
                                        <span class="no-audio">No audio</span>
                                    <?php endif; ?>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        <?php endforeach; ?>
    </div>
</main>

<script src="scripts/main.js"></script>
</body>
</html>