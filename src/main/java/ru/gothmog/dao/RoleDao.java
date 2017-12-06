package ru.gothmog.dao;

import ru.gothmog.model.security.Role;

public interface RoleDao extends BasicDao<Role> {
    Role getByName(String name);
}
