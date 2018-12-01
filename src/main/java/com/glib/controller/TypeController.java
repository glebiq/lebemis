package com.glib.controller;

import com.glib.entity.Device;
import com.glib.entity.Type;
import com.glib.repos.DeviceRepo;
import com.glib.repos.TypeRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/type")
@PreAuthorize("hasAuthority('ADMIN')")
public class TypeController {
    @Autowired
    TypeRepo typeRepo;
    @Autowired
    DeviceRepo deviceRepo;

    @GetMapping
    public String getTypes(Model model,
                           @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable) {
        Iterable<Type> types = typeRepo.findAll(pageable);
        model.addAttribute("page", types);
        model.addAttribute("url","/type");
        return "admin/types";
    }

    @PostMapping
    public String addType(@RequestParam String name,
                          @RequestParam Integer avgHoursPerMonth,
                          @RequestParam Integer avgWatt, Model model,
                          @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable) {
        if (typeRepo.getTypeByName(name) != null) {
            model.addAttribute("error", "Type " + name + " already exists!");
            Iterable<Type> types = typeRepo.findAll(pageable);
            model.addAttribute("page", types);
            model.addAttribute("url","/type");
            return "admin/types";
        }

        Type type = new Type(name, avgWatt, avgHoursPerMonth);
        typeRepo.save(type);

        return "redirect:/type";
    }

    @GetMapping("{type}")
    public String typeEditForm(@PathVariable Type type,
                               Model model) {
        model.addAttribute("type", type);

        return "admin/edit/typeEdit";
    }

    @GetMapping("/remove/{id}")
    public String deletingType(@PathVariable Integer id) {
        Type typeById = typeRepo.getTypeById(id);

        for (Device device : deviceRepo.getDevicesByType(typeById)) {
            deviceRepo.delete(device);
        }
        typeRepo.delete(typeById);

        return "redirect:/type";
    }

    @PostMapping("/upd/")
    public String typeSave(
            @RequestParam String typename,
            @RequestParam Integer avgWattHoursPerMonth,
            @RequestParam Integer avgWatt,
            @RequestParam("typeId") Type type,
            Model model) {
        if (typeRepo.getTypeByName(typename) != null && !type.getName().equals(typename)) {
            model.addAttribute("error", "Type " + typename + " already exists!");
            model.addAttribute("type", type);

            return "admin/edit/typeEdit";
        }
        type.setName(typename);
        type.setAvgWatt(avgWatt);

        typeRepo.save(type);
        return "redirect:/type";
    }
}
