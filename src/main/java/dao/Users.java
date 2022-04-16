package dao;

import models.User;

import java.util.List;

public interface Users {
    User findByUsername(String username);
    User findUserById(Long userId);
    Long insert(User user);
    void update(Long id);
    void updateUsername(Long id, String username);
    void updateEmail(Long id, String email);
    void updatePassword(Long id, String newPassword);
    void deleteUser(Long id);
    List<User> all();
}