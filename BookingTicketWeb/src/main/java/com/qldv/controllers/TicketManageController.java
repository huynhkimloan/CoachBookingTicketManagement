/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.controllers;

import com.qldv.service.RouteService;
import com.qldv.service.TicketDetailService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Admin
 */
@Controller
@RequestMapping("/tickets")
public class TicketManageController {
    @Autowired
    private TicketDetailService ticketDetailService;
    
    @Autowired
    private RouteService routeService;
    
    @GetMapping("/list")
    public String viewTicketList(ModelMap mm, @RequestParam Map<String, String> params) {
        mm.addAttribute("listTickets", ticketDetailService.getListNav(0, 20));
        mm.addAttribute("totalItem", Math.ceil(ticketDetailService.totalItem()) / 20);
        
        mm.addAttribute("listTicketsCancel", ticketDetailService.getTicketsCancel(params, 0, 20));
        mm.addAttribute("totalItemCancel", routeService.countItem(ticketDetailService.getTicketsCancel(params, 0, 20)) / 20);
        
        mm.addAttribute("listTicketsProcess", ticketDetailService.getTicketsProcess(params, 0, 20));
        mm.addAttribute("totalItemProcess", routeService.countItem(ticketDetailService.getTicketsProcess(params, 0, 20)) / 20);
        return "tickets";
    }
    
    @GetMapping("/list/{page}")
    public String viewTicketListByPage(ModelMap mm, @PathVariable("page") int page) {
        mm.addAttribute("listTickets", ticketDetailService.getListNav((page - 1) * 20, 20));
        mm.addAttribute("totalItem", Math.ceil(ticketDetailService.totalItem()) / 20);
        return "tickets";
    }
    
    @GetMapping("/search")
    public String search(@RequestParam Map<String, String> params, ModelMap mm) {
        if (params.get("kw").equals("")) {
            return "redirect:/tickets/list";
        }
        mm.addAttribute("listTickets", ticketDetailService.getTickets(params, 0, 20));
        mm.addAttribute("totalItem", routeService.countItem(ticketDetailService.getTickets(params, 0, 20)) / 20);
        
        
        return "tickets";
    }
    
    @GetMapping("/changeStatusPayment/{ticketId}")

    public String changeStatusPayment(ModelMap mm, @PathVariable("ticketId") int ticketId, @RequestParam Map<String, String> params) {
        ticketDetailService.changeStatusPayment(ticketDetailService.getTicketById(ticketId));
        viewTicketList(mm, params);
        return "tickets";
    }
    
    @GetMapping("/changeActive/{ticketId}")

    public String changeActive(ModelMap mm, @PathVariable("ticketId") int ticketId, @RequestParam Map<String, String> params) {
        ticketDetailService.changeActive(ticketDetailService.getTicketById(ticketId));
        viewTicketList(mm, params);
        return "tickets";
    }
}
