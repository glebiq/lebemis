package com.glib.controller;


import com.glib.entity.Message;
import com.glib.entity.User;
import com.glib.repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.data.domain.Pageable;
import java.util.Map;

@Controller
public class MainController {
    @Autowired
    private MessageRepo messageRepo;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model,
                       @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable) {
        Page<Message> page = messageRepo.findAll(pageable);
        if (filter != null && !filter.isEmpty()) {
            page = messageRepo.findByTextContainsIgnoreCase(filter,pageable);
        } else {
            page = messageRepo.findAll(pageable);
        }
        model.addAttribute("page", page);
        model.addAttribute("url","/main");
        model.addAttribute("filter", filter);

        return "main";
    }

    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String text, Map<String, Object> model) {
        Message message = new Message(text, user);
        messageRepo.save(message);
//        Iterable<Message> messages = messageRepo.findAll();
//        model.put("messages", messages);

        return "redirect:/main";
    }

}
