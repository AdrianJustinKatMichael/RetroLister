package dao;

import models.User;

import java.util.List;

public interface Users {
    User findByUsername(String username);
    User findUserById(Long userId);
    Long insert(User user);
    int update(User user);
    boolean deleteUserById(Long id);
    List<User> all();
}