package ru.gothmog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ru.gothmog.model.User;
import ru.gothmog.model.security.PasswordResetToken;
import ru.gothmog.model.security.Role;
import ru.gothmog.model.security.UserRole;
import ru.gothmog.service.UserService;
import ru.gothmog.service.impl.UserSecurityService;
import ru.gothmog.util.MailConstructor;
import ru.gothmog.util.SecurityUtility;

import javax.servlet.http.HttpServletRequest;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import java.util.UUID;

@Controller
public class AppController {

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private MailConstructor mailConstructor;

    @Autowired
    private UserService userService;

    @Autowired
    private UserSecurityService userSecurityService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView welcomePage() {
        ModelAndView model = new ModelAndView();
        model.setViewName("index");
        return model;
    }

    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
    public ModelAndView userPage() {

        ModelAndView model = new ModelAndView();
        model.addObject("title", "Spring Security Custom Login Form");
        model.addObject("message", "This is protected page!");
        model.setViewName("welcome");

        return model;

    }

//    @RequestMapping(value =  "/" , method = RequestMethod.GET)
//    public ModelAndView welcomePage() {
//        ModelAndView model = new ModelAndView();
//        model.addObject("title", "Spring Security Custom Login Form");
//        model.addObject("message", "This is welcome page!");
//        model.setViewName("hello");
//        return model;
//    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(@RequestParam(value = "error", required = false) String error,
                              @RequestParam(value = "logout", required = false) String logout) {

        ModelAndView model = new ModelAndView();
        model.addObject("classActiveLogin", true);
        if (error != null) {
            model.addObject("error", "Invalid username and password!");
        }

        if (logout != null) {
            model.addObject("msg", "You've been logged out successfully.");
        }
        model.setViewName("myAccount");

        return model;

    }

    @RequestMapping(value = {"/password/{password}"}, method = RequestMethod.GET)
    public ModelAndView passwordEncode(@PathVariable("password") String password) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("password");
        modelAndView.addObject("crypt", passwordEncoder().encode(password));
        return modelAndView;
    }

    //    @RequestMapping("/forgetPassword")
//    public String forgetPassword(HttpServletRequest request, @ModelAttribute("email") String email, Model model){
//        model.addAttribute("classActiveForgetPassword", true);
//
//        User user = userService.findByEmail(email);
//        if (user == null){
//            model.addAttribute("emailNotExist", true);
//            return "myAccount";
//        }
//
//        String password = SecurityUtility.randomPassword();
//        String encryptedPassword =  passwordEncoder().encode(password);
//        user.setPassword(encryptedPassword);
//       // user = encryptedPassword();
//        userService.save(user);
//
//        String token = UUID.randomUUID().toString();
//        userService.createPasswordResetTokenForUser(user, token);
//
//        String appUrl = "http://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
//        SimpleMailMessage newEmail = mailConstructor.constructResetTokenEmail(appUrl, request.getLocale(), token, user, password);
//        mailSender.send(newEmail);
//
//        model.addAttribute("forgetPasswordEmailSent", true);
//
//        return "myAccount";
//    }
    @RequestMapping("/forgetPassword")
    public ModelAndView forgetPassword(HttpServletRequest request, @ModelAttribute("email") String email) {
        ModelAndView model = new ModelAndView();
        model.addObject("classActiveForgetPassword", true);

        User user = userService.findByEmail(email);
        if (user == null) {
            model.addObject("emailNotExist", true);
            model.setViewName("myAccount");
            return model;
        }

        String password = SecurityUtility.randomPassword();
        String encryptedPassword = passwordEncoder().encode(password);
        user.setPassword(encryptedPassword);
        userService.save(user);

        String token = UUID.randomUUID().toString();
        userService.createPasswordResetTokenForUser(user, token);

        String appUrl = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        SimpleMailMessage newEmail = mailConstructor.constructResetTokenEmail(appUrl, request.getLocale(), token, user, password);
        mailSender.send(newEmail);

        model.addObject("forgetPasswordEmailSent", true);

        model.setViewName("myAccount");
        return model;
    }

