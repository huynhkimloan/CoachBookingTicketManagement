/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.controllers;

import com.qldv.pojo.Driver;
import com.qldv.pojo.Driverdetail;
import com.qldv.pojo.User;
import com.qldv.repository.DriverDetailRepository;
import com.qldv.service.DriverDetailService;
import com.qldv.service.RouteService;
import com.qldv.service.TripService;
import com.qldv.service.UserService;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Admin
 */
@Controller
@RequestMapping("ad/driverdetails")
public class DriverDetailManageController {

    @Autowired
    private DriverDetailService driverDetailService;

    @Autowired
    private UserService userService;

    @Autowired
    private RouteService routeService;
    
    @Autowired
    private TripService tripService;

    @GetMapping("/list")
    public String viewDriverList(ModelMap mm, Authentication a, HttpServletRequest request) {
        mm.addAttribute("listDrivers", driverDetailService.getListNav(0, 8));
        mm.addAttribute("totalItem", driverDetailService.totalItem() / 8);
        User u = this.userService.getUsers(a.getName()).get(0);
        request.getSession().setAttribute("user", u);
        return "driverdetails";
    }

    @GetMapping("/list/{page}")
    public String viewDriverListByPage(ModelMap mm, @PathVariable("page") int page) {
        mm.addAttribute("listDrivers", driverDetailService.getListNav((page - 1) * 8, 8));
        mm.addAttribute("totalItem", driverDetailService.totalItem() / 8);
        return "driverdetails";
    }

    @GetMapping("/editdriver/{driverId}")
    public String viewDriverEdit(ModelMap mm, @PathVariable("driverId") int driverId) {
        mm.addAttribute("driver", driverDetailService.findById(driverId));
        mm.addAttribute("users", userService.getUsers("Driver"));
        return "updatedriverdt";
    }
    
    @GetMapping("/adddriver")
    public String viewDriverNew(ModelMap mm) {
        mm.addAttribute("driver", new Driverdetail());
        mm.addAttribute("trips", tripService.getTrips());
        mm.addAttribute("users", userService.getUsers("Driver"));
        return "adddriverdt";
    }

    @PostMapping("/editdriver")
    public String doUpdateDriver(ModelMap mm, @ModelAttribute(value = "driver") Driverdetail driverdt, 
            BindingResult rs, Authentication a, HttpServletRequest request) {
        if (rs.hasErrors()) {
            return "updatedriverdt";
        }
        if (this.driverDetailService.editDriver(driverdt) == true) {
            viewDriverList(mm, a, request);
            return "redirect:/ad/driverdetails/list";
        }
        return "updatedriverdt";
    }
    
    @PostMapping("/savedriver")
    public String viewRouteSave(ModelMap mm, @ModelAttribute(value = "driver") @Valid Driverdetail driver,
            BindingResult rs, Authentication a, HttpServletRequest request) {
        if (rs.hasErrors()) {
            return "adddriverdt";
        }
        if (this.driverDetailService.addDriver(driver) == true) {
            viewDriverList(mm, a, request);
            return "redirect:/ad/driverdetails/list";
        }
        return "adddriverdt";
    }
    
    @RequestMapping("/deletedriver/{driverId}")
    public String viewDriverRemove(ModelMap mm, @PathVariable("driverId") int driverId,
            Authentication a, HttpServletRequest request) {
        driverDetailService.deleteDriver(driverId);
        viewDriverList(mm, a, request);
        return "driverdetails";
    }

    @GetMapping("/search")
    public String search(@RequestParam Map<String, String> params, ModelMap mm) {
        if (params.get("kw").equals("")) {
            return "redirect:/ad/driverdetails/list";
        }
        mm.addAttribute("listDrivers", driverDetailService.getDrivers(params, 0, 8));
        mm.addAttribute("totalItem", routeService.countItem(driverDetailService.getDrivers(params, 0, 8)) / 8);
        return "driverdetails";
    }
}
