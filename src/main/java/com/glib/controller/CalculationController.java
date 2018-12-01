package com.glib.controller;

import com.glib.entity.Device;
import com.glib.entity.User;
import com.glib.entity.UsersDevice;
import com.glib.repos.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Iterator;
import java.util.List;

@Controller
@RequestMapping("/calculation")
public class CalculationController {
    @Autowired
    UserRepo userRepo;
    @Autowired
    DeviceRepo deviceRepo;
    @Autowired
    UsersDeviceRepo usersDeviceRepo;
    @Autowired
    TypeRepo typeRepo;
    @Autowired
    CompanyRepo companyRepo;

    @GetMapping
    public String usersDevice(@AuthenticationPrincipal User user,
                              Model model,
                              @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable) {

        Page<UsersDevice> usersDevicesByUser = usersDeviceRepo.getUsersDevicesByUser(user,pageable);
        long totalElements = usersDevicesByUser.getTotalElements();
        int a =(int) totalElements;
        Iterable<Device> devices = deviceRepo.findAll();
        model.addAttribute("page", usersDevicesByUser);
        model.addAttribute("url","/calculation");
        model.addAttribute("devices", devices);
        Double ActM = 0d;
        Double PasM = 0d;
        Page<UsersDevice> usersDevicesByUser1 = usersDeviceRepo.getUsersDevicesByUser(user, new PageRequest(0, a));

        for (UsersDevice u : usersDevicesByUser1) {
            Double WaitCosts = u.getPassiveTimeUsage() * u.getDevice().getWattWait();
            Double ActCosts = u.getActiveTimeUsage() * u.getDevice().getWattPlay();

            ActM += ActCosts;
            PasM += WaitCosts;

        }

        Double costs = ActM + PasM;
        costs /= 1000;
        model.addAttribute("watts",String.format("%.2f", costs));
        if (costs < 100) {
            costs *= 0.9;
        } else {
            costs *= 1.68;
        }
        String formattedDouble = String.format("%.2f", costs);
        model.addAttribute("costs", formattedDouble);

        return "calculation";
    }

    @PostMapping
    public String addDeviceToUser(@AuthenticationPrincipal User user,
                                  @RequestParam Device device

            , @RequestParam Integer activeTime, @RequestParam Integer passiveTime) {
        UsersDevice usersDevice;
        if (passiveTime == null) {
            usersDevice = new UsersDevice(user, device, activeTime, 0);
        } else {
            usersDevice = new UsersDevice(user, device, activeTime, passiveTime);
        }

        usersDeviceRepo.save(usersDevice);

        return "redirect:/calculation";
    }

    @GetMapping("/remove/{id}")
    public String deletingCompany(@PathVariable Integer id) {
        UsersDevice us = usersDeviceRepo.getUsersDevicesById(id);

        usersDeviceRepo.delete(us);

        return "redirect:/calculation";
    }


}
