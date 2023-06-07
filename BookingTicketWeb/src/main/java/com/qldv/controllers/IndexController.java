/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.controllers;

import com.qldv.pojo.Route;
import com.qldv.pojo.Seat;
import com.qldv.pojo.Trip;
import com.qldv.pojo.User;
import com.qldv.service.CategoryService;
import com.qldv.service.RouteService;
import com.qldv.service.TicketDetailService;
import com.qldv.service.UserService;
import com.qldv.utils.Utils;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ASUS
 */
@Controller
@ControllerAdvice
public class IndexController {

    @Autowired
    private RouteService routeService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private UserService userDetailService;

    @Autowired
    private TicketDetailService ticketDetailService;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    private MailSender mailSender;

    @ModelAttribute
    public void commonAttrs(Model model, HttpSession session) {
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
        model.addAttribute("categories", this.categoryService.getCategories());
        model.addAttribute("counter", Utils.count((Map<Integer, Seat>) session.getAttribute("seat")));
    }

    @RequestMapping("/")
    public String index(Model model, @RequestParam(required = false) Map<String, String> params) throws ParseException {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        Date fromDate = null;
        String from = params.getOrDefault("kw2", null);
        if (from != null) {
            fromDate = f.parse(from);
        }

        String kw = params.getOrDefault("kw", null);
        String kw1 = params.getOrDefault("kw1", null);
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        List<Route> route = this.routeService.getRoutes(kw, kw1, page);

        for (Route r : route) {
            r.setPrice((long) Utils.sumMoney(new Date(), r));
        }

        model.addAttribute("routes", route);
        model.addAttribute("counter", this.routeService.countRoute());
        return "index";
    }

    

    @RequestMapping("/user-profile")
    public String userProfile(Authentication a, HttpServletRequest request) {
        User u = this.userDetailService.getUsers(a.getName()).get(0);
        request.getSession().setAttribute("user", u);
        request.setAttribute("pointPlus", this.ticketDetailService.sumPointPlus(u.getId()));
        return "userprofile";
    }

    @RequestMapping("/contact")
    public String contact() {

        return "contact";
    }

    public void sendMail(String from, String to, String subject, String content) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom(from);
        mailMessage.setTo(to);
        mailMessage.setSubject(subject);
        mailMessage.setText(content);

        mailSender.send(mailMessage);
    }

    @RequestMapping("/contact-api")
    public String contactSentMail(Model model, @RequestParam(required = false) Map<String, String> params) {
        String email = params.getOrDefault("email-contact", null);
        String name = params.getOrDefault("name", null);
        String message = params.getOrDefault("message", null);
        sendMail("1951052049Hien@ou.edu.vn", email, "PHẢN HỒI", "Chúng tôi đã nhận được thông tin liên hệ của bạn " + name + "\nNội dung: " + message + "\nSau khoảng thời gian 15 phút, bộ phận chăm sóc khách hàng sẽ liên hệ lại với bạn.\nTrân trọng.");
        return "redirect:/contact";
    }

    @RequestMapping("/about")
    public String about() {

        return "about";
    }

    @RequestMapping("/news-page")
    public String newsPage() {
        return "news";
    }

    @RequestMapping("/info-ticket")
    public String InfoTicket(Model model, Authentication a, HttpServletRequest request) throws ParseException {
        User u = this.userDetailService.getUsers(a.getName()).get(0);
        int id = u.getId();
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        // Creating the LocalDatetime object
        LocalDate currentLocalDate = LocalDate.now();

        // Getting system timezone
        ZoneId systemTimeZone = ZoneId.systemDefault();

        // converting LocalDateTime to ZonedDateTime with the system timezone
        ZonedDateTime zonedDateTime = currentLocalDate.atStartOfDay(systemTimeZone);

        // converting ZonedDateTime to Date using Date.from() and ZonedDateTime.toInstant()
        Date date = Date.from(zonedDateTime.toInstant());
        String d = f.format(date);
        Date dateNow = f.parse(d);
        model.addAttribute("infoticketofuser", this.ticketDetailService.getTicketOfUser(id, dateNow));
        return "info-ticket";
    }

}
