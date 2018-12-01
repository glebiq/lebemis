package com.glib.controller;

import com.glib.entity.Message;
import com.glib.entity.Role;
import com.glib.entity.User;
import com.glib.entity.UsersDevice;
import com.glib.repos.MessageRepo;
import com.glib.repos.UserRepo;
import com.glib.repos.UsersDeviceRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user")
@PreAuthorize("hasAuthority('ADMIN')")
public class UserController {
    @Autowired
    UserRepo userRepo;
    @Autowired
    MessageRepo messageRepo;
    @Autowired
    UsersDeviceRepo usersDeviceRepo;

    @GetMapping
    public String userList(Model model,
                           @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable) {
        model.addAttribute("page", userRepo.findAll(pageable));
        model.addAttribute("url", "/user");
        return "/admin/users";
    }

    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "admin/edit/userEdit";
    }

    @PostMapping
    public String userSave(
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user) {
        user.setUsername(username);
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        user.getRoles().clear();

        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepo.save(user);
        return "redirect:/user";
    }


    @GetMapping("/remove/{user}")
    public String deletingGet(@PathVariable User user) {
        List<Message> byAuthor = messageRepo.findByAuthor(user);
        List<UsersDevice> usersDevicesByUser = usersDeviceRepo.getUsersDevicesByUser(user);
        for (UsersDevice u:usersDevicesByUser
             ) {
            usersDeviceRepo.delete(u);
        }
        for (Message message : byAuthor) {
            messageRepo.delete(message);
        }
        userRepo.delete(user);

        return "redirect:/user";
    }

}
