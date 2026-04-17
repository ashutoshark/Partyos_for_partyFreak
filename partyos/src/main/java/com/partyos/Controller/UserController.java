package com.partyos.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.partyos.Entities.Alcohol;
import com.partyos.Entities.Event;
import com.partyos.Entities.Feedback;
import com.partyos.Entities.User;
import com.partyos.Entities.UserProfile;
import com.partyos.Entities.Vendor_Service;
import com.partyos.Enums.ServiceType;
import com.partyos.Repositories.AlcoholRepository;
import com.partyos.Repositories.EventRepository;
import com.partyos.Repositories.UserRepository;
import com.partyos.Services.BookingService;
import com.partyos.Services.EventService;
import com.partyos.Services.FeedbackService;
import com.partyos.Services.PdfService;
import com.partyos.Services.RecommendationService;
import com.partyos.Services.UserProfileService;
import com.partyos.Services.VendorService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private FeedbackService feedbackService;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private UserProfileService userProfileService;

	@Autowired
	private BookingService bookingService;

	@Autowired
	private RecommendationService recommendationService;

	@Autowired
	private EventService eventService;

	@Autowired
	private PdfService pdfService;

	@Autowired
	private EventRepository eventRepository;

	@Autowired
	private VendorService vendorService;
	
	@Autowired
	private AlcoholRepository alcoholRepository;

	@GetMapping("/allUsers")
	public String getAllUsers(Model model) {

	    List<User> users = userRepository.findAll();

	    model.addAttribute("users", users);

	    return "user/all-users";   // ✅ JSP page
	}
	//Getting user who are vendors
	@GetMapping("/allVendors")
	public String getAllVendors(Model model) {

	    List<User> vendors = userRepository.findByRole("VENDOR");

	    model.addAttribute("vendors", vendors);

	    return "user/all-vendors";   // ✅ JSP page
	}
