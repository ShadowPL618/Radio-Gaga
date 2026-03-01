-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2026 at 05:26 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `radiogaga`
--

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `album_id` int(3) NOT NULL,
  `album_title` varchar(255) NOT NULL,
  `artist_id` int(3) NOT NULL,
  `release_year` year(4) NOT NULL,
  `cover_image` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`album_id`, `album_title`, `artist_id`, `release_year`, `cover_image`) VALUES
(1, 'Awake', 1, '2009', 'images/awake.jpg'),
(2, 'Victorious', 1, '2019', 'images/victorious.jpg'),
(3, 'Legends', 2, '2024', 'images/legends.jpg'),
(4, 'Primo Victoria', 2, '2005', 'images/primovictoria.jpg'),
(5, 'Hybrid Theory', 3, '2000', 'images/hybridtheory.jpg'),
(6, 'Meteora', 3, '2003', 'images/meteora.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `artist_id` int(11) NOT NULL,
  `artist_name` varchar(100) NOT NULL,
  `artist_image` varchar(255) DEFAULT NULL,
  `artist_bio` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`artist_id`, `artist_name`, `artist_image`, `artist_bio`, `created_at`) VALUES
(1, 'Skillet', 'images/skillet.jpg', 'American Christian rock band formed in Memphis, Tennessee', '2026-01-20 08:06:03'),
(2, 'Sabaton', 'images/sabaton.jpg', 'Swedish heavy metal band with military history themes', '2026-01-20 08:06:03'),
(3, 'Linkin Park', 'images/linkinpark.jpg', 'American rock band known for nu-metal and alternative rock', '2026-01-20 08:06:03');

-- --------------------------------------------------------

--
-- Table structure for table `artist_info`
--

