package com.partyos.Services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service
public class CartService {

	// Cart management using HTTP session to store the list of product IDs in the cart
    public List<Long> getCart(HttpSession session) {
        List<Long> cart = (List<Long>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }
        return cart;
    }

    // Add a product ID to the cart stored in the session
    public void addToCart(Long id, HttpSession session) {
        List<Long> cart = getCart(session);
        cart.add(id);
        session.setAttribute("cart", cart);
    }

    // Remove a product ID from the cart stored in the session if it exists and update the session attribute accordingly
    public void removeFromCart(Long id, HttpSession session) {
        List<Long> cart = getCart(session);
        cart.remove(id);
        session.setAttribute("cart", cart);
    }
// Clear the cart by removing the "cart" attribute from the session, effectively resetting the cart to an empty state
    public void clearCart(HttpSession session) {
        session.removeAttribute("cart");
    }
}