/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.controllers;

import com.qldv.service.RatingService;
import com.qldv.service.UserService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author dieuh
 */
@Controller
@RequestMapping("admin/rating")
public class RatingManageController {
    @Autowired
    private RatingService ratingService;
    
    @Autowired
    private UserService userDetailService;

    @RequestMapping("/list")
    public String viewRatingList(@RequestParam Map<String, String> params, ModelMap mm) {
        mm.addAttribute("listRating", ratingService.getRating(params, 0, 8));
        
        return "ratings";
    }
    
    @GetMapping("/search")
    public String search(@RequestParam Map<String, String> params, ModelMap mm) {
        if (params.get("kw").equals("")) {
            return "redirect:/admin/rating/list";
        }
        mm.addAttribute("listRating", ratingService.getRating(params, 0, 8));
        return "ratings";
    } 
    @RequestMapping("/detail/{userId}")
    public String star(Model model, @PathVariable("userId") int userId, @RequestParam(required = false) Map<String, String> params) {
        model.addAttribute("oneStar", ratingService.getOneStar(userId));
        model.addAttribute("twoStar", ratingService.getTwoStar(userId));
        model.addAttribute("threeStar", ratingService.getThreeStar(userId));
        model.addAttribute("four", ratingService.getFourStar(userId));
        model.addAttribute("five", ratingService.getFiveStar(userId));
        model.addAttribute("user", userDetailService.getById(userId));
        return "detailratings";
    }
}
