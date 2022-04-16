package dao;

import models.User;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static util.Password.hash;

public class UsersDao implements Users {
    private Connection connection;

    public UsersDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public User findByUsername(String username) {
        String query = "SELECT * FROM users WHERE username = ? LIMIT 1";
        User user = null;
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                user = new User(
                        rs.getLong("id"),
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getBoolean("isAdmin")
                );
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by username", e);
        }
        return user;
    }

    @Override
    public User findUserById(Long userId) {
        String query = "SELECT * FROM users WHERE id = ?";
        User user = null;
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                user = new User(
                        rs.getLong("id"),
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getBoolean("isAdmin")
                );
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by that id.", e);
        }
        return user;
    }

    @Override
    public Long insert(User user) {
        String query = "INSERT INTO users(username, email, password, isAdmin) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setBoolean(4, user.isAdmin());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating new user", e);
        }
    }

    private User extractUser(ResultSet rs) {
        try {
            return new User(
                    rs.getLong("id"),
                    rs.getString("username"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getBoolean("isAdmin")
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error extracting user", e);
        }
    }

    @Override
    public void updateUsername(Long id, String username) {
        String query = "UPDATE users SET username = ? WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, username);
            stmt.setLong(2, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error updating user.", e);
        }
    }

    @Override
    public void updateEmail(Long id, String email) {
        String query = "UPDATE users SET email = ? WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, email);
            stmt.setLong(2, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error updating user.", e);
        }
    }

    @Override
    public void updatePassword(Long id, String password) {
        String query = "UPDATE users SET password = ? WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, hash(password));
            stmt.setLong(2, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error updating user.", e);
        }
    }

    /*
    *   From here I want to take these new update methods and execute them through the Profile servlet. ✅
    *   Whenever the form is submitted, each parameter will be passed and executed.
    *   When the form is executed it will redirect to the login page (both delete and update).
    * */

    @Override
    public void update(Long id) {
        String query = "UPDATE users SET isAdmin = 1 WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error updating user.", e);
        }
    }

    @Override
    public void deleteUser(Long id) {
        try {
            String query = "DELETE FROM users WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, id);
            stmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting user.", e);
        }
    }

    @Override
    public List<User> all() {
        PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement("SELECT * FROM users");
            ResultSet rs = stmt.executeQuery();
            return createUsersFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all users.", e);
        }
    }

    private List<User> createUsersFromResults(ResultSet rs) throws SQLException {
        List<User> users = new ArrayList<>();
        while (rs.next()) {
            users.add(extractUser(rs));
        }
        return users;
    }
}
