<?php
// Include database connection
require_once 'includes/db_connection.php';

// Include functions file
require_once 'includes/functions.php';

// Set page title
$page_title = 'Imperio Radio - Popular Artists';

// Include header
include 'includes/header.php';

// Get popular artists
$popularArtists = getPopularArtists($pdo);
?>

<main>
    <!-- Page heading -->
    <h1>Popular Artists</h1>
    
    <!-- Popular artists table -->
    <div class="table-container">
        <table class="popular-artists-table">
            <thead>
                <tr>
                    <th>Artist Name</th>
                    <th>Genre</th>
                    <th>Debut Year</th>
                    <th>Country</th>
                    <th>Notable Work</th>
                    <th>YouTube</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($popularArtists as $artist): ?>
                    <tr>
                        <!-- Artist name with wiki link -->
                        <td>
                            <a href="<?php echo htmlspecialchars($artist['wikipedia_link']); ?>" 
                               target="_blank" 
                               class="artist-link">
                                <?php echo htmlspecialchars($artist['artist_name']); ?>
                            </a>
                        </td>
                        <td><?php echo htmlspecialchars($artist['genre']); ?></td>
                        <td><?php echo htmlspecialchars($artist['debut_year']); ?></td>
                        <td><?php echo htmlspecialchars($artist['country']); ?></td>
                        <td><?php echo htmlspecialchars($artist['notable_work']); ?></td>
                        <!-- YouTube link with icon -->
                        <td class="youtube-cell">
                            <a href="<?php echo htmlspecialchars($artist['youtube_link']); ?>" 
                               target="_blank" 
                               class="youtube-link">
                                <img src="images/youtube-icon.png" 
                                     alt="YouTube" 
                                     class="youtube-icon">
                            </a>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</main>

<script src="scripts/main.js"></script>
</body>
</html>