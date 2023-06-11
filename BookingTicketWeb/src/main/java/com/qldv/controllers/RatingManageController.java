/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.controllers;

import com.qldv.service.EmployeeService;
import com.qldv.service.RatingService;
import com.qldv.service.UserService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
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
    private EmployeeService employeeService;

    @Autowired
    private UserService userService;
    
    @Autowired
    private UserService userDetailService;
    
    @Autowired
    private MailSender mailSender;

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
    
    @GetMapping("/lockRatingDriver/{driverId}")
    public String lockDriver(@RequestParam Map<String, String> params, ModelMap mm, @PathVariable("driverId") int driverId) {
        employeeService.lockEmployee(userService.getById(driverId));
        sendMail("1951052049hien@ou.edu.vn", userService.getById(driverId).getEmail(), "KHÓA TÀI KHOẢN", "Xin chào " + userService.getById(driverId).getName()
                + "\nTài khoản của bạn đã bị khóa. Bạn không thể đăng nhập vào website LoHiBusLine. Vui lòng liên hệ admin để mở khóa tài khoản."
                + "\nTrân trọng.");
        viewRatingList(params, mm);
        return "ratings";
    }

    @GetMapping("/openRatingDriver/{driverId}")
    public String openDriver(@RequestParam Map<String, String> params, ModelMap mm, @PathVariable("driverId") int driverId) {
        employeeService.openEmployee(userService.getById(driverId));
        viewRatingList(params, mm);
        return "ratings";
    }
    
    public void sendMail(String from, String to, String subject, String content) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom(from);
        mailMessage.setTo(to);
        mailMessage.setSubject(subject);
        mailMessage.setText(content);

        mailSender.send(mailMessage);
    }
}
