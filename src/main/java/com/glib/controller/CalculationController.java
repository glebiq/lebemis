package com.glib.controller;

import com.glib.entity.*;
import com.glib.repos.*;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
                              Model model) {
//        Iterable<Type> types = typeRepo.findAll();
        List<UsersDevice> usersDevicesByUser = usersDeviceRepo.getUsersDevicesByUser(user);
//        Iterable<Company> companies = companyRepo.findAll();
        Iterable<Device> devices = deviceRepo.findAll();
        model.addAttribute("usersdevice", usersDevicesByUser);
//        model.addAttribute("types",types);
//        model.addAttribute("companies",companies);
        model.addAttribute("devices", devices);
        return "calculation";
    }

    @PostMapping
    public String addDeviceToUser(@AuthenticationPrincipal User user,
                                  @RequestParam Device device
//                                  , @RequestParam Type type,
//                                  @RequestParam Company company
 ,@RequestParam Integer activeTime, @RequestParam Integer passiveTime) {
        UsersDevice usersDevice = new UsersDevice(user,device,activeTime,passiveTime);
        usersDeviceRepo.save(usersDevice);

        return"redirect:/calculation";
}


}
