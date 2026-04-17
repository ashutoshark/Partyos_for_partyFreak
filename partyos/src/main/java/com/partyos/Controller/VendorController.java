package com.partyos.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.partyos.Entities.Alcohol;
import com.partyos.Entities.User;
import com.partyos.Entities.Vendor_Service;
import com.partyos.Enums.City;
import com.partyos.Enums.ServiceType;
import com.partyos.Repositories.AlcoholRepository;
import com.partyos.Services.FeedbackService;
import com.partyos.Services.VendorService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/vendor")
public class VendorController {

	@Autowired
	private VendorService vendorService;

	@Autowired
	private FeedbackService feedbackService;

	@Autowired
	AlcoholRepository alcoholRepository;

	// Show form to add new service
	@GetMapping("/add-service")
	public String showForm(Model model) {
		model.addAttribute("vendor", new Vendor_Service());
		model.addAttribute("cities", City.values());
		model.addAttribute("serviceTypes", ServiceType.values());
		return "vendor/vendor-add_service";
	}

	// Handle form submission to add new service
	@PostMapping("/add-service")
	public String addService(@ModelAttribute Vendor_Service vendor, @RequestParam("imageFile") MultipartFile file,
			HttpSession session) throws Exception {

		User user = (User) session.getAttribute("user");

		if (user == null)
			return "redirect:/login";

		//  ABSOLUTE PATH (IMPORTANT)
		String uploadDir = System.getProperty("user.dir") + "/uploads/";

		String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();

		java.io.File dir = new java.io.File(uploadDir);
		if (!dir.exists())
			dir.mkdirs();

		file.transferTo(new java.io.File(uploadDir + fileName));

		//  save URL path
		vendor.setImageUrl("/uploads/" + fileName);

		vendorService.addService(user, vendor);

		return "redirect:/vendor/vendor-dashboard";
	}

	@GetMapping("/edit-service/{id}")
	public String editService(@PathVariable Long id, Model model) {

		Vendor_Service service = vendorService.getServiceById(id);

		model.addAttribute("service", service);

		return "vendor/edit-service";
	}
// Handle form submission to update service
	@PostMapping("/update-service")
	public String updateService(@ModelAttribute Vendor_Service service, @RequestParam("imageFile") MultipartFile file,
			HttpSession session) throws Exception {

		if (!file.isEmpty()) {

			String uploadDir = System.getProperty("user.dir") + "/uploads/";
			String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();

			java.io.File dir = new java.io.File(uploadDir);
			if (!dir.exists())
				dir.mkdirs();

			file.transferTo(new java.io.File(uploadDir + fileName));

			service.setImageUrl("/uploads/" + fileName);
		}

		vendorService.updateService(service);

		return "redirect:/vendor/my-services";
	}

	// Show form to add alcohol (only for liquor vendors)
	@GetMapping("/add-alcohol")
	public String showAlcoholForm(Model model) {
		//This should only visible to liquor vendors.
		model.addAttribute("alcohol", new Alcohol());
		//  send enum values to JSP
		model.addAttribute("cities", City.values());
		return "vendor/add-alcohol";
	}

	// Handle form submission to add alcohol (only for liquor vendors)
	@PostMapping("/add-alcohol")
	public String addAlcohol(@ModelAttribute Alcohol alcohol, @RequestParam("imageFile") MultipartFile file,
			HttpSession session) throws Exception {

		User user = (User) session.getAttribute("user");

		if (user == null) {
			return "redirect:/user/login";
		}

		//  FIND LIQUOR VENDOR
		Vendor_Service vendor = vendorService.getVendorServices(user.getId()).stream()
				.filter(v -> v.getServiceType() == ServiceType.LIQUOR).findFirst()
				.orElseThrow(() -> new RuntimeException("Not a liquor vendor"));

		//  FILE UPLOAD (SAME AS SERVICE)
		if (!file.isEmpty()) {
			String uploadDir = System.getProperty("user.dir") + "/uploads/";

			String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();

			java.io.File dir = new java.io.File(uploadDir);
			if (!dir.exists())
				dir.mkdirs();

			file.transferTo(new java.io.File(uploadDir + fileName));

			alcohol.setImageUrl("/uploads/" + fileName);
		}

		alcohol.setVendorService(vendor);

		alcoholRepository.save(alcohol);

		return "redirect:/vendor/vendor-dashboard";
	}

	// View all services of the logged-in vendor
	@GetMapping("/my-services")
	public String myServices(HttpSession session, Model model) {

		User user = (User) session.getAttribute("user");

		//  FIX
		if (user == null) {
			return "redirect:/user/login";
		}

		model.addAttribute("services", vendorService.getVendorServices(user.getId()));

		return "vendor/vendor-myservices";
	}

	// Delete a service
	@GetMapping("/delete-service/{id}")
	public String deleteService(@PathVariable Long id) {

		vendorService.deleteService(id);

		return "redirect:/vendor/my-services";
	}

	
	// Vendor dashboard showing stats and feedback
	@GetMapping("/vendor-dashboard")
	public String dashboard(HttpSession session, Model model) {

	    User user = (User) session.getAttribute("user");

	    if (user == null) {
	        return "redirect:/user/login";
	    }

	    List<Vendor_Service> services = vendorService.getVendorServices(user.getId());

	    // CHECK LIQUOR SERVICE
	    boolean isLiquorVendor = services.stream()
	            .anyMatch(s -> s.getServiceType() == ServiceType.LIQUOR);

	    model.addAttribute("isLiquorVendor", isLiquorVendor);

	    model.addAttribute("servicesCount", services.size());
	    model.addAttribute("feedbacks", feedbackService.getVendorFeedback(user.getId()));

	    model.addAttribute("todayRevenue", 1000);
	    model.addAttribute("weekRevenue", 5000);
	    model.addAttribute("yearRevenue", 20000);

	    return "vendor/vendor-dashboard";
	}
}