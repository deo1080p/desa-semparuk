// ===============================
// STICKY NAVBAR
// ===============================

const header = document.querySelector("header");

window.addEventListener("scroll", () => {
    if (!header) return;

    header.style.background =
        window.scrollY > 50
            ? "#166534"
            : "rgba(22,101,52,.95)";
});

// ===============================
// SEARCH WEBSITE
// ===============================

const input = document.getElementById("searchInput");
const button = document.getElementById("searchBtn");

function searchWebsite() {

    if (!input) return;

    const keyword = input.value.toLowerCase().trim();

    if (keyword === "") {
        alert("Silakan masukkan kata kunci.");
        return;
    }

    const result = searchData.find(item =>
        item.keyword.some(k =>
            k.toLowerCase().includes(keyword)
        )
    );

    if (result) {
        window.location.href = `search.html?q=${encodeURIComponent(keyword)}`;
    } else {
        alert("Maaf, informasi tidak ditemukan.");
    }
}

button?.addEventListener("click", searchWebsite);

input?.addEventListener("keypress", (e) => {
    if (e.key === "Enter") {
        searchWebsite();
    }
});

// ===============================
// ANIMASI SCROLL
// ===============================

const animatedCards = document.querySelectorAll(
    ".stat-card, .menu-card, .potensi-card, .news-card, .facility-card, .service-card, .geo-card, .staff-card"
);

const observer = new IntersectionObserver((entries) => {

    entries.forEach(entry => {

        if (entry.isIntersecting) {
            entry.target.classList.add("show");
        }

    });

}, {
    threshold: 0.08,
    rootMargin: "0px 0px -40px 0px"
});

animatedCards.forEach(card => {
    card.classList.add("hidden");
    observer.observe(card);
});

// ===============================
// PORTAL BERITA
// ===============================

document.addEventListener("DOMContentLoaded", () => {

    const buttons = document.querySelectorAll(".kategori-btn");
    const newsCards = document.querySelectorAll(".news-card");

    if (buttons.length === 0) return;

    const featuredImage = document.getElementById("featuredImage");
    const featuredBadge = document.getElementById("featuredBadge");
    const featuredTitle = document.getElementById("featuredTitle");
    const featuredDate = document.getElementById("featuredDate");
    const featuredDesc = document.getElementById("featuredDesc");

    const featured = {

        semua: {
            img: "img/berita/panen-raya.jpg",
            badge: "PERTANIAN",
            title: "Panen Raya Persawahan Desa Semparuk",
            date: "25 Agustus 2026",
            desc: "Musim panen menjadi momen penting bagi masyarakat Desa Semparuk."
        },

        pertanian: {
            img: "img/berita/panen-raya.jpg",
            badge: "PERTANIAN",
            title: "Panen Raya Persawahan Desa Semparuk",
            date: "25 Agustus 2026",
            desc: "Musim panen menjadi momen penting bagi masyarakat Desa Semparuk."
        },

        kegiatan: {
            img: "img/berita/gotong-royong.jpg",
            badge: "KEGIATAN",
            title: "Gotong Royong Membersihkan Parit Desa",
            date: "28 Agustus 2026",
            desc: "Warga bersama menjaga kebersihan lingkungan dan parit desa."
        },

        pengumuman: {
            img: "img/berita/pengumuman.jpg",
            badge: "PENGUMUMAN",
            title: "Kapolsek Semparuk Jadi Inspektur Upacara Penurunan Bendera",
            date: "18 Agustus 2026",
            desc: "Peringati HUT RI Ke 81, Kapolsek Semparuk Jadi Inspektur Upacara Penurunan Bendera Di Kantor Camat Semparuk"
        }

    };

    buttons.forEach(btn => {

        btn.addEventListener("click", () => {

            buttons.forEach(b => b.classList.remove("active"));
            btn.classList.add("active");

            const filter = btn.dataset.filter;

            // Ganti berita unggulan
            featuredImage.src = featured[filter].img;
            featuredBadge.textContent = featured[filter].badge;
            featuredTitle.textContent = featured[filter].title;
            featuredDate.textContent = featured[filter].date;
            featuredDesc.textContent = featured[filter].desc;

            // Filter berita terbaru
            newsCards.forEach(card => {

                if (filter === "semua" || card.dataset.category === filter) {
                    card.style.display = "";
                } else {
                    card.style.display = "none";
                }

            });

        });

    });

});