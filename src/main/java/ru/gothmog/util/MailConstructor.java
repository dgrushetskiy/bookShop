package ru.gothmog.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Component;
import ru.gothmog.model.User;

import java.util.Locale;

@Component
@PropertySource(value = {"classpath:email.properties"})
public class MailConstructor {

    @Autowired
    private Environment environment;

    public SimpleMailMessage constructResetTokenEmail(String contextPath, Locale locale, String token, User user, String password) {
        String url = contextPath + "/newUser?token=" + token;
        String message = "\nPlease click on this link to verify your email and edit your personal information. Your password is: \n" + password;
        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(user.getEmail());
        email.setSubject("Spring Test Security - New User");
        email.setText(url + message);
        email.setFrom(environment.getProperty("support.email"));
        return email;
    }
}
