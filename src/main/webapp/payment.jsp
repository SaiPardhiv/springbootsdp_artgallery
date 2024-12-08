<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PayPal Payment</title>
    <script src="https://www.paypal.com/sdk/js?client-id=YOUR_PAYPAL_CLIENT_ID&components=buttons"></script> <!-- PayPal JS SDK -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 50%;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
        }

        .details {
            font-size: 18px;
            margin-bottom: 20px;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Complete Your Purchase</h2>
    
    <!-- Artwork Details -->
    <div class="details">
        <p><strong>Title:</strong> ${param.title}</p>
        <p><strong>Price:</strong> $${param.price}</p>
    </div>

    <!-- PayPal Button -->
    <div id="paypal-button-container"></div>

    <!-- PayPal Button -->
    <script>
        // Use PayPal's Buttons SDK to render a payment button
        paypal.Buttons({
            createOrder: function(data, actions) {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: '${param.price}'
                        },
                        description: '${param.title}' // Artwork description
                    }]
                });
            },
            onApprove: function(data, actions) {
                return actions.order.capture().then(function(details) {
                    alert('Payment Successful!');

                    // After payment, you can redirect to a success page or send a confirmation
                    window.location.href = '/order/success?artworkId=${param.artworkId}';
                });
            },
            onError: function(err) {
                alert('Error occurred during payment: ' + err);
            }
        }).render('#paypal-button-container'); // Render PayPal Button in the specified div
    </script>
</div>

</body>

</html>
