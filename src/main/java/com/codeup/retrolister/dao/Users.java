package com.codeup.retrolister.dao;

import com.codeup.retrolister.models.User;

public interface Users {
    User findByUsername(String username);
    Long insert(User user);
}