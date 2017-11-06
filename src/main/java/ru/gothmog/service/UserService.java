package ru.gothmog.service;

import ru.gothmog.model.User;
import ru.gothmog.model.security.PasswordResetToken;
import ru.gothmog.model.security.UserRole;

import java.util.Set;

public interface UserService {

    PasswordResetToken getPasswordResetToken(final String token);

    void createPasswordResetTokenForUser(final User user, final String token);

    User findByUsername(String username);

    User findByEmail(String email);

    User createUser(User user, Set<UserRole> userRoles) throws Exception;

    User save(User user);
}
