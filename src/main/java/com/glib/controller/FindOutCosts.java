package com.glib.controller;

import com.glib.entity.Device;
import com.glib.repos.DeviceRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/findoutcosts")
public class FindOutCosts {
    @Autowired
    DeviceRepo deviceRepo;

    @GetMapping
    public String findOutCosts(Model model) {
        Iterable<Device> allDevices = deviceRepo.findAll();
        model.addAttribute("devices", allDevices);
        return "findoutcosts";
    }
}