//    @RequestMapping(value = "/newUser", method = RequestMethod.POST)
//    public String newUserPost(HttpServletRequest request, @ModelAttribute("email") String userEmail, @ModelAttribute("username") String username, Model model){
//        model.addAttribute("classActiveNewAccount", true);
//        model.addAttribute("email", userEmail);
//        model.addAttribute("username", username);
//
//        if (userService.findByUsername(username) != null){
//            model.addAttribute("usernameExists", true);
//            return "myAccount";
//        }
//
//        if (userService.findByEmail(userEmail) != null){
//            model.addAttribute("email", true);
//            return "myAccount";
//        }
//
//        User user = new User();
//        user.setUsername(username);
//        user.setEmail(userEmail);
//
//        String password = SecurityUtility.randomPassword();
//        String encryptedPassword =  passwordEncoder().encode(password);
//        user.setPassword(encryptedPassword);
//
//        Role role = new Role();
//        role.setName("ROLE_USER");
//        Set<UserRole> userRoles = new HashSet<>();
//        userRoles.add(new UserRole(user, role));
//        try {
//            userService.createUser(user, userRoles);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        String token = UUID.randomUUID().toString();
//        userService.createPasswordResetTokenForUser(user, token);
//
//        String appUrl = "http://" + request.getServerName() + ":"
//                + request.getServerPort()
//                + request.getContextPath();
//
//        SimpleMailMessage email = mailConstructor.constructResetTokenEmail(appUrl, request.getLocale(), token, user, password);
//
//        mailSender.send(email);
//
//        model.addAttribute("emailSent", true);
//
//        return "myAccount";
//    }

    @RequestMapping(value = "/newUser", method = RequestMethod.POST)
    public ModelAndView newUserPost(HttpServletRequest request, @ModelAttribute("email") String userEmail, @ModelAttribute("username") String username) {
        ModelAndView model = new ModelAndView();
        model.addObject("classActiveNewAccount", true);
        model.addObject("email", userEmail);
        model.addObject("username", username);

        if (userService.findByUsername(username) != null) {
            model.addObject("usernameExists", true);
            model.setViewName("myAccount");
            return model;
        }

        if (userService.findByEmail(userEmail) != null) {
            model.addObject("email", true);
            model.setViewName("myAccount");
            return model;
        }

                User user = new User();
        user.setUsername(username);
        user.setEmail(userEmail);

        String password = SecurityUtility.randomPassword();
        String encryptedPassword =  passwordEncoder().encode(password);
        user.setPassword(encryptedPassword);

        Role role = new Role();
        role.setName("ROLE_USER");
        Set<UserRole> userRoles = new HashSet<>();
        userRoles.add(new UserRole(user, role));
        try {
            userService.createUser(user, userRoles);
        } catch (Exception e) {
            e.printStackTrace();
        }

        String token = UUID.randomUUID().toString();
        userService.createPasswordResetTokenForUser(user, token);

        String appUrl = "http://" + request.getServerName() + ":"
                + request.getServerPort()
                + request.getContextPath();

        SimpleMailMessage email = mailConstructor.constructResetTokenEmail(appUrl, request.getLocale(), token, user, password);

        mailSender.send(email);

        model.addObject("emailSent", true);
        model.setViewName("myAccount");
        return model;
    }

    @RequestMapping("/newUser")
    public String newUser(Locale locale, @RequestParam("token") String token, Model model) {
        PasswordResetToken passwordResetToken = userService.getPasswordResetToken(token);

        if (passwordResetToken == null) {
            String message = "Invalid Token.";
            model.addAttribute("message", message);
            return "redirect:/badRequest";
        }

        User user = passwordResetToken.getUser();
        String username = user.getUsername();

        UserDetails userDetails = userSecurityService.loadUserByUsername(username);

        Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, userDetails.getPassword(), userDetails.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authentication);

        model.addAttribute("user", user);
        model.addAttribute("classActiveEdit", true);
        return "myProfile";
    }


    private BCryptPasswordEncoder passwordEncoder() {
        return SecurityUtility.passwordEncoder();
    }

    private User encryptedPassword() {
        User user = new User();
        String password = SecurityUtility.randomPassword();
        String encryptedPassword = passwordEncoder().encode(password);
        user.setPassword(encryptedPassword);
        return user;
    }


}
