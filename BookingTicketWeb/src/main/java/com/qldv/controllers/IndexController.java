/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.controllers;

import com.qldv.pojo.Route;
import com.qldv.pojo.Seat;
import com.qldv.pojo.Ticketdetail;
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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    public String index(Model model, @RequestParam(required = false) Map<String, String> params) {
        String kw = params.getOrDefault("kw", null);
        String kw1 = params.getOrDefault("kw1", null);
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
//        List<Double> prices = new ArrayList<>();
        List<Route> route = this.routeService.getRoutes(kw, kw1, page);
        for (Route r : route ){
//            for (double obj : prices){
//                obj = Utils.sumMoney(new Date(), r);
//            }
              r.setPrice((long)Utils.sumMoney(new Date(), r));
        }
        
        model.addAttribute("routes", route);
//        model.addAttribute("prices", prices);
        model.addAttribute("counter", this.routeService.countRoute());
        return "index";
    }

    @RequestMapping("/user-profile")
    public String userProfile(Authentication a, HttpServletRequest request) {
        User u = this.userDetailService.getUsers(a.getName()).get(0);
        request.getSession().setAttribute("user", u);
        return "userprofile";
    }
    
    @RequestMapping("/contact")
    public String contact() {
        
        return "contact";
    }
    
    public void sendMail(String from, String to, String subject, String content){
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
        sendMail("1951052049Hien@ou.edu.vn", email, "Ph???n H???i", "Ch??ng t??i ???? nh???n ???????c th??ng tin li??n h??? c???a b???n " + name + "\nN???i dung: " + message + "\nSau kho???ng th???i gian 15 ph??t, b??? ph???n ch??m s??c kh??ch h??ng s??? li??n h??? l???i v???i ban.\nTr??n tr???ng.");
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
