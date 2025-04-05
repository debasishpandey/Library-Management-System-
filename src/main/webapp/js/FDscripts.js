let currentRequestId = null;

function setCurrentRequest(requestId) {
    currentRequestId = requestId;
}

function submitFormWithDate() {
    const dateInput = document.getElementById('datepicker').value;
    if (!dateInput) {
        alert('Please select a return date!');
        return;
    }

    if (currentRequestId) {
        document.getElementById(`dueDate-${currentRequestId}`).value = dateInput;
        document.getElementById(`approveForm-${currentRequestId}`).submit();
    }
}




document.getElementById('searchReturnInput').addEventListener('input', function () {
    const searchValue = this.value.toLowerCase();
    const rows = document.querySelectorAll('#returnBookTable tbody tr');

    rows.forEach(row => {
        const studentName = row.cells[1].innerText.toLowerCase();
        row.style.display = studentName.includes(searchValue) ? '' : 'none';
    });
});

document.getElementById('searchDefaulterInput').addEventListener('input', function () {
    const searchValue = this.value.toLowerCase();
    const rows = document.querySelectorAll('#defaulterBookTable tbody tr');

    rows.forEach(row => {
        const studentName = row.cells[1].innerText.toLowerCase();
        row.style.display = studentName.includes(searchValue) ? '' : 'none';
    });
});




// const darkModeToggle = document.getElementById("darkModeToggle");
// darkModeToggle.addEventListener("change", function () {
//   document.body.classList.toggle("bg-dark");
//   document.body.classList.toggle("text-light");
//   document.querySelector(".navbar").classList.toggle("navbar-light");
//   document.querySelector(".navbar").classList.toggle("navbar-dark");
// });

const darkModeToggle = document.getElementById("darkModeToggle");
const navbar = document.querySelector(".navbar");
const manageBooksSection = document.getElementById("manageBooks");
const tableContainer = document.querySelector(".table-responsive");

// Function to apply dark mode
function applyDarkMode(isDark) {
    if (isDark) {
        document.body.classList.add("bg-dark", "text-light", "dark-mode");
        navbar.classList.add("navbar-dark");
        navbar.classList.remove("navbar-light");

        manageBooksSection.classList.add("bg-dark", "text-light");
        manageBooksSection.classList.remove("bg-light");
        tableContainer.classList.add("dark-mode");
        darkModeToggle.checked = true;
    } else {
        document.body.classList.remove("bg-dark", "text-light", "dark-mode");
        navbar.classList.remove("navbar-dark");
        navbar.classList.add("navbar-light");

        manageBooksSection.classList.remove("bg-dark", "text-light");
        manageBooksSection.classList.add("bg-light");
        tableContainer.classList.remove("dark-mode");
        darkModeToggle.checked = false;
    }
}

// Check saved preference
const isDarkMode = localStorage.getItem("darkMode") === "true";
applyDarkMode(isDarkMode);

// Handle toggle switch
darkModeToggle.addEventListener("change", function () {
    const isDark = darkModeToggle.checked;
    applyDarkMode(isDark);
    localStorage.setItem("darkMode", isDark);
});






    document.addEventListener("DOMContentLoaded", function() {
    let bookRows = document.querySelectorAll(".book-row");
    let showAllBtn = document.getElementById("showAllBtn");

    // Show button only if there are more than 10 books
    if (bookRows.length > 10) {
    showAllBtn.classList.remove("d-none");
}
});

    function showAllBooks() {
    document.querySelectorAll(".book-row").forEach(row => row.classList.remove("d-none"));
    document.getElementById("showAllBtn").classList.add("d-none"); // Hide the button after showing all books
}
