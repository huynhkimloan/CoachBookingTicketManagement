/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.controllers;

import com.qldv.service.CommentService;
import com.qldv.service.DriverDetailService;
import com.qldv.service.TripService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author dieuh
 */
@Controller
public class CommentController {
    
    @Autowired
    private CommentService commentService;
   
    @Autowired
    private TripService tripService;
    
    @Autowired
    private DriverDetailService driverDetailService;
    
    @RequestMapping("/comment/{tripId}")
    public String comment(Model model, @PathVariable("tripId") int tripId, @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        
        model.addAttribute("comments", this.commentService.getCommentsByTripId(tripId, page));
        model.addAttribute("commentCounter", this.commentService.countTrip(tripId));
        model.addAttribute("trip", this.tripService.tripById(tripId));
        model.addAttribute("rating", this.driverDetailService.avgStar(tripId));
        model.addAttribute("driverId", this.driverDetailService.driverId(tripId));
        
        return "comment";
    }
    
    @RequestMapping("/feedback")
    public String viewFeedbackPage(Model model, @RequestParam(required = false) Map<String, String> params) {
       int page = Integer.parseInt(params.getOrDefault("page", "1"));
       model.addAttribute("tripFeedback", this.tripService.getListTripComment());
//       model.addAttribute("counter", this.tripService.countTrip());
       return "feedback";
    } 
    
}
