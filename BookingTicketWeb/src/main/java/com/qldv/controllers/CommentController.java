/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.controllers;

import com.qldv.pojo.Route;
import com.qldv.pojo.Seat;
import com.qldv.pojo.Ticketdetail;
import com.qldv.pojo.Trip;
import com.qldv.pojo.User;
import com.qldv.service.CommentService;
import com.qldv.service.DriverDetailService;
import com.qldv.service.TicketDetailService;
import com.qldv.service.TripService;
import com.qldv.service.UserService;
import com.qldv.utils.Utils;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
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

    @Autowired
    private TicketDetailService ticketDetailService;

    @Autowired
    private UserService userDetailService;

    @RequestMapping("/comment/{tripId}")
    public String comment(Model model, @PathVariable("tripId") int tripId, @RequestParam(required = false) Map<String, String> params, Authentication au) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        int isMoved = 0;
        User u = this.userDetailService.getUsers(au.getName()).get(0);
        List<Object> trip = ticketDetailService.listTripIdUserMoved(u.getId());
        for (Object o : trip) {
            Trip t = (Trip) o;
            if (tripId == t.getId()) {
                isMoved = 1;
            }
        }
        model.addAttribute("comments", this.commentService.getCommentsByTripId(tripId, page));
        model.addAttribute("commentCounter", this.commentService.countTrip(tripId));
        model.addAttribute("trip", this.tripService.tripById(tripId));
        model.addAttribute("rating", this.driverDetailService.avgStar(tripId));
        model.addAttribute("driverId", this.driverDetailService.driverId(tripId));
        model.addAttribute("driver", this.driverDetailService.findById(this.driverDetailService.driverId(tripId)));
        model.addAttribute("isMoved", isMoved);
        return "comment";
    }

    @RequestMapping("/feedback")
    public String viewFeedbackPage(Model model, @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("tripFeedback", this.tripService.getListTripComment());
        return "feedback";
    }

    @RequestMapping("/feedbackByKeyword")
    public String viewFeedbackKeyWord(Model model, @RequestParam(required = false) Map<String, String> params) {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        Date fromDate = null;
        String kw = params.getOrDefault("kw", null);
        String kw1 = params.getOrDefault("kw1", null);
        String from = params.getOrDefault("kw2", null);
        if (from != null)
            try {
            fromDate = f.parse(from);
        } catch (ParseException ex) {
            Logger.getLogger(TripContronller.class.getName()).log(Level.SEVERE, null, ex);
        }
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("tripFeedback", this.tripService.getRouteTrips(kw, kw1, fromDate, page));;
        return "feedback";
    }

}
