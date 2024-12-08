<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Browse Arts</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .art-container {
            display: flex;
            width: 80%;
            height: 30vh;
            margin: 20px auto;
            border-radius: 0%;
            background-color: #fff;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .art-image {
            width: 50%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease-in-out;
        }

        .art-image:hover {
            transform: scale(0.97);
        }

        .art-details {
            padding: 35px;
            width: 50%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            margin-left: 10px;
            margin-bottom: 10px;
        }

        .art-details h3 {
            margin: 0 0 10px 0;
            font-size: 24px;
            color: #333;
        }

        .art-details p {
            font-size: 16px;
            color: #666;
            margin: 5px 0;
        }

        .art-details .price {
            font-size: 18px;
            font-weight: bold;
            color: #1a73e8;
            margin-top: 10px;
        }

        .view-details-btn {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: DARKGREY;
            color: WHITE;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 60%;
            
            transition: background-color 0.3s ease;
        }

        .view-details-btn:hover {
            background-color: #1558a1;
        }

        /* Popup Modal */
        .popup {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        .popup-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            width: 60%;
            max-width: 800px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .popup-content img {
            width: 30%;
            height: auto;
            margin-bottom: 20px;
        }

        .popup-content h3 {
            font-size: 28px;
            color: #333;
            margin-bottom: 15px;
        }

        .popup-content p {
            font-size: 18px;
            color: #666;
            line-height: 1.5;
            margin-bottom: 20px;
        }

        .popup-content .close-btn {
            background-color: #e74c3c;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .popup-content .close-btn:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
<%@include file="mainnavbar.jsp" %><br/><br/><br/>

<!-- Main art containers -->
<div class="art-container">
    <!-- Image section -->
    <img src="https://th.bing.com/th/id/R.ebb20f273faeb9c338dc486525c95b90?rik=Fby8h5nUaL%2bOEQ&riu=http%3a%2f%2fimages.fineartamerica.com%2fimages-medium-large%2f30-original-abstract-masterpiece-brenda-basham-dothage.jpg&ehk=DH9G%2beqTxG3T4i20peLV6SBrHjN74jwfzkZB%2bwZJ3DA%3d&risl=&pid=ImgRaw&r=0" alt="Artwork" class="art-image">

    <!-- Details section -->
    <div class="art-details">
        <h3>Abstract Masterpiece</h3>
        <p>Artist: Jane Doe</p>
        <p>Description: A thought-provoking piece that blends modern abstract art with traditional techniques.</p>
        <p class="price">$2,500</p>
        <button class="view-details-btn" onclick="showPopup()">View Details</button>
    </div>
</div>
<br/><br/>
<div class="art-container">
    <!-- Image section -->
    <img src="https://webneel.com/daily/sites/default/files/images/daily/10-2018/17-nature-scenery-oil-painting-trees-arteet.jpg" alt="Artwork" class="art-image">

    <!-- Details section -->
    <div class="art-details">
        <h3>Modern Sculpture</h3>
        <p>Artist: John Smith</p>
        <p>Description: A dynamic sculpture that explores the relationship between geometric shapes and fluid movement.</p>
        <p class="price">$3,200</p>
        <button class="view-details-btn" onclick="showPopup()">View Details</button>
    </div>
</div>
<br/><br/>
<div class="art-container">
    <!-- Image section -->
    <img src="https://wallpaper-house.com/data/out/10/wallpaper2you_460761.jpg" alt="Artwork" class="art-image">

    <!-- Details section -->
    <div class="art-details">
        <h3>Colorful Dream</h3>
        <p>Artist: Emily White</p>
        <p>Description: A vibrant composition that explores color theory and the subconscious mind.</p>
        <p class="price">$1,800</p>
        <button class="view-details-btn" onclick="showPopup()">View Details</button>
    </div>
</div>
<br/><br/>
<div class="art-container">
    <!-- Image section -->
    <img src="https://thewowstyle.com/wp-content/uploads/2015/01/image.painting-art.jpg" alt="Artwork" class="art-image">

    <!-- Details section -->
    <div class="art-details">
        <h3>Fluid Motion</h3>
        <p>Artist: Michael Green</p>
        <p>Description: A captivating piece that captures the essence of movement through abstract forms.</p>
        <p class="price">$2,200</p>
        <button class="view-details-btn" onclick="showPopup()">View Details</button>
    </div>
</div>

<!-- Popup Modal -->
<div class="popup" id="popup">
    <div class="popup-content">
        <img src="https://webneel.com/wallpaper/sites/default/files/images/03-2014/10-art-wallpaper.1280.jpg" alt="Artwork" class="art-image" alt="Art Full View">
        <h3>Abstract Masterpiece</h3>
        <p>Artist: Jane Doe</p>
        <p>Description: This stunning abstract piece captures the fluidity of emotions through bold strokes and vivid colors. It reflects the artist's exploration of the unconscious mind and its interactions with the physical world. A true masterpiece for any modern art collector.</p>
        <p class="price">$2,500</p>
        <button class="close-btn" onclick="closePopup()">Close</button>
    </div>
</div>

<script>
    // Show popup function
    function showPopup() {
        document.getElementById("popup").style.display = "flex";
    }

    // Close popup function
    function closePopup() {
        document.getElementById("popup").style.display = "none";
    }
</script>

</body>
</html>
