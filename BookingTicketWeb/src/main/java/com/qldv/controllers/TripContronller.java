/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.controllers;

import com.qldv.pojo.Route;
import com.qldv.service.RouteService;
import com.qldv.service.TripService;
import com.qldv.utils.Utils;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class TripContronller {

    @Autowired
    private TripService tripService;

    @Autowired
    private RouteService routeService;

    @RequestMapping("/trip")
    public String trip(Model model, @RequestParam(required = false) Map<String, String> params) throws ParseException {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        Date fromDate = null;
        long price;
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
        model.addAttribute("trips", this.tripService.getRouteTrips(kw, kw1, fromDate, page));
        if (this.tripService.getRouteIdByKeyword(kw, kw1) == 0) {
            price = 0;
        } else {
            Route route = this.routeService.findById(this.tripService.getRouteIdByKeyword(kw, kw1));
            price = (long) Utils.sumMoney(new Date(), route);
        }
        model.addAttribute("date", fromDate);
        model.addAttribute("price", price);
        return "trip";
    }

    @RequestMapping("/trip/{routeId}")
    public String trip1(Model model, @PathVariable("routeId") int routeId, @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        Route route = this.routeService.findById(routeId);
        long price = (long) Utils.sumMoney(new Date(), route);
        model.addAttribute("trips", this.tripService.getDeparturedayTrips(routeId, page));
        model.addAttribute("counter", this.tripService.countTrip(route.getStartingpoint(), route.getDestination(), null));
        model.addAttribute("routeId", routeId);
        model.addAttribute("price", price);
        return "trip";
    }
//     
}
