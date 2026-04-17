package com.partyos.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.partyos.Entities.User;
import com.partyos.Entities.Vendor_Service;
import com.partyos.Services.BookingService;
import com.partyos.Services.CartService;
import com.partyos.Services.VendorService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user/cart")
public class CartController {

    @Autowired
    private CartService cartService;

    @Autowired
    private VendorService vendorService;
    
    @Autowired
    private BookingService bookingService;

    // Add to Cart
    @GetMapping("/add/{id}")
    public String addToCart(@PathVariable Long id, HttpSession session) {

        cartService.addToCart(id, session);

        return "redirect:/user/marketplace"; // 👈 go back
    }

    // View Cart
    @GetMapping
    public String viewCart(HttpSession session, Model model) {

        User user = (User) session.getAttribute("user");

        if (user == null) return "redirect:/user/login";

        List<Long> cartIds = cartService.getCart(session);

        List<Vendor_Service> services = new ArrayList<>();
        double total = 0;

        for (Long id : cartIds) {
            Vendor_Service s = vendorService.getServiceById(id);
            services.add(s);
            total += s.getMinPrice();
        }

        model.addAttribute("services", services);
        model.addAttribute("total", total);

        return "user/cart";
    }

    //  Remove
    @GetMapping("/remove/{id}")
    public String remove(@PathVariable Long id, HttpSession session) {

        cartService.removeFromCart(id, session);

        return "redirect:/user/cart";
    }
    //  Checkout 
    @GetMapping("/checkout")
    public String checkout(HttpSession session) {

        User user = (User) session.getAttribute("user");

        if (user == null) return "redirect:/user/login";

        List<Long> cartIds = cartService.getCart(session);

        if (cartIds.isEmpty()) {
            return "redirect:/user/cart";
        }

        //  Convert IDs → Services
        List<Vendor_Service> services = new ArrayList<>();

        for (Long id : cartIds) {
            services.add(vendorService.getServiceById(id));
        }

        //  Main logic
        bookingService.checkout(user, services);

        //  Clear cart
        cartService.clearCart(session);

        return "redirect:/user/checkout-success";
    }
}