// Movie data
const movies = [
    {
        id: 1,
        title: "The Matrix Resurrections",
        genre: "Sci-Fi",
        rating: 4.5,
        image: "D:/Year 4 - semester 1/amr_frontend/matrix.jpg" // Path to Matrix image
    },
    {
        id: 2,
        title: "Dune: Part Two",
        genre: "Adventure",
        rating: 4.8,
        image: "D:/Year 4 - semester 1/amr_frontend/dune2.jpg" // Path to Dune image
    }
];

// Navigation
document.querySelectorAll('.nav-link').forEach(link => {
    link.addEventListener('click', () => {
        // Update active nav link
        document.querySelector('.nav-link.active').classList.remove('active');
        link.classList.add('active');

        // Show corresponding page
        const pageId = link.dataset.page;
        document.querySelector('.page.active').classList.remove('active');
        document.getElementById(pageId).classList.add('active');
    });
});

// Carousel
let currentSlide = 0;
const totalSlides = 3;

document.querySelector('.carousel-prev').addEventListener('click', () => {
    currentSlide = (currentSlide > 0) ? currentSlide - 1 : totalSlides - 1;
    updateCarousel();
});

document.querySelector('.carousel-next').addEventListener('click', () => {
    currentSlide = (currentSlide < totalSlides - 1) ? currentSlide + 1 : 0;
    updateCarousel();
});

function updateCarousel() {
    const carousel = document.querySelector('.carousel-img');
    carousel.style.opacity = '0';
    setTimeout(() => {
        // Check if the currentSlide is for the 'joker' image
        if (currentSlide === 0) {
            carousel.src = "D:/Year 4 - semester 1/amr_frontend/joker.jpg"; // Path to joker image
        } else if (currentSlide === 1) {
            carousel.src = "D:/Year 4 - semester 1/amr_frontend/matrix.jpg"; // Path for other slides (or placeholders)
        } else if (currentSlide === 2) {
            carousel.src = "D:/Year 4 - semester 1/amr_frontend/dune2.jpg"; // Another example for different slides
        }
        carousel.style.opacity = '1';
    }, 200);
}


// Movie rendering
function createMovieCard(movie) {
    return `
        <div class="movie-card">
            <img src="${movie.image}" alt="${movie.title}" class="movie-poster">
            <div class="movie-info">
                <h3 class="movie-title">${movie.title}</h3>
                <p class="movie-genre">${movie.genre}</p>
                <div class="movie-rating">
                    <span>★</span>
                    <span>${movie.rating}/5</span>
                </div>
            </div>
        </div>
    `;
}

// Populate movie grids
function populateMovies() {
    const currentMovies = document.getElementById('current-movies');
    const movieListings = document.getElementById('movie-listings');
    
    const movieCards = movies.map(createMovieCard).join('');
    
    if (currentMovies) currentMovies.innerHTML = movieCards;
    if (movieListings) movieListings.innerHTML = movieCards;
}

// Seat booking
const PRICE_PER_SEAT = 12;
let selectedSeats = [];

function createSeats() {
    const seatsContainer = document.getElementById('seats-container');
    if (!seatsContainer) return;

    for (let i = 0; i < 64; i++) {
        const seat = document.createElement('button');
        seat.className = 'seat';
        seat.textContent = `${String.fromCharCode(65 + Math.floor(i / 8))}${(i % 8) + 1}`;
        seat.addEventListener('click', () => {
            if (seat.classList.contains('selected')) {
                seat.classList.remove('selected');
                selectedSeats = selectedSeats.filter(s => s !== seat.textContent);
            } else {
                seat.classList.add('selected');
                selectedSeats.push(seat.textContent);
            }
        });
        seatsContainer.appendChild(seat);
    }
}

// Display selected seats and calculate price
function updateSeatSelection() {
    const selectedSeatsDisplay = document.getElementById('selected-seats');
    if (selectedSeatsDisplay) {
        selectedSeatsDisplay.textContent = selectedSeats.join(', ') || 'No seats selected';
    }
    const totalPrice = selectedSeats.length * PRICE_PER_SEAT;
    const totalPriceDisplay = document.getElementById('total-price');
    if (totalPriceDisplay) {
        totalPriceDisplay.textContent = `Total: $${totalPrice}`;
    }
}

// Initialize movie list and seats on page load
document.addEventListener('DOMContentLoaded', () => {
    populateMovies();
    createSeats();
});
