package ru.gothmog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ru.gothmog.service.PasswordResetTokenService;

@Controller
public class TimeController {
    @Autowired
    private PasswordResetTokenService passwordResetTokenService;

    @RequestMapping(value = "/alldate", method = RequestMethod.GET)
    public ModelAndView allByExpireDate(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("alldate");
        return modelAndView;
    }
}
