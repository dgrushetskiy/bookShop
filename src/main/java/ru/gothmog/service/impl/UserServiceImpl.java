package ru.gothmog.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.gothmog.dao.PasswordResetTokenDao;
import ru.gothmog.dao.RoleDao;
import ru.gothmog.dao.UserDao;
import ru.gothmog.model.User;
import ru.gothmog.model.security.PasswordResetToken;
import ru.gothmog.model.security.UserRole;
import ru.gothmog.service.UserService;

import java.util.Set;

@Service
public class UserServiceImpl implements UserService {

    private static final Logger LOG = LoggerFactory.getLogger(UserService.class);
    @Autowired
    private UserDao userDao;
    @Autowired
    private RoleDao roleDao;
    @Autowired
    private PasswordResetTokenDao passwordResetTokenDao;

    @Override
    public PasswordResetToken getPasswordResetToken(String token) {
        return passwordResetTokenDao.getByToken(token);
    }

    @Override
    public void createPasswordResetTokenForUser(User user, String token) {
        PasswordResetToken myToken = new PasswordResetToken(token, user);
        passwordResetTokenDao.create(myToken);
    }

    @Override
    @Transactional
    public void updatePasswordResetTokenForUser(User user, String token) {
        PasswordResetToken updateToken = new PasswordResetToken(token, user);
        passwordResetTokenDao.update(updateToken);
    }

    @Override
    public User findByUsername(String username) {
        return userDao.getByUsername(username);
    }

    @Override
    public User findByEmail(String email) {
        return userDao.getByEmail(email);
    }

    @Override
    @Transactional
    public User createUser(User user, Set<UserRole> userRoles) throws Exception {
        User localUser = userDao.getByUsername(user.getUsername());

        if (localUser != null) {
            LOG.info("user {*} already exists. Nothing will be done", user.getUsername());
        } else {
            for (UserRole userRole : userRoles) {
                roleDao.create(userRole.getRole());
            }
            user.getUserRoles().addAll(userRoles);
            localUser = userDao.create(user);
        }
        return localUser;
    }

    @Override
    public User save(User user) {
        return userDao.saveOrUpdate(user);
    }

    @Override
    public User update(User user) {
        return userDao.update(user);
    }
}
