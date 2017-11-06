package ru.gothmog.dao;

import ru.gothmog.model.User;
import ru.gothmog.model.security.PasswordResetToken;

import java.util.Date;
import java.util.stream.Stream;

public interface PasswordResetTokenDao extends BasicDao<PasswordResetToken>{

    PasswordResetToken getByToken(String token);

    PasswordResetToken getByUser(User user);

    Stream<PasswordResetToken> getAllByExpireDateLessThan(Date now);

    void deleteAllExpiredSince(Date now);
}
