package com.klef.jfsd.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/payment")
public class PayPalController {
	
	// Handle Buy Now button redirection
    @GetMapping("/buy")
    public String buyArtwork(@RequestParam("artworkId") Long artworkId, @RequestParam("price") double price, 
                              @RequestParam("title") String title) {
        // Pass the artwork details to the payment page
        return "payment"; // Redirect to payment.jsp
    }
    
    // Success page after payment
    @GetMapping("/success")
    public String successPage(@RequestParam("artworkId") Long artworkId) {
        // Handle order completion or update database with successful payment
        return "success"; // Redirect to success page
    }

}
