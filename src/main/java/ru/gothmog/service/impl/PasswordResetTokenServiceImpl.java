package ru.gothmog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.gothmog.dao.PasswordResetTokenDao;
import ru.gothmog.model.User;
import ru.gothmog.model.security.PasswordResetToken;
import ru.gothmog.service.PasswordResetTokenService;

import java.util.Date;
import java.util.stream.Stream;

@Service
public class PasswordResetTokenServiceImpl implements PasswordResetTokenService{

    @Autowired
    private PasswordResetTokenDao passwordResetTokenDao;
    @Override
    public PasswordResetToken findByToken(String token) {
        return passwordResetTokenDao.getByToken(token);
    }

    @Override
    public PasswordResetToken findByUser(User user) {
        return passwordResetTokenDao.getByUser(user);
    }

    @Override
    public Stream<PasswordResetToken> findAllByExpireDateLessThan(Date date) {
        return passwordResetTokenDao.getAllByExpireDateLessThan(date);
    }
}
