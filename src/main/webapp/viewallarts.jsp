<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Spring Boot Artworks</title>
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        /* Search bar styling */
        .search-bar {
            text-align: center;
            margin-bottom: 20px;
        }

        .search-bar input {
            width: 300px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        /* Card container styling */
        #cardContainer {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
            margin-left: 300px;
        }

        .card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            cursor: pointer; /* Makes the whole card clickable */
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
        }

        .card img {
            width: 100%;
            height: 300px;
            object-fit: cover;
        }

        .card-content {
            padding: 15px;
        }

        .card-content h4 {
            margin: 0;
            font-size: 18px;
            font-weight: bold;
        }

        .card-content p {
            font-size: 14px;
            color: #555;
        }

        /* Modal styling */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.7);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: white;
            width: 60%;
            padding: 20px;
            border-radius: 8px;
            position: relative;
        }

        .modal-content img {
            width: 100%;
            height: auto;
        }

        .close {
            position: absolute;
            top: 10px;
            right: 10px;
            color: #aaa;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
        }
    </style>

    <script>
        // Function to open modal with artwork details when a card is clicked
        function openModal(artworkId) {
            var modal = document.getElementById("myModal");
            var modalContent = document.getElementById("modalContent");

            // Get the artwork data using the artworkId (you can pass data dynamically from your JSP)
            var artworkData = document.getElementById("artworkData_" + artworkId);
            var imageSrc = artworkData.getAttribute("data-image");
            var title = artworkData.getAttribute("data-title");
            var artist = artworkData.getAttribute("data-artist");
            var year = artworkData.getAttribute("data-year");
            var dimensions = artworkData.getAttribute("data-dimensions");
            var price = artworkData.getAttribute("data-price");
            var status = artworkData.getAttribute("data-status");

            // Set the modal content
            modalContent.innerHTML = `
                <span class="close" onclick="closeModal()">&times;</span>
                <img src="${imageSrc}" alt="${title}">
                <h3>${title}</h3>
                <p><strong>Artist:</strong> ${artist}</p>
                <p><strong>Year Created:</strong> ${year}</p>
                <p><strong>Dimensions:</strong> ${dimensions}</p>
                <p><strong>Price:</strong> $${price}</p>
                <p><strong>Status:</strong> ${status}</p>
            `;

            modal.style.display = "block";
        }

        // Function to close the modal
        function closeModal() {
            var modal = document.getElementById("myModal");
            modal.style.display = "none";
        }

        // Search functionality
        function searchArtworks() {
            var input = document.getElementById("searchInput").value.toLowerCase();
            var artworks = document.querySelectorAll(".card");
            
            artworks.forEach(function (artwork) {
                var title = artwork.querySelector("h4").textContent.toLowerCase();
                if (title.includes(input)) {
                    artwork.style.display = "block";
                } else {
                    artwork.style.display = "none";
                }
            });
        }
    </script>
</head>

<body>

<%@ include file="artistnavbar.jsp" %>

<h3 align="center"><u>View All Artworks</u></h3>

<!-- Search Bar -->
<div class="search-bar">
    <input type="text" id="searchInput" onkeyup="searchArtworks()" placeholder="Search artworks by title">
</div>

<br>

<!-- Card container -->
<div id="cardContainer">
    <c:forEach items="${artlist}" var="artwork">
        <div class="card" onclick="openModal(${artwork.artworkId})">
            <img src="displayartimage?id=${artwork.artworkId}" alt="Artwork Image">
            <div class="card-content">
                <h4>${artwork.title}</h4>
                <p><strong>Artist:</strong> ${artwork.artist}</p>
                <p><strong>Year Created:</strong> ${artwork.yearCreated}</p>
                <p><strong>Dimensions:</strong> ${artwork.dimensions}</p>
                <p><strong>Price:</strong> $${artwork.price}</p>
                <p><strong>Status:</strong> ${artwork.status}</p>
            </div>
            <div id="artworkData_${artwork.artworkId}" style="display:none" 
                 data-image="displayartimage?id=${artwork.artworkId}" 
                 data-title="${artwork.title}" 
                 data-artist="${artwork.artist}"
                 data-year="${artwork.yearCreated}"
                 data-dimensions="${artwork.dimensions}"
                 data-price="${artwork.price}"
                 data-status="${artwork.status}">
            </div>
        </div>
    </c:forEach>
</div>

<!-- Modal -->
<div id="myModal" class="modal">
    <div id="modalContent" class="modal-content">
        <!-- Modal content will be injected here dynamically -->
    </div>
</div>

</body>

</html>
