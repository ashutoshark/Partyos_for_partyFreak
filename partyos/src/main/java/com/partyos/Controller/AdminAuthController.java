package com.partyos.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.partyos.Entities.Admin;
import com.partyos.Services.AdminAuthService;
import com.partyos.Services.AdminService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminAuthController {

    @Autowired
    private AdminAuthService adminAuthService;
    
    @Autowired
    AdminService adminService;
    
 // Show Register Page
    @GetMapping("/register")
    public String showRegister(Model model) {
        model.addAttribute("admin", new Admin());
        return "admin/admin-register";
    }

    // Handle Register
    @PostMapping("/register")
    public String register(@ModelAttribute Admin admin) {

        adminAuthService.register(admin);

        return "redirect:/admin/login";
    }

    @GetMapping("/login")
    public String showLogin(Model model) {
        model.addAttribute("admin", new Admin());
        return "admin/admin-login";
    }

    
    // Handle Login with session management
    @PostMapping("/login")
    public String login(@ModelAttribute Admin admin,
                        Model model,
                        HttpSession session) {

        Admin loggedIn = adminAuthService.login(
                admin.getUsername(),
                admin.getPassword()
        );

        if (loggedIn != null) {
            session.setAttribute("admin", loggedIn);
            return "admin/admin-dashboard";
        }

        model.addAttribute("error", "Invalid credentials");
        return "admin/admin-login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
