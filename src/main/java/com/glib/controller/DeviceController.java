package com.glib.controller;

import com.glib.entity.Company;
import com.glib.entity.Device;
import com.glib.entity.Type;
import com.glib.repos.CompanyRepo;
import com.glib.repos.DeviceRepo;
import com.glib.repos.TypeRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/device")
@PreAuthorize("hasAuthority('ADMIN')")
public class DeviceController {
    @Autowired
    DeviceRepo deviceRepo;
    @Autowired
    CompanyRepo companyRepo;
    @Autowired
    TypeRepo typeRepo;

    @GetMapping
    public String getDevices(Model model) {
        Iterable<Device> devices = deviceRepo.findAll();
        model.addAttribute("devices", devices);
        Iterable<Type> types = typeRepo.findAll();
        Iterable<Company> companies = companyRepo.findAll();
        model.addAttribute("companies", companies);
        model.addAttribute("types", types);
        return "admin/devices";
    }

    @PostMapping
    public String addDevice(@RequestParam String model,
                            @RequestParam Double wattPlay,
                            @RequestParam Integer since,
                            @RequestParam String country,
                            @RequestParam Double wattWait,
                            @RequestParam Company company,
                            @RequestParam Type type) {
        Device device = new Device();
        device.setModel(model);
        device.setWattPlay(wattPlay);
        device.setSince(since);
        device.setCountry(country);
        device.setWattWait(wattWait);
        device.setCompany(company);
        device.setType(type);
        deviceRepo.save(device);
        return "redirect:/device";
    }

    @GetMapping("{device}")
    public String deviceEditForm(@PathVariable Device device,
                                 Model model) {
        model.addAttribute("device", device);
        Iterable<Type> types = typeRepo.findAll();
        Iterable<Company> companies = companyRepo.findAll();
        model.addAttribute("companies", companies);
        model.addAttribute("types", types);
        return "admin/edit/deviceEdit";
    }

    @GetMapping("/remove/{id}")
    public String deletingType(@PathVariable Integer id) {
        Device device = deviceRepo.getDeviceById(id);
        deviceRepo.delete(device);

        return "redirect:/device";
    }

    @PostMapping("/upd/")
    public String typeSave(
            @RequestParam String modelName,
            @RequestParam Double wattPlay,
            @RequestParam String since,
            @RequestParam String country,
            @RequestParam Double wattWait,
            @RequestParam Company company,
            @RequestParam Type type,
            @RequestParam("deviceId") Device device) {
        device.setModel(modelName);
        device.setWattPlay(wattPlay);
        device.setWattWait(wattWait);
        since = since.replaceAll("\\W", "");
        device.setSince(Integer.parseInt(since));
        device.setCountry(country);
        device.setCompany(company);
        device.setType(type);
        deviceRepo.save(device);
        return "redirect:/device";
    }
}
