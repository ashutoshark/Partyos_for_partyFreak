package com.partyos.Controller;

import java.util.List;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import jakarta.servlet.http.HttpSession;


// This class provides a global model attribute "cartCount" that can be accessed in all views.
@ControllerAdvice
public class GlobalControllerAdvice {

    @ModelAttribute("cartCount")
    public int cartCount(HttpSession session) {

        List<Long> cart = (List<Long>) session.getAttribute("cart");

        return (cart == null) ? 0 : cart.size();
    }
}
