/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.controllers;

import com.qldv.pojo.Ticketdetail;
import com.qldv.pojo.User;
import com.qldv.service.TicketDetailService;
import com.qldv.service.UserService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author ASUS
 */
@Controller
public class UserController {

    @Autowired
    private UserService userDetailService;
    
     @Autowired
    private TicketDetailService ticketDetailService;
     
    @Autowired
    private MailSender mailSender;

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/register")
    public String registerView(Model model) {
        model.addAttribute("user", new User());

        return "register";
    }

    public void sendMail(String from, String to, String subject, String content){
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom(from);
        mailMessage.setTo(to);
        mailMessage.setSubject(subject);
        mailMessage.setText(content);
        
        mailSender.send(mailMessage);
    }
    
    @PostMapping("/register")
    public String registerProcess(Model model, @ModelAttribute(value = "user") @Valid User user, BindingResult result) {
        String errMsg = "";

        if (user.getPassword().isEmpty()
                || !user.getPassword().equals(user.getConfirmPassword())) {
            errMsg = "M???t kh???u kh??ng kh???p !";
            model.addAttribute("errMsg", errMsg);
        } else {
            if (this.userDetailService.addUser(user) == true) {
                sendMail("1951052049Hien@ou.edu.vn", "dieuhien987654@gmail.com", "Ph???n H???i", "C???m ??n b???n ???? li??n h??? v???i ch??ng t??i");
                return "redirect:/login";
            } else {
                errMsg = "???? c?? l???i x???y ra!";
                model.addAttribute("errMsg", errMsg);
            }
        }

        return "register";

    }
    
    @GetMapping("/info-ticket/{id}")
    public String cancelTicket(Model model, @PathVariable(value = "id") int ticketId) {
        model.addAttribute("cancel", this.ticketDetailService.getTicketById(ticketId));
        return "cancel-ticket";
    }
    
    @PostMapping("/info-ticket-confirm")
    public String cancelTicket(Model model, @ModelAttribute(value="cancel") @Valid Ticketdetail cancel, 
           
            BindingResult result, Authentication a) throws ParseException{
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        User u = this.userDetailService.getUsers(a.getName()).get(0);
        String errMsg ="";
//         if(result.hasErrors())
//            errMsg = "Vui l??ng ki???m tra l???i th??ng tin h???y v??!";
//        else{
//            Date d = (f.parse(params.getOrDefault("cd", null)));
        
            cancel.setUserId(u);
            cancel.setCreateddate(new Date());
//            String date = f.format(cancel.getCreateddate());
//        try {
//            cancel.setCreateddate(f.parse(date));
//        } catch (ParseException ex) {
//            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
//        }
            if(this.ticketDetailService.cancelTicket(cancel) ==  true)
                return "redirect:/info-ticket";
            else
                errMsg = "???? c?? l???i x???y ra, kh??ng h???y v?? ???????c!!!"; 
//            }
        model.addAttribute("errMsg", errMsg);
        model.addAttribute("d", cancel.getCreateddate());
        return "cancel-ticket";
    }
}
