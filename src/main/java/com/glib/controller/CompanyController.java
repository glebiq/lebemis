package com.glib.controller;

import com.glib.entity.Company;
import com.glib.repos.CompanyRepo;
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

    @GetMapping
    public String getCompanies(Model model) {
        Iterable<Company> companies = companyRepo.findAll();
        model.addAttribute("companies", companies);
        return "admin/companies";
    }
    @PostMapping
    public String addCompany(@RequestParam String name){
        Company company = new Company(name);
        companyRepo.save(company);

        return "redirect:/company";
    }
    @GetMapping("{company}")
    public String companyEditForm(@PathVariable Company company,
                               Model model) {
        model.addAttribute("company",company);
        return "admin/edit/companyEdit";
    }
    @GetMapping("/remove/{id}")
    public String deletingCompany(@PathVariable Integer id) {
        Company company = companyRepo.getCompanyById(id);
        companyRepo.delete(company);

        return "redirect:/company";
    }
    @PostMapping("/upd/")
    public String companySave(
            @RequestParam String companyname,
            @RequestParam("companyId") Company company) {
        company.setName(companyname);
       companyRepo.save(company);
        return "redirect:/company";
    }
}