// Feedback submission from user dashboard 
	@PostMapping("/give-feedback")
	public String giveFeedback(@ModelAttribute Feedback feedback, HttpSession session) {

		User user = (User) session.getAttribute("user");

		feedback.setUser(user);

		feedbackService.saveFeedback(feedback);

		return "redirect:/user/dashboard";
	}

	
	// USER DASHBOARD - PROFILE + BOOKINGS
	@GetMapping("/profile")
	public String profile(HttpSession session, Model model) {

		User user = (User) session.getAttribute("user");

		if (user == null)
			return "redirect:/login";

		// fetch profile (address/contact)
		UserProfile profile = userProfileService.getProfile(user.getId());

		if (profile == null)
			profile = new UserProfile();

		// booking history
		model.addAttribute("bookings", bookingService.getUserBookings(user.getId()));

		model.addAttribute("user", user);
		model.addAttribute("profile", profile);

		return "user/user-dashboard";
	}

	// SAVE CONTACT DETAILS 
	@PostMapping("/save-details")
	public String saveDetails(@ModelAttribute UserProfile profile, HttpSession session) {

		User user = (User) session.getAttribute("user");

		if (user == null)
			return "redirect:/login";

		userProfileService.saveProfile(profile, user);

		return "redirect:/user/profile";
	}

	// OPEN CONTACT DETAILS PAGE
	@GetMapping("/edit-details")
	public String editDetails(HttpSession session, Model model) {

		User user = (User) session.getAttribute("user");

		if (user == null)
			return "redirect:/login";

		UserProfile profile = userProfileService.getProfile(user.getId());

		if (profile == null)
			profile = new UserProfile();

		model.addAttribute("profile", profile);

		return "user/edit-details";
	}

	// OPEN EDIT PROFILE PAGE
	@GetMapping("/edit-profile")
	public String editProfile(HttpSession session, Model model) {

		User user = (User) session.getAttribute("user");

		if (user == null)
			return "redirect:/login";

		model.addAttribute("user", user);

		return "user/edit-profile";
	}
	
	// UPDATE USERNAME/EMAIL

	@PostMapping("/update-profile")
	public String updateProfile(@ModelAttribute User updatedUser, HttpSession session) {

		User user = (User) session.getAttribute("user");

		user.setUsername(updatedUser.getUsername());
		user.setEmail(updatedUser.getEmail());

		userRepository.save(user);

		session.setAttribute("user", user);

		return "redirect:/user/profile";
	}

	
	// SMART PLAN PAGE - FORM
	@GetMapping("/smart-plan")
	public String smartPlanPage(HttpSession session) {

		User user = (User) session.getAttribute("user");

		if (user == null)
			return "redirect:/user/login";

		return "user/smart-plan";
	}

	@PostMapping("/generate-plan")
	public String generatePlan(@RequestParam int budget, @RequestParam int guests, @RequestParam String city,
			@RequestParam String date, @RequestParam String time, @RequestParam String food,
			@RequestParam(required = false) String[] services, HttpSession session, Model model) {

		User user = (User) session.getAttribute("user");

		List<String> plans = recommendationService.generatePlan(budget, guests, city, time, food, services);

		// Fetch real vendors
		Map<String, List<Vendor_Service>> vendorMap = new HashMap<>();

		if (services != null) {
			for (String s : services) {
				vendorMap.put(s, vendorService.getFilteredServices(s, city));
			}
		}

		// cost estimation
		int estimatedCost = 0;

		for (List<Vendor_Service> list : vendorMap.values()) {
			if (!list.isEmpty()) {

				double min = list.stream().mapToDouble(Vendor_Service::getMinPrice).min().orElse(0);

				estimatedCost += min;
			}
		}

		String summary = String.join("\n", plans) + "\nEstimated Cost: ₹" + estimatedCost;

		Event event = new Event();
		event.setBudget(budget);
		event.setGuests(guests);
		event.setCity(city);
		event.setDate(date);
		event.setTime(time);
		event.setFood(food);

		Event saved = eventService.saveEvent(event, user, summary);

		model.addAttribute("event", saved);
		model.addAttribute("plans", plans);
		model.addAttribute("vendors", vendorMap);
		model.addAttribute("cost", estimatedCost);

		UserProfile profile = userProfileService.getProfile(user.getId());

		if (profile == null)
			profile = new UserProfile();

		// ADD TO MODEL
		model.addAttribute("user", user);
		model.addAttribute("profile", profile);

		return "user/plan-result";
	}

	
	// DOWNLOAD PDF 
	@GetMapping("/download-plan/{id}")
	public ResponseEntity<byte[]> downloadPdf(@PathVariable Long id) {

		Event event = eventRepository.findById(id).orElseThrow();

		// Fetch vendors again (important)
		Map<String, List<Vendor_Service>> vendorMap = new HashMap<>();

		String city = event.getCity();

		// Example service types (you can store later)
		String[] types = { "DJ", "Decoration", "Catering", "Bartender" };

		for (String type : types) {
			vendorMap.put(type, vendorService.getFilteredServices(type, city));
		}

		byte[] pdf = pdfService.generatePdf(event, vendorMap);

		return ResponseEntity.ok().header("Content-Disposition", "attachment; filename=party-plan.pdf").body(pdf);
	}

	// SERVICE DETAILS PAGE
	@GetMapping("/service/{id}")
	public String serviceDetails(@PathVariable Long id, Model model) {

	    Vendor_Service service = vendorService.getServiceById(id);

	    List<Alcohol> alcohols = alcoholRepository.findByVendorServiceId(id);

	    model.addAttribute("service", service);
	    model.addAttribute("alcohols", alcohols);

	    return "user/service-details";
	}
	
	// MARKETPLACE WITH FILTERS + PAGINATION + SORTING 	

	@GetMapping("/marketplace")
	public String marketplace(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "8") int size,
			@RequestParam(required = false) String type, @RequestParam(required = false) String city,
			@RequestParam(required = false) Double minPrice, @RequestParam(required = false) Double maxPrice,
			@RequestParam(required = false) String search, @RequestParam(required = false) String sort, Model model,
			HttpSession session, HttpServletRequest request) {

		HttpSession session1 = request.getSession();
		User user = (User) session1.getAttribute("user");

		model.addAttribute("user", user);

		// 🔥 CART COUNT
		List<Long> cart = (List<Long>) session1.getAttribute("cart");
		model.addAttribute("cartCount", cart == null ? 0 : cart.size());

		List<Vendor_Service> services = vendorService.getAllApprovedServices();

		// 🔍 SEARCH
		if (search != null && !search.isEmpty()) {
			services = services.stream().filter(s -> s.getBusinessName().toLowerCase().contains(search.toLowerCase()))
					.toList();
		}

		// 🎯 FILTER TYPE
		if (type != null && !type.equalsIgnoreCase("ALL") && !type.isEmpty()) {
			services = services.stream()
					.filter(s -> s.getServiceType() != null && s.getServiceType().name().equalsIgnoreCase(type))
					.toList();
		}
		

		// 🎯 FILTER CITY
		if (city != null && !city.isEmpty()) {
			services = services.stream().filter(s -> s.getCity() != null && s.getCity().name().equalsIgnoreCase(city))
					.toList();
		}

		// 💰 PRICE FILTER
		if (minPrice != null) {
			services = services.stream().filter(s -> s.getMinPrice() >= minPrice).toList();
		}

		if (maxPrice != null) {
			services = services.stream().filter(s -> s.getMaxPrice() <= maxPrice).toList();
		}

		// 🔥 SORT
		if ("low".equals(sort)) {
			services = services.stream().sorted((a, b) -> Double.compare(a.getMinPrice(), b.getMinPrice())).toList();
		} else if ("high".equals(sort)) {
			services = services.stream().sorted((a, b) -> Double.compare(b.getMinPrice(), a.getMinPrice())).toList();
		}

		// 🧠 SAFE PAGINATION
		int start = page * size;
		if (start >= services.size())
			start = 0;

		int end = Math.min(start + size, services.size());

		List<Vendor_Service> paginated = services.subList(start, end);

		model.addAttribute("services", paginated);
		model.addAttribute("serviceTypes", ServiceType.values());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", (services.size() + size - 1) / size);

		return "user/marketplace";
	}
// CHECKOUT SUCCESS PAGE
	@GetMapping("/checkout-success")
	public String checkoutSuccess() {
		return "user/checkout-success";
	}

//	@GetMapping("/cart/add/{id}")
//	@ResponseBody
//	public String addToCart(@PathVariable Long id,
//	                        HttpSession session) {
//
//	    List<Long> cart = (List<Long>) session.getAttribute("cart");
//
//	    if (cart == null) cart = new ArrayList<>();
//
//	    cart.add(id);
//
//	    session.setAttribute("cart", cart);
//
//	    return "added";
//	}
}
