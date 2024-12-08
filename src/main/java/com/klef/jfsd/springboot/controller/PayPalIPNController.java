package com.klef.jfsd.springboot.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/paypal")
public class PayPalIPNController {
	@PostMapping("/ipn")
    public ResponseEntity<String> handleIPN(HttpServletRequest request) {
        // Collect IPN data sent by PayPal (Postback request)
        String ipnMessage = request.getParameterMap().toString();
        
        // Validate the IPN request (verify with PayPal)
        // This can be done by sending the IPN data back to PayPal for verification
        
        // For simplicity, we are logging the IPN data
        System.out.println("Received IPN Message: " + ipnMessage);

        // You would typically parse the IPN message, validate the payment status, and update your system
        // If the payment was successful, proceed with your business logic (e.g., update order status)

        // Respond with HTTP 200 OK if successful
        return ResponseEntity.ok("IPN Received Successfully");
    }

}
