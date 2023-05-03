/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.utils;

import com.qldv.pojo.Route;
import com.qldv.pojo.Seat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class Utils {

    public static int count(Map<Integer, Seat> seat) {
        int q = 0;
        if (seat != null) {
            for (Seat s : seat.values()) {
                q += s.getQuantity();
            }
        }
        return q;
    }

    public static Map<String, String> seatStats(Map<Integer, Seat> seat) {
        Long a = 0l;
        int q = 0;

        if (seat != null) {
            for (Seat s : seat.values()) {
                q += s.getQuantity();
                a += s.getQuantity() * s.getPrice();
            }
        }
        Map<String, String> kq = new HashMap<>();

        kq.put("counter", String.valueOf(q));
        kq.put("amount", String.valueOf(a));

        return kq;
    }

    public static boolean holiday(Date date) {
        SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
        String dateSTR = f.format(date);
        String[] holiday = {"01-01-2024", "30-04-2023", "01-05-2023", "29-04-2023", "02-09-2023",
            "10-02-2024", "11-02-2024", "12-02-2024", "13-02-2024", "14-02-2024", "15-02-2024", "16-02-2024"};
        for (int i = 0; i < holiday.length; i++) {
            if (holiday[i].equals(dateSTR)) {
                return true;
            }
        }
        return false;
    }

    public static boolean oneHoliday(Date date) {
        SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
        String dateSTR = f.format(date);
        String[] holiday = {"31-12-2023", "28-04-2023", "01-09-2023", "09-02-2024", "17-02-2024",
            "02-01-2024", "02-05-2023", "03-09-2023"};
        for (int i = 0; i < holiday.length; i++) {
            if (holiday[i].equals(dateSTR)) {
                return true;
            }
        }
        return false;
    }

    public static boolean twoHoliday(Date date) {
        SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
        String dateSTR = f.format(date);
        String[] holiday = {"30-12-2023", "27-04-2023", "31-08-2023", "08-02-2024", "18-02-2024",
            "03-01-2024", "03-05-2023", "04-09-2023"};
        for (int i = 0; i < holiday.length; i++) {
            if (holiday[i].equals(dateSTR)) {
                return true;
            }
        }
        return false;
    }

    public static boolean tet3Holiday(Date date) {
        SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
        String dateSTR = f.format(date);
        String[] holiday = {"07-02-2024", "19-02-2024"};
        for (int i = 0; i < holiday.length; i++) {
            if (holiday[i].equals(dateSTR)) {
                return true;
            }
        }
        return false;
    }

    public static boolean tet4Holiday(Date date) {
        SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
        String dateSTR = f.format(date);
        String[] holiday = {"06-02-2024", "20-02-2024"};
        for (int i = 0; i < holiday.length; i++) {
            if (holiday[i].equals(dateSTR)) {
                return true;
            }
        }
        return false;
    }

    public static boolean tet5Holiday(Date date) {
        SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
        String dateSTR = f.format(date);
        String[] holiday = {"05-02-2024", "21-02-2024"};
        for (int i = 0; i < holiday.length; i++) {
            if (holiday[i].equals(dateSTR)) {
                return true;
            }
        }
        return false;
    }

    public static double sumMoney(Date date, Route route) {
        double sum;
        if (holiday(date)) {
            sum = route.getPrice() * (1.05 + route.getSpecialprice());
        } else if (oneHoliday(date)) {
            sum = route.getPrice() * (1.04 + route.getSpecialprice());
        } else if (twoHoliday(date)) {
            sum = route.getPrice() * (1.03 + route.getSpecialprice());
        } else if (tet3Holiday(date)) {
            sum = route.getPrice() * (1.02 + route.getSpecialprice());
        } else if (tet4Holiday(date)) {
            sum = route.getPrice() * (1.01 + route.getSpecialprice());
        } else if (tet5Holiday(date)) {
            sum = route.getPrice() * (1 + route.getSpecialprice());
        } else {
            sum = route.getPrice();
        }
        return sum;
    }

}
