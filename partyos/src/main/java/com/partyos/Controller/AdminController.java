package com.partyos.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.partyos.Entities.User;
import com.partyos.Services.AdminService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @GetMapping("/dashboard")
    public String dashboard(
            @RequestParam(value = "keyword", required = false) String keyword,
            @RequestParam(value = "page", defaultValue = "0") int page,
            HttpSession session,
            Model model) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }

        //  Basic stats
        model.addAttribute("totalUsers", adminService.getAllUsers().size());
        model.addAttribute("totalVendors", adminService.getAllVendors().size());
        model.addAttribute("pendingServices", adminService.getPendingServices().size());

        //  Services
        model.addAttribute("services", adminService.getPendingServices());

        //  Vendors
        model.addAttribute("pendingVendors", adminService.getPendingVendors());

        List<User> approvedVendors;

        if (keyword != null && !keyword.isEmpty()) {
            approvedVendors = adminService.searchVendors(keyword);
        } else {
            approvedVendors = adminService.getApprovedVendors();
        }

        // pagination logic for approved vendors
        int pageSize = 5;
        int start = page * pageSize;
        int end = Math.min(start + pageSize, approvedVendors.size());

        List<User> paginatedList = approvedVendors.subList(start, end);

        model.addAttribute("approvedVendors", paginatedList);
        model.addAttribute("currentPage", page);
        model.addAttribute("hasNext", end < approvedVendors.size());
        model.addAttribute("keyword", keyword);

        return "admin/admin-dashboard";
    }

    // ================= SERVICE =================

    @GetMapping("/approve-service/{id}")
    public String approveService(@PathVariable Long id, HttpSession session) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }

        adminService.approveService(id);
        return "redirect:/admin/dashboard";
    }

    @GetMapping("/reject-service/{id}")
    public String rejectService(@PathVariable Long id, HttpSession session) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }

        adminService.rejectService(id);
        return "redirect:/admin/dashboard";
    }

    // ================= VENDOR =================

    @GetMapping("/approve-vendor/{id}")
    public String approveVendor(@PathVariable Long id, HttpSession session) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }

        adminService.approveVendor(id);
        return "redirect:/admin/dashboard";
    }

    @GetMapping("/reject-vendor/{id}")
    public String rejectVendor(@PathVariable Long id, HttpSession session) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }

        adminService.rejectVendor(id);
        return "redirect:/admin/dashboard";
    }
}