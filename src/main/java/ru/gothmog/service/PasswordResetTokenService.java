package ru.gothmog.service;

import ru.gothmog.model.User;
import ru.gothmog.model.security.PasswordResetToken;

import java.util.Date;
import java.util.stream.Stream;

public interface PasswordResetTokenService {

    PasswordResetToken findByToken(String token);

    PasswordResetToken findByUser(User user);

    Stream<PasswordResetToken> findAllByExpireDateLessThan(Date now);
}
