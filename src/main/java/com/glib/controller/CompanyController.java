package com.glib.controller;

import com.glib.entity.Company;
import com.glib.entity.Device;
import com.glib.repos.CompanyRepo;
import com.glib.repos.DeviceRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/company")
@PreAuthorize("hasAuthority('ADMIN')")
public class CompanyController {
    @Autowired
    CompanyRepo companyRepo;
    @Autowired
    DeviceRepo deviceRepo;

    @GetMapping
    public String getCompanies(Model model) {
        Iterable<Company> companies = companyRepo.findAll();
        model.addAttribute("companies", companies);
        return "admin/companies";
    }

    @PostMapping
    public String addCompany(@RequestParam String name, Model model) {
        if (companyRepo.getCompanyByName(name) != null) {
            model.addAttribute("error", "Company " + name + " already exists!");
            Iterable<Company> companies = companyRepo.findAll();
            model.addAttribute("companies", companies);
            return "admin/companies";
        }
        Company company = new Company(name);
        companyRepo.save(company);

        return "redirect:/company";
    }

    @GetMapping("{company}")
    public String companyEditForm(@PathVariable Company company,
                                  Model model) {
        model.addAttribute("company", company);
        return "admin/edit/companyEdit";
    }

    @GetMapping("/remove/{id}")
    public String deletingCompany(@PathVariable Integer id) {
        Company company = companyRepo.getCompanyById(id);
        for (Device device : deviceRepo.getDevicesByCompany(company)) {
            deviceRepo.delete(device);
        }
        companyRepo.delete(company);

        return "redirect:/company";
    }

    @PostMapping("/upd/")
    public String companySave(
            @RequestParam String companyname,
            @RequestParam("companyId") Company company,
            Model model) {
        if (companyRepo.getCompanyByName(companyname) != null && !company.getName().equals(companyname)) {
            model.addAttribute("error", "Company "+companyname +" already exists!");
            model.addAttribute("company", company);
            return "admin/edit/companyEdit";
        }
        company.setName(companyname);
        companyRepo.save(company);
        return "redirect:/company";
    }
}
