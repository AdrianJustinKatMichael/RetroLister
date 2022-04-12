package dao;

import models.User;

import java.util.List;

public interface Users {
    User findByUsername(String username);
    Long insert(User user);
    int update(User user);
    List<User> all();
}