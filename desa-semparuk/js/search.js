const params = new URLSearchParams(window.location.search);
const keyword = (params.get("q") || "").toLowerCase();

const keywordTitle = document.getElementById("keywordTitle");
const resultCount = document.getElementById("resultCount");
const resultBox = document.getElementById("searchResults");
const empty = document.getElementById("emptyResult");

keywordTitle.textContent = keyword || "Semua";

const results = searchData.filter(item =>
    item.keyword.some(k =>
        k.toLowerCase().includes(keyword)
    )
);

resultCount.textContent = results.length;

if(results.length === 0){

    empty.style.display = "block";

}else{

    results.forEach(item=>{

        resultBox.innerHTML += `
        <a href="${item.page}" class="result-card">

           <img src="${item.image}" class="result-thumb" alt="${item.title}">

            <div class="result-info">

                <span>${item.category}</span>

                <h3>${item.title}</h3>

                <p>Klik untuk membuka halaman terkait.</p>

            </div>

            <i class="fa-solid fa-arrow-right result-arrow"></i>

        </a>
        `;

    });

}

// ===============================
// SARAN PENCARIAN
// ===============================

const input = document.getElementById("searchInput");
const searchBtn = document.getElementById("searchBtn");

document.querySelectorAll(".suggestion").forEach(tag => {

    tag.addEventListener("click", () => {

        input.value = tag.textContent;
        input.focus();

    });

});

searchBtn.addEventListener("click", () => {

    const value = input.value.trim();

    if(value !== ""){
        window.location.href =
        `search.html?q=${encodeURIComponent(value)}`;
    }

});

input.addEventListener("keypress", (e) => {

    if(e.key === "Enter"){

        const value = input.value.trim();

        if(value !== ""){
            window.location.href =
            `search.html?q=${encodeURIComponent(value)}`;
        }

    }

});