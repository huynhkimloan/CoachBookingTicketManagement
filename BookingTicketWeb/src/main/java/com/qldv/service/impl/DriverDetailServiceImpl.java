/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.service.impl;

import com.qldv.pojo.Driverdetail;
import com.qldv.pojo.Rating;
import com.qldv.pojo.User;
import com.qldv.repository.DriverDetailRepository;
import com.qldv.service.DriverDetailService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class DriverDetailServiceImpl implements DriverDetailService {

    @Autowired
    private DriverDetailRepository driverDetailRepository;

    @Override
    public List<Driverdetail> getDrivers(Map<String, String> params, int start, int limit) {
        return this.driverDetailRepository.getDrivers(params, start, limit);
        }

    @Override
    public List<Driverdetail> getListNav(int start, int limit) {
         return this.driverDetailRepository.getListNav(start, limit);
    }

    @Override
    public boolean editDriver(Driverdetail d) {
        return this.driverDetailRepository.editDriver(d);
    }

    @Override
    public int totalItem() {
        return this.driverDetailRepository.totalItem();
    }

    @Override
    public Driverdetail findById(int id) {
        return this.driverDetailRepository.findById(id);
    }

    @Override
    public boolean addDriver(Driverdetail d) {
        return this.driverDetailRepository.addDriver(d);
    }

    @Override
    public boolean deleteDriver(int id) {
        return this.driverDetailRepository.deleteDriver(id);
    }
    
    @Override
    public Rating addRaing(int stars, Driverdetail driverId, User user) {
        return this.driverDetailRepository.addRaing(stars, driverId, user);
    }

    @Override
    public Double avgStar(int id) {
        return this.driverDetailRepository.avgStar(id);
    }

    @Override
    public int driverId(int i) {
        return this.driverDetailRepository.driverId(i);
    }
}
