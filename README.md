# Radio-GagaA themed, database-driven web radio application dedicated to the chronicles and music of the Legion. This platform allows users to explore artists, manage playlists, and stream "Legion Tracks" via an integrated multimedia player.

🏛️ Project Overview
Imperio Radio is a full-stack PHP web application that combines a deep aesthetic theme with functional database management. It serves as a digital archive for "Legion-approved" music and artist information, featuring a responsive design and interactive JavaScript elements.

🛠️ Key Features
1. Multimedia Archive (playlist.php)
Integrated Video Player: A centralized player that updates dynamically when a track is selected.

Audio Streaming: Individual audio controls for every track in the archive.

Dynamic Loading: Uses JavaScript to swap sources without page reloads, providing a smooth user experience.

2. Artist Database (artists.php & popular_artists.php)
Relational Data: Fetches and displays artist biographies, genres, and debut years from the radiogaga database.

External Integration: Links directly to Wikipedia for historical context and YouTube for music videos.

Top 3 Songs: Specifically highlights the most notable works for each composer.

3. Interactive Contact System (contact.php)
Feedback Loop: A validated form allowing users to send messages to the station.

Dynamic Response: Personalizes the "Thank You" experience by capturing and reflecting user input (First Name/Last Name) upon submission.

4. Database-Driven Navigation
Auto-Generated Gallery: The homepage (index.php) automatically generates artist cards and track counts by querying the database, ensuring the UI stays updated as the library grows.

🎨 Design & UX
Themed UI: A "Legion Red" gradient aesthetic using custom CSS inspired by classical and post-apocalyptic motifs.

Responsive Layout: Built with Flexbox, ensuring the radio station is accessible on desktops, tablets, and mobile devices.

Interactive Effects: Custom JavaScript (main.js) handles hover animations and smooth scrolling to the media player.

📂 Technical Stack
Backend: PHP 8.x with PDO (PHP Data Objects) for secure database interactions.

Database: MySQL/MariaDB (radiogaga.sql) featuring relational tables for artists, albums, tracks, and playlists.

Frontend: HTML5, CSS3 (Advanced Gradients & Flexbox), and Vanilla JavaScript.

🚀 Setup Instructions
Database: Import radiogaga.sql into your local MySQL server (e.g., via phpMyAdmin).

Connection: Update includes/db_connection.php with your local database credentials.

Web Server: Place the project files in your htdocs or www folder and access via localhost.

/project-root
│
├── /css                 # Stylesheets (styles.css)
├── /js                  # Frontend logic (main.js)
├── /includes            # PHP core logic (db_connection.php, functions.php)
├── /playlists           # Individual artist-specific PHP files
├── /assets              # Media files (images, audio, video)
├── /sql                 # Database exports (radiogaga.sql)
├── index.php            # Homepage
├── artists.php          # Full artist directory
├── playlist.php         # Main track player
└── contact.php          # Contact & feedback form
