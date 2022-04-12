package dao;

import models.User;

public interface Users {
    User findByUsername(String username);
    User findUserById(Long userId);
    Long insert(User user);
}