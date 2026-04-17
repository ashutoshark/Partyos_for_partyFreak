package com.partyos.Controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.partyos.Entities.Alcohol;
import com.partyos.Entities.User;
import com.partyos.Enums.AlcoholCategory;
import com.partyos.Repositories.AlcoholRepository;
import com.partyos.Services.AlcoholService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/alcohol")
public class AlcoholController {

    @Autowired
    private AlcoholService alcoholService;

    @Autowired
    private AlcoholRepository repo;

    // Show reservation page with optional filters
    @GetMapping("/reserve")
    public String showPage(@RequestParam(required = false) String category,
                           @RequestParam(required = false) String city,
                           Model model) {

        if (city == null) city = "BANGALORE";

        List<Alcohol> items;

        if (category == null || category.equalsIgnoreCase("ALL")) {
            //  SHOW ALL
            items = repo.findAll();
        } else {
            items = alcoholService.getFilteredAlcohol(category, city);
        }

        model.addAttribute("items", items);
        model.addAttribute("selectedCategory", category);
        model.addAttribute("selectedCity", city);
        model.addAttribute("categories", AlcoholCategory.values());

        return "alcohol/reservation";
    }

    // Handle reservation form submission 
    @PostMapping("/reserve")
    public String reserve(HttpServletRequest request, Model model) {

        Object user = request.getSession().getAttribute("user");
         

        if (user == null) {
            request.getSession().setAttribute("msg", "Please login to reserve alcohol");
            return "redirect:/user/login";
        }
        

        String[] ids = request.getParameterValues("ids");

        List<Alcohol> selected = repo.findAllById(
            Arrays.stream(ids).map(Long::parseLong).toList()
        );

        double total = 0;

        for (Alcohol a : selected) {
            String qtyStr = request.getParameter("qty_" + a.getId());
            int qty = Integer.parseInt(qtyStr);

            total += a.getPrice() * qty;
        }

        model.addAttribute("selectedItems", selected);
        model.addAttribute("total", total);

        return "alcohol/reservation-success";
    }
}
