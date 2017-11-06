package ru.gothmog.dao.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import ru.gothmog.dao.UserDao;
import ru.gothmog.model.User;

public class UserDaoImpl extends BasicDaoImpl<User> implements UserDao{

    private final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);

    public UserDaoImpl(Class<User> entityClass) {
        super(entityClass);
    }

    @Override
    public User getByUsername(String username) {
        User user = (User) getCurrentSession()
                .createQuery("FROM User WHERE username = :username")
                .setParameter("username", username).uniqueResult();
        if (user == null)
            logger.info("User with username {} not exist", username);
        else {
            logger.info("User with username {} was extracted successfully. {}",
                    username, user);
        }
        return user;
    }

    @Override
    public User getByEmail(String email) {
        User user = (User) getCurrentSession()
                .createQuery("FROM User WHERE email = :email")
                .setParameter("email", email).uniqueResult();
        if(user == null)
            logger.info("User with email {} not exist", email);
        else
            logger.info("User with email {} was extracted successfully. {}",
                    email, user);
        return user;
    }
}
