// Imperio Radio - Main JavaScript

document.addEventListener('DOMContentLoaded', function() {
    
    // Get video elements
    const mainVideo = document.getElementById('mainVideo');
    const currentTitle = document.getElementById('currentTitle');
    const currentArtist = document.getElementById('currentArtist');
    const trackRows = document.querySelectorAll('.track-row');
    
    // Check if video player exists
    if (mainVideo && trackRows.length > 0) {
        
        // Add click event to each track
        trackRows.forEach(row => {
            row.addEventListener('click', function() {
                
                // Stop all audio players first
                const allAudioPlayers = document.querySelectorAll('audio');
                allAudioPlayers.forEach(audio => {
                    audio.pause();
                    audio.currentTime = 0;
                });
                
                // Get track data from row
                const videoFile = this.getAttribute('data-video');
                const title = this.getAttribute('data-title');
                const artist = this.getAttribute('data-artist');
                
                // Only play if video file exists
                if (videoFile && videoFile.trim() !== '') {
                    // Update video source
                    mainVideo.src = videoFile;
                    
                    // Update info display
                    currentTitle.textContent = title;
                    currentArtist.textContent = artist;
                    
                    // Play video
                    mainVideo.load();
                    mainVideo.play();
                    
                    // Remove active class from all rows
                    trackRows.forEach(r => r.classList.remove('active-track'));
                    
                    // Add active class to clicked row
                    this.classList.add('active-track');
                    
                    // Scroll to video player
                    document.querySelector('.video-player-container').scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });
        
        // Pause audio when video plays
        mainVideo.addEventListener('play', function() {
            const allAudioPlayers = document.querySelectorAll('audio');
            allAudioPlayers.forEach(audio => {
                audio.pause();
            });
        });
    }
    
    // Artist card hover effects
    const artistCards = document.querySelectorAll('.artist-card');
    
    artistCards.forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-10px) scale(1.02)';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0) scale(1)';
        });
    });
    
});

// Add active track styling
const style = document.createElement('style');
style.textContent = `
    .active-track {
        background-color: #4a0000 !important;
        border-left: 4px solid #d4af37;
    }
`;
document.head.appendChild(style);