package com.glib.controller;

import com.glib.entity.Type;
import com.glib.repos.TypeRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/type")
@PreAuthorize("hasAuthority('ADMIN')")
public class TypeController {
    @Autowired
    TypeRepo typeRepo;

    @GetMapping
    public String getTypes(Model model) {
        Iterable<Type> types = typeRepo.findAll();
        model.addAttribute("types", types);
        return "admin/types";
    }

    @PostMapping
    public String addType(@RequestParam String name,
                          @RequestParam Integer avgHoursPerMonth,
                          @RequestParam Double avgWatt) {
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
        typeRepo.delete(typeById);

        return "redirect:/type";
    }

    @PostMapping("/upd/")
    public String typeSave(
            @RequestParam String typename,
            @RequestParam Integer avgWattHoursPerMonth,
            @RequestParam Double avgWatt,
            @RequestParam("typeId") Type type) {
        type.setName(typename);
        type.setAvgWatt(avgWatt);
        type.setAvgHoursPerMonth(avgWattHoursPerMonth);

        typeRepo.save(type);
        return "redirect:/type";
    }
}
