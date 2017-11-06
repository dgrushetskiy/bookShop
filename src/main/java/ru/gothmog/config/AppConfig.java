package ru.gothmog.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.jdbc.JdbcDaoImpl;
import ru.gothmog.dao.PasswordResetTokenDao;
import ru.gothmog.dao.RoleDao;
import ru.gothmog.dao.UserDao;
import ru.gothmog.dao.impl.PasswordResetTokenDaoImpl;
import ru.gothmog.dao.impl.RoleDaoImpl;
import ru.gothmog.dao.impl.UserDaoImpl;
import ru.gothmog.model.User;
import ru.gothmog.model.security.PasswordResetToken;
import ru.gothmog.model.security.Role;

@Configuration
@PropertySource(value = {"classpath:auth.properties"})
public class AppConfig {

    private final Logger logger = LoggerFactory.getLogger(AppConfig.class);

    @Autowired
    private Environment environment;

    @Autowired
    private HibernateConfig hibernateConfig;

    @Bean
    public UserDetailsService userDetailsService(){
        JdbcDaoImpl jdbcDao = new JdbcDaoImpl();
        jdbcDao.setDataSource(hibernateConfig.dataSource());
        jdbcDao.setUsersByUsernameQuery(environment.getRequiredProperty("usersByQuery"));
        jdbcDao.setAuthoritiesByUsernameQuery(environment.getRequiredProperty("rolesByQuery"));
        return jdbcDao;
    }

    @Bean
    public UserDao userDao(){
        return new UserDaoImpl(User.class);
    }

    @Bean
    public RoleDao roleDao(){
        return new RoleDaoImpl(Role.class);
    }

    @Bean
    public PasswordResetTokenDao passwordResetTokenDao(){
        return new PasswordResetTokenDaoImpl(PasswordResetToken.class);
    }
}
