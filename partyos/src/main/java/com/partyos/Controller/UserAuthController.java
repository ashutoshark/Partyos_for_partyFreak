package com.partyos.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.partyos.Entities.User;
import com.partyos.Services.UserLoginService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserAuthController {
	@Autowired
	private UserLoginService userLoginService;
	
	@GetMapping("/register")
	public String showRegistrationForm(Model model) {
		model.addAttribute("user", new User());
		return "register"; // This will render the register.html template
	}
	
	@PostMapping("/register")
	public String registerUser(@ModelAttribute User user) {
		userLoginService.registerUser(user);
		return "redirect:/user/login"; // Redirect to login page after registration
	}
	
	@GetMapping("/login")
	public String showLoginForm(Model model) {
		model.addAttribute("user", new User());
		return "login"; // this will render the login jps template
	}
	//login method with session management and should be role based authentication
	@PostMapping("/login")
	public String loginUser(@ModelAttribute User user, Model model, HttpSession session) {
		 User authenticatedUser = userLoginService.authenticate(user.getUsername(), user.getPassword());
		if (authenticatedUser != null) {
			session.setAttribute("user", authenticatedUser);
			if(authenticatedUser.getRole().equals("vendor")) {
				return "redirect:/vendor/vendor-dashboard"; // Redirect to admin dashboard
			}
			return "redirect:/"; // Redirect to user dashboard
		}
		model.addAttribute("error", "Invalid username or password");
		return "login"; // Stay on login page if authentication fails
	}
	
	@GetMapping("/user-dashboard")
	public String userDashboard(HttpSession session) {

	    User user = (User) session.getAttribute("user");

	    if (user == null) {
	        return "redirect:/user/login";
	    }

	    return "user/user-dashboard"; // user-dashboard.jsp
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
	    session.invalidate();
	    return "redirect:/";
	}

}
