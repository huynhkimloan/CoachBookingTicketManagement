/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.service;

import com.qldv.pojo.Route;
import com.qldv.pojo.Trip;
import java.sql.Time;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 *
 * @author ASUS
 */
public interface TripService {

    List<Trip> searchTripOnComment(String kw, String kw1, Date fromDate, int page);
    
    List<Trip> getRouteTrips(String kw, String kw1, Date fromDate, int page);

    List<Trip> findById(int routeId);

    List<Trip> getTrips(Map<String, String> params, int start, int limit);

    List<Trip> getListNav(int start, int limit);

    List<Trip> getTrips(String kw);
    
    List<Trip> getTrips();
    
    Route getRouteByTrip(int id);

    Trip addTrip(Trip t);

    boolean editTrip(Trip t);

    boolean deleteTrip(int id);

    int totalItem();

    Trip tripById(int tripId);
    
    List<Trip> tripComment();
    
    List<Trip> getListTripComment();
    
    long countTrip(String kw, String kw1, Date fromDate);
    
    public List<Trip> getDeparturedayTrips(int id, int page);
    
    public int getRouteIdByKeyword(String kw, String kw1);
}
