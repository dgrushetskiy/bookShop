package ru.gothmog.dao.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import ru.gothmog.dao.PasswordResetTokenDao;
import ru.gothmog.model.User;
import ru.gothmog.model.security.PasswordResetToken;

import java.util.Date;
import java.util.stream.Stream;

public class PasswordResetTokenDaoImpl extends BasicDaoImpl<PasswordResetToken> implements PasswordResetTokenDao{

    private final Logger logger = LoggerFactory.getLogger(PasswordResetTokenDaoImpl.class);

    public PasswordResetTokenDaoImpl(Class<PasswordResetToken> entityClass) {
        super(entityClass);
    }

    @Override
    public PasswordResetToken getByToken(String token) {
        PasswordResetToken passwordResetToken = (PasswordResetToken) getCurrentSession()
                .createQuery("FROM PasswordResetToken WHERE token = :token")
                .setParameter("token", token)
                .uniqueResult();

        if (passwordResetToken == null){
            logger.info("PasswordResetToken witch token {} not exist", token);
        } else {
            logger.info("PasswordResetToken witch token {} was extracted successfully. {}", token, passwordResetToken);
        }
        return passwordResetToken;
    }

    @Override
    public PasswordResetToken getByUser(User user) {
        PasswordResetToken passwordResetToken = (PasswordResetToken) getCurrentSession()
                .createQuery("FROM PasswordResetToken WHERE user = :user ORDER BY token DESC")
                .setParameter("user",user)
                .uniqueResult();

        if (passwordResetToken == null){
            logger.info("PasswordResetToken witch user {} not exist", user);
        } else {
            logger.info("PasswordResetToken witch user {} was extracted successfully. {}", user, passwordResetToken);
        }
        return passwordResetToken;
    }

    @Override
    public Stream<PasswordResetToken> getAllByExpireDateLessThan(Date now) {
        return null;
    }

    @Override
    public void deleteAllExpiredSince(Date now) {
        int result = getCurrentSession()
                .createQuery("DELETE FROM PasswordResetToken WHERE expiryDate <= :now")
                .setParameter("now", now)
                .executeUpdate();
        logger.info("All Expired Since were deleted. Result = {}", result);
    }
}