CREATE TABLE `artist_info` (
  `artist_id` int(3) NOT NULL,
  `name` text NOT NULL,
  `description` varchar(250) NOT NULL,
  `image` text NOT NULL,
  `top_song_1` varchar(100) DEFAULT NULL,
  `top_song_2` varchar(100) DEFAULT NULL,
  `top_song_3` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artist_info`
--

INSERT INTO `artist_info` (`artist_id`, `name`, `description`, `image`, `top_song_1`, `top_song_2`, `top_song_3`) VALUES
(1, 'Skillet', 'American Christian rock band known for powerful anthems and symphonic rock elements', 'images/skillet.jpg', 'Monster', 'Hero', 'Awake and Alive'),
(2, 'Sabaton', 'Swedish power metal band famous for their historical war-themed lyrics and costumes\r\n', 'images/sabaton.jpg', 'Bismarck', 'The Last Stand', 'Ghost Division'),
(3, 'Linkin Park', 'Legendary nu-metal band blending rock, rap, and electronic elements', 'images/linkinpark.jpg', 'In the End', 'Numb', 'What I\'ve Done');

-- --------------------------------------------------------

--
-- Table structure for table `navigation`
--

CREATE TABLE `navigation` (
  `nav_id` int(11) NOT NULL,
  `nav_name` varchar(50) NOT NULL,
  `nav_link` varchar(100) NOT NULL,
  `nav_order` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `navigation`
--

INSERT INTO `navigation` (`nav_id`, `nav_name`, `nav_link`, `nav_order`, `created_at`) VALUES
(1, 'Home', 'index.php', 1, '2026-01-20 07:59:02'),
(2, 'Artists', 'artists.php', 2, '2026-01-20 07:59:02'),
(3, 'Popular Artists', 'popular_artists.php', 3, '2026-01-20 07:59:02'),
(4, 'Tracks', 'playlist.php', 4, '2026-01-20 07:59:02'),
(5, 'Contact', 'contact.php', 5, '2026-01-20 07:59:02');

-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

CREATE TABLE `playlists` (
  `playlist_id` int(3) NOT NULL,
  `playlist_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `playlists`
--

INSERT INTO `playlists` (`playlist_id`, `playlist_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Epic Rock Anthems', 'Powerful rock songs to pump you up', '2025-12-10 08:37:06', '2025-12-10 08:37:06'),
(2, 'Sabaton War Stories', 'Historical battles brought to life through metal', '2025-12-10 08:37:06', '2025-12-10 08:37:06');

-- --------------------------------------------------------

--
-- Table structure for table `playlist_tracks`
--

CREATE TABLE `playlist_tracks` (
  `playlist_track_id` int(3) NOT NULL,
  `playlist_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `playlist_tracks`
--

INSERT INTO `playlist_tracks` (`playlist_track_id`, `playlist_id`, `track_id`, `position`, `added_at`) VALUES
(1, 1, 1, 1, '2025-12-10 08:38:07'),
(2, 1, 3, 2, '2025-12-10 08:38:07'),
(3, 1, 10, 3, '2025-12-10 08:38:07'),
(4, 1, 11, 4, '2025-12-10 08:38:07'),
(5, 2, 5, 1, '2025-12-10 08:38:07'),
(6, 2, 6, 2, '2025-12-10 08:38:07'),
(7, 2, 7, 3, '2025-12-10 08:38:07'),
(8, 2, 8, 4, '2025-12-10 08:38:07');

-- --------------------------------------------------------

--
-- Table structure for table `popular_artists`
--

CREATE TABLE `popular_artists` (
  `artist_id` int(11) NOT NULL,
  `artist_name` varchar(255) NOT NULL,
  `genre` varchar(100) NOT NULL,
  `debut_year` year(4) NOT NULL,
  `country` varchar(100) NOT NULL,
  `notable_work` varchar(255) DEFAULT NULL,
  `youtube_link` varchar(255) DEFAULT NULL,
  `wikipedia_link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `popular_artists`
--

INSERT INTO `popular_artists` (`artist_id`, `artist_name`, `genre`, `debut_year`, `country`, `notable_work`, `youtube_link`, `wikipedia_link`) VALUES
(1, 'The Beatles', 'Rock', '1960', 'United Kingdom', 'Hey Jude', 'https://www.youtube.com/watch?v=A_MjCqQoLLA', 'https://en.wikipedia.org/wiki/The_Beatles'),
(2, 'Elvis Presley', 'Rock and Roll', '1954', 'United States', 'Jailhouse Rock', 'https://www.youtube.com/watch?v=gj0Rz-uP4Mk', 'https://en.wikipedia.org/wiki/Elvis_Presley'),
(3, 'Michael Jackson', 'Pop', '1964', 'United States', 'Thriller', 'https://www.youtube.com/watch?v=sOnqjkJTMaA', 'https://en.wikipedia.org/wiki/Michael_Jackson'),
(4, 'Madonna', 'Pop', '1982', 'United States', 'Like a Prayer', 'https://www.youtube.com/watch?v=79fzeNUqQbQ', 'https://en.wikipedia.org/wiki/Madonna_(entertainer)'),
(5, 'Elton John', 'Rock', '1962', 'United Kingdom', 'Your Song', 'https://www.youtube.com/watch?v=GlPlfCy1urI', 'https://en.wikipedia.org/wiki/Elton_John'),
(6, 'Queen', 'Rock', '1970', 'United Kingdom', 'Bohemian Rhapsody', 'https://www.youtube.com/watch?v=fJ9rUzIMcZQ', 'https://en.wikipedia.org/wiki/Queen_(band)'),
(7, 'Pink Floyd', 'Progressive Rock', '1965', 'United Kingdom', 'Comfortably Numb', 'https://www.youtube.com/watch?v=_FrOQC-zEog', 'https://en.wikipedia.org/wiki/Pink_Floyd'),
(8, 'Led Zeppelin', 'Hard Rock', '1968', 'United Kingdom', 'Stairway to Heaven', 'https://www.youtube.com/watch?v=QkF3oxziUI4', 'https://en.wikipedia.org/wiki/Led_Zeppelin'),
(9, 'Nirvana', 'Grunge', '1987', 'United States', 'Smells Like Teen Spirit', 'https://www.youtube.com/watch?v=hTWKbfoikeg', 'https://en.wikipedia.org/wiki/Nirvana_(band)'),
(10, 'The Rolling Stones', 'Rock', '1962', 'United Kingdom', '(I Can’t Get No) Satisfaction', 'https://www.youtube.com/watch?v=nrIPxlFzDi0', 'https://en.wikipedia.org/wiki/The_Rolling_Stones'),
(11, 'Bob Dylan', 'Folk', '1961', 'United States', 'Like a Rolling Stone', 'https://www.youtube.com/watch?v=IwOfCgkyEj0', 'https://en.wikipedia.org/wiki/Bob_Dylan'),
(12, 'U2', 'Rock', '1976', 'Ireland', 'One', 'https://www.youtube.com/watch?v=ftjEcrrf7r0', 'https://en.wikipedia.org/wiki/U2'),
(13, 'Beyoncé', 'Pop', '1997', 'United States', 'Halo', 'https://www.youtube.com/watch?v=bnVUHWCynig', 'https://en.wikipedia.org/wiki/Beyonc%C3%A9'),
(14, 'Adele', 'Pop', '2006', 'United Kingdom', 'Someone Like You', 'https://www.youtube.com/watch?v=hLQl3WQQoQ0', 'https://en.wikipedia.org/wiki/Adele'),
(15, 'Coldplay', 'Alternative Rock', '1996', 'United Kingdom', 'Fix You', 'https://www.youtube.com/watch?v=k4V3Mo61fJM', 'https://en.wikipedia.org/wiki/Coldplay'),
(16, 'The Beach Boys', 'Rock', '1961', 'United States', 'Good Vibrations', 'https://www.youtube.com/watch?v=mdt0SOqPJcg', 'https://en.wikipedia.org/wiki/The_Beach_Boys'),
(17, 'Prince', 'Pop', '1978', 'United States', 'Purple Rain', 'https://www.youtube.com/watch?v=TvnYmWpD_T8', 'https://en.wikipedia.org/wiki/Prince_(musician)'),
(18, 'David Bowie', 'Rock', '1962', 'United Kingdom', 'Heroes', 'https://www.youtube.com/watch?v=Tgcc5V9Hu3g', 'https://en.wikipedia.org/wiki/David_Bowie'),
(19, 'Rihanna', 'Pop', '2005', 'Barbados', 'Umbrella', 'https://www.youtube.com/watch?v=CvBfHwUxHIk', 'https://en.wikipedia.org/wiki/Rihanna'),
(20, 'Taylor Swift', 'Pop', '2006', 'United States', 'Shake It Off', 'https://www.youtube.com/watch?v=nfWlot6h_JM', 'https://en.wikipedia.org/wiki/Taylor_Swift'),
(21, 'Drake', 'Hip Hop', '2001', 'Canada', 'Hotline Bling', 'https://www.youtube.com/watch?v=uxpDa-c-4Mc', 'https://en.wikipedia.org/wiki/Drake_(musician)'),
(22, 'Kanye West', 'Hip Hop', '2003', 'United States', 'Stronger', 'https://www.youtube.com/watch?v=PsO6ZnUZI0g', 'https://en.wikipedia.org/wiki/Kanye_West'),
(23, 'Jay-Z', 'Hip Hop', '1996', 'United States', 'Empire State of Mind', 'https://www.youtube.com/watch?v=0UjsXo9l6I8', 'https://en.wikipedia.org/wiki/Jay-Z'),
(24, 'Eminem', 'Hip Hop', '1996', 'United States', 'Lose Yourself', 'https://www.youtube.com/watch?v=_Yhyp-_hX2s', 'https://en.wikipedia.org/wiki/Eminem'),
(25, 'Whitney Houston', 'Pop', '1985', 'United States', 'I Will Always Love You', 'https://www.youtube.com/watch?v=3JWTaaS7LdU', 'https://en.wikipedia.org/wiki/Whitney_Houston'),
(26, 'Celine Dion', 'Pop', '1981', 'Canada', 'My Heart Will Go On', 'https://www.youtube.com/watch?v=WNIPqafd4As', 'https://en.wikipedia.org/wiki/Celine_Dion'),
(27, 'Maroon 5', 'Pop Rock', '2001', 'United States', 'Sugar', 'https://www.youtube.com/watch?v=09R8_2nJtjg', 'https://en.wikipedia.org/wiki/Maroon_5'),
(28, 'The Weeknd', 'R&B', '2010', 'Canada', 'Blinding Lights', 'https://www.youtube.com/watch?v=4NRXx6U8ABQ', 'https://en.wikipedia.org/wiki/The_Weeknd'),
(29, 'Ed Sheeran', 'Pop', '2011', 'United Kingdom', 'Shape of You', 'https://www.youtube.com/watch?v=JGwWNGJdvx8', 'https://en.wikipedia.org/wiki/Ed_Sheeran'),
(30, 'Bruno Mars', 'Pop', '2004', 'United States', 'Just the Way You Are', 'https://www.youtube.com/watch?v=LjhCEhWiKXk', 'https://en.wikipedia.org/wiki/Bruno_Mars'),
(31, 'Justin Bieber', 'Pop', '2009', 'Canada', 'Sorry', 'https://www.youtube.com/watch?v=fRh_vgS2dFE', 'https://en.wikipedia.org/wiki/Justin_Bieber'),
(32, 'Katy Perry', 'Pop', '2001', 'United States', 'Firework', 'https://www.youtube.com/watch?v=QGJuMBdaqIw', 'https://en.wikipedia.org/wiki/Katy_Perry'),
(33, 'Shakira', 'Pop', '1990', 'Colombia', 'Hips Don’t Lie', 'https://www.youtube.com/watch?v=DUT5rEU6pqM', 'https://en.wikipedia.org/wiki/Shakira'),
(34, 'Lady Gaga', 'Pop', '2008', 'United States', 'Bad Romance', 'https://www.youtube.com/watch?v=qrO4YZeyl0I', 'https://en.wikipedia.org/wiki/Lady_Gaga'),
(35, 'Harry Styles', 'Pop', '2010', 'United Kingdom', 'Sign of the Times', 'https://www.youtube.com/watch?v=qN4ooNx77u0', 'https://en.wikipedia.org/wiki/Harry_Styles'),
(36, 'Sam Smith', 'Pop', '2012', 'United Kingdom', 'Stay With Me', 'https://www.youtube.com/watch?v=pB-5XG-DbAA', 'https://en.wikipedia.org/wiki/Sam_Smith'),
(37, 'Ariana Grande', 'Pop', '2008', 'United States', 'Thank U, Next', 'https://www.youtube.com/watch?v=gl1aHhXnN1k', 'https://en.wikipedia.org/wiki/Ariana_Grande'),
(38, 'Post Malone', 'Hip Hop', '2015', 'United States', 'Circles', 'https://www.youtube.com/watch?v=wXhTHyIgQ_U', 'https://en.wikipedia.org/wiki/Post_Malone'),
(39, 'Billie Eilish', 'Pop', '2015', 'United States', 'Bad Guy', 'https://www.youtube.com/watch?v=DyDfgMOUjCI', 'https://en.wikipedia.org/wiki/Billie_Eilish'),
(40, 'Dua Lipa', 'Pop', '2015', 'United Kingdom', 'Don’t Start Now', 'https://www.youtube.com/watch?v=oygrmJFKYZY', 'https://en.wikipedia.org/wiki/Dua_Lipa'),
(41, 'Imagine Dragons', 'Alternative Rock', '2008', 'United States', 'Radioactive', 'https://www.youtube.com/watch?v=ktvTqknDobU', 'https://en.wikipedia.org/wiki/Imagine_Dragons'),
(42, 'The Killers', 'Alternative Rock', '2001', 'United States', 'Mr. Brightside', 'https://www.youtube.com/watch?v=gGdGFtwCNBE', 'https://en.wikipedia.org/wiki/The_Killers'),
(43, 'Green Day', 'Punk Rock', '1987', 'United States', 'Boulevard of Broken Dreams', 'https://www.youtube.com/watch?v=Soa3gO7tL-c', 'https://en.wikipedia.org/wiki/Green_Day'),
(44, 'Foo Fighters', 'Rock', '1994', 'United States', 'Everlong', 'https://www.youtube.com/watch?v=eBG7P-K-r1Y', 'https://en.wikipedia.org/wiki/Foo_Fighters'),
(45, 'Linkin Park', 'Nu Metal', '1996', 'United States', 'In the End', 'https://www.youtube.com/watch?v=eVTXPUF4Oz4', 'https://en.wikipedia.org/wiki/Linkin_Park'),
(46, 'Red Hot Chili Peppers', 'Funk Rock', '1983', 'United States', 'Californication', 'https://www.youtube.com/watch?v=YlUKcNNmywk', 'https://en.wikipedia.org/wiki/Red_Hot_Chili_Peppers'),
(47, 'Metallica', 'Heavy Metal', '1981', 'United States', 'Enter Sandman', 'https://www.youtube.com/watch?v=CD-E-LDc384', 'https://en.wikipedia.org/wiki/Metallica'),
(48, 'AC/DC', 'Hard Rock', '1973', 'Australia', 'Back in Black', 'https://www.youtube.com/watch?v=pAgnJDJN4VA', 'https://en.wikipedia.org/wiki/AC/DC'),
(49, 'Bon Jovi', 'Rock', '1983', 'United States', 'Livin’ on a Prayer', 'https://www.youtube.com/watch?v=lDK9QqIzhwk', 'https://en.wikipedia.org/wiki/Bon_Jovi'),
(50, 'ABBA', 'Pop', '1972', 'Sweden', 'Dancing Queen', 'https://www.youtube.com/watch?v=xFrGuyw1V8s', 'https://en.wikipedia.org/wiki/ABBA');

-- --------------------------------------------------------

--
-- Table structure for table `tracks`
--

CREATE TABLE `tracks` (
  `track_id` int(3) NOT NULL,
  `track_title` varchar(255) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `audio_file` varchar(255) DEFAULT NULL,
  `video_file` varchar(255) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `file_path` varchar(500) NOT NULL,
  `track_number` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tracks`
--

INSERT INTO `tracks` (`track_id`, `track_title`, `artist_id`, `album_id`, `duration`, `audio_file`, `video_file`, `genre`, `file_path`, `track_number`, `created_at`) VALUES
(1, 'Monster', 1, 1, 187, 'audio/monster.mp3', 'video/monster.mp4', 'Rock', 'audio/monster.mp3', 1, '2025-12-10 08:36:39'),
(2, 'Hero', 1, 1, 196, 'audio/hero.mp3', 'video/hero.mp4', 'Rock', 'audio/hero.mp3', 2, '2025-12-10 08:36:39'),
(3, 'Legendary', 1, 2, 256, 'audio/legendary.mp3', 'video/legendary.mp4', 'Rock', 'audio/legendary.mp3', 1, '2025-12-10 08:36:39'),
(4, 'Anchor', 1, 2, 217, 'audio/anchor.mp3', 'video/anchor.mp4', 'Rock', 'audio/anchor.mp3', 2, '2025-12-10 08:36:39'),
(5, 'Dreadnought', 2, 4, 298, 'audio/dreadnought.mp3', 'video/dreadnought.mp4', 'Metal', 'audio/dreadnought.mp3', 1, '2025-12-10 08:36:39'),
(6, 'Crossing the Rubicon', 2, 3, 296, 'audio/crossingtherubicon.mp3', 'video/crossingtherubicon.mp4', 'Metal', 'audio/crossingtherubicon.mp3', 2, '2025-12-10 08:36:39'),
(7, 'Lighting at the Gates', 2, 3, 260, 'audio/lightningatthegates.mp3', 'video/lightningatthegates.mp4', 'Metal', 'audio/lightningatthegates.mp3', 3, '2025-12-10 08:36:39'),
(8, 'Wolfpack', 2, 4, 354, 'audio/wolfpack.mp3', 'video/wolfpack.mp4', 'Metal', 'audio/wolfpack.mp3', 1, '2025-12-10 08:36:39'),
(9, 'Counterstrike', 2, 4, 228, 'audio/counterstrike.mp3', 'video/counterstrike.mp4', 'Metal', 'audio/counterstrike.mp3', 2, '2025-12-10 08:36:39'),
(10, 'In the End', 3, 5, 218, 'audio/in-the-end.mp3', 'video/in-the-end.mp4', 'Nu-Metal', 'audio/in-the-end.mp3', 1, '2025-12-10 08:36:39'),
(11, 'Numb', 3, 5, 187, 'audio/numb.mp3', 'video/numb.mp4', 'Nu-Metal', 'audio/numb.mp3', 2, '2025-12-10 08:36:39'),
(12, 'Somewhere I Belong', 3, 6, 225, 'audio/somewhere-i-belong.mp3', 'video/somewhere-i-belong.mp4', 'Nu-Metal', 'audio/somewhere-i-belong.mp3', 1, '2025-12-10 08:36:39'),
(13, 'Breaking the Habit', 3, 6, 197, 'audio/breaking-the-habit.mp3', 'video/breaking-the-habit.mp4', 'Alternative Rock', 'audio/breaking-the-habit.mp3', 2, '2025-12-10 08:36:39'),
(14, 'Bismarck', 2, 4, 369, 'audio/bismarck.mp3', 'video/bismarck.mp4', 'Metal', '', 2, '2026-01-20 08:32:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`album_id`),
  ADD KEY `artist_id` (`artist_id`);

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`artist_id`);

--
-- Indexes for table `artist_info`
--
ALTER TABLE `artist_info`
  ADD PRIMARY KEY (`artist_id`);

--
-- Indexes for table `navigation`
--
ALTER TABLE `navigation`
  ADD PRIMARY KEY (`nav_id`);

--
-- Indexes for table `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`playlist_id`);

--
-- Indexes for table `playlist_tracks`
--
ALTER TABLE `playlist_tracks`
  ADD PRIMARY KEY (`playlist_track_id`),
  ADD UNIQUE KEY `unique_track_position` (`playlist_id`,`position`),
  ADD KEY `track_id` (`track_id`);

--
-- Indexes for table `popular_artists`
--
ALTER TABLE `popular_artists`
  ADD PRIMARY KEY (`artist_id`);

--
-- Indexes for table `tracks`
--
ALTER TABLE `tracks`
  ADD PRIMARY KEY (`track_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `album_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `artists`
--
ALTER TABLE `artists`
  MODIFY `artist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `artist_info`
--
ALTER TABLE `artist_info`
  MODIFY `artist_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `navigation`
--
ALTER TABLE `navigation`
  MODIFY `nav_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `playlists`
--
ALTER TABLE `playlists`
  MODIFY `playlist_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `playlist_tracks`
--
ALTER TABLE `playlist_tracks`
  MODIFY `playlist_track_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `popular_artists`
--
ALTER TABLE `popular_artists`
  MODIFY `artist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `tracks`
--
ALTER TABLE `tracks`
  MODIFY `track_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `albums_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artist_info` (`artist_id`) ON DELETE CASCADE;

--
-- Constraints for table `playlist_tracks`
--
ALTER TABLE `playlist_tracks`
  ADD CONSTRAINT `playlist_tracks_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`playlist_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `playlist_tracks_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`track_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
