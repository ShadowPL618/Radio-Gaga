<?php
// Imperio Radio - PHP Functions

// Navigation function from database
function displayNavigation($pdo, $currentPage) {
    try {
        // Fetch navigation items
        $stmt = $pdo->query("SELECT * FROM navigation ORDER BY nav_order");
        $navItems = $stmt->fetchAll();
        
        // Build navigation HTML
        echo '<nav><ul>';
        
        foreach ($navItems as $item) {
            // Check if current page
            $activeClass = (basename($_SERVER['PHP_SELF']) == $item['nav_link']) ? 'active' : '';
            
            echo '<li>';
            echo '<a href="' . htmlspecialchars($item['nav_link']) . '" class="' . $activeClass . '">';
            echo htmlspecialchars($item['nav_name']);
            echo '</a>';
            echo '</li>';
        }
        
        echo '</ul></nav>';
        
    } catch(PDOException $e) {
        echo "Navigation error: " . $e->getMessage();
    }
}

// Get all artists info - FIXED COLUMN NAMES
function getArtistsInfo($pdo) {
    try {
        $stmt = $pdo->query("SELECT * FROM artist_info ORDER BY name");
        return $stmt->fetchAll();
    } catch(PDOException $e) {
        echo "Error fetching artists: " . $e->getMessage();
        return [];
    }
}

// Get popular artists - FIXED WITH DISTINCT
function getPopularArtists($pdo) {
    try {
        $stmt = $pdo->query("SELECT DISTINCT artist_id, artist_name, genre, debut_year, country, notable_work, youtube_link, wikipedia_link FROM popular_artists ORDER BY artist_name");
        return $stmt->fetchAll();
    } catch(PDOException $e) {
        echo "Error fetching popular artists: " . $e->getMessage();
        return [];
    }
}
?>