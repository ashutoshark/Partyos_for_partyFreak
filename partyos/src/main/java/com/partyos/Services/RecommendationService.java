package com.partyos.Services;

import org.springframework.stereotype.Service;
import java.util.*;

@Service
public class RecommendationService {

    public List<String> generatePlan(int budget, int guests, String city,
                                     String time, String food, String[] services) {

        List<String> suggestions = new ArrayList<>();

        //  1. TIME SLOT DETECTION
        String slot;
        int hour = Integer.parseInt(time.split(":")[0]);

        if (hour < 12) slot = "Morning";
        else if (hour < 17) slot = "Afternoon";
        else if (hour < 21) slot = "Evening";
        else slot = "Night";

        suggestions.add("🕒 Party Time: " + slot);

        //  2. WEEKEND CHECK (simulate based on time input or extend later)
        boolean isWeekend = true; // you can pass this later dynamically

        if (isWeekend)
            suggestions.add("🔥 Weekend detected → High demand, book early");
        else
            suggestions.add("📅 Weekday → Better discounts available");

        //  3. BUDGET ANALYSIS
        if (budget < 5000) {
            suggestions.add("💸 Low budget → Home setup + DIY decoration");
            suggestions.add("🍔 Simple snacks + soft drinks recommended");
        } else if (budget < 15000) {
            suggestions.add("💰 Medium budget → DJ + Decoration possible");
            suggestions.add("🍕 Combo food packages recommended");
        } else {
            suggestions.add("💎 Premium budget → Full service party");
            suggestions.add("🍽 Catering + Bartender + Live DJ recommended");
        }

        //  4. GUEST ANALYSIS
        if (guests <= 10) {
            suggestions.add("👥 Small group → House party / terrace setup");
        } else if (guests <= 50) {
            suggestions.add("🎉 Medium group → Banquet / café booking");
        } else {
            suggestions.add("🏟 Large crowd → Outdoor venue / lawn required");
            suggestions.add("🚗 Consider parking & crowd management");
        }

        //  5. FOOD LOGIC
        if (food.equalsIgnoreCase("veg")) {
            suggestions.add("🥗 Veg menu → Paneer, snacks, mocktails");
        } else if (food.equalsIgnoreCase("non-veg")) {
            suggestions.add("🍗 Non-veg menu → BBQ, chicken starters");
        } else {
            suggestions.add("🍽 Mixed menu → Veg + Non-veg combo");
        }

        //  6. TIME BASED FOOD + MUSIC
        switch (slot) {
            case "Morning":
                suggestions.add("☀️ Morning vibe → Light music + breakfast items");
                break;
            case "Afternoon":
                suggestions.add("🌤 Afternoon → Lunch buffet + chill music");
                break;
            case "Evening":
                suggestions.add("🌇 Evening → DJ + lighting + snacks");
                break;
            case "Night":
                suggestions.add("🌙 Night party → Loud music + alcohol + dance");
                break;
        }

        //  7. CITY BASED SUGGESTION
        suggestions.add("📍 Location: " + city);

        if (city.equalsIgnoreCase("BANGALORE")) {
            suggestions.add("🌆 Bangalore → Rooftop & pub-style parties popular");
        } else if (city.equalsIgnoreCase("MUMBAI")) {
            suggestions.add("🌊 Mumbai → Beach-side / luxury venues recommended");
        } else {
            suggestions.add("🏙 Explore local vendors for best deals");
        }

        //  8. SELECTED SERVICES
        if (services != null && services.length > 0) {
            suggestions.add("🛠 Selected Services:");
            for (String s : services) {
                suggestions.add("   ✔ " + s);
            }
        } else {
            suggestions.add("⚠ No services selected → Consider DJ / Catering");
        }

        //  9. SMART FINAL TIP
        suggestions.add("✅ Tip: Book vendors early to avoid last-minute surge pricing");

        return suggestions;
    }
}