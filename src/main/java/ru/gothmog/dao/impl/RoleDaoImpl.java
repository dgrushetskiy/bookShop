package ru.gothmog.dao.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import ru.gothmog.dao.RoleDao;
import ru.gothmog.model.security.Role;

public class RoleDaoImpl extends BasicDaoImpl<Role> implements RoleDao {

    private final Logger logger = LoggerFactory.getLogger(RoleDaoImpl.class);

    public RoleDaoImpl(Class<Role> entityClass) {
        super(entityClass);
    }

    @Override
    public Role getByName(String name) {
        Role role = (Role) getCurrentSession()
                .createQuery("FROM Role WHERE name = :name")
                .setParameter("name", name)
                .uniqueResult();
        if (role == null) {
            logger.info("Role with name {} not exist", name);
        } else {
            logger.info("Role with name {} was extracted successfully. {}",
                    name, role);
        }
        return role;
    }
}
