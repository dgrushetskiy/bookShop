package ru.gothmog.dao;

import ru.gothmog.model.User;

public interface UserDao extends BasicDao<User>{
    User getByUsername(String username);

    User getByEmail(String email);
}
