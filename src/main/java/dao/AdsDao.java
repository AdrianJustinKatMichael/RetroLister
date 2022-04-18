package dao;

import models.Ad;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdsDao implements Ads{
    private Connection connection;

    public AdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database.", e);
        }
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public List<Ad> search(String searchQuery) {
        String query = "SELECT * FROM ads WHERE title LIKE ? OR console LIKE ?";
        String queryWildCard = "%" + searchQuery + "%";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, queryWildCard);
            stmt.setString(2, queryWildCard);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error searching for ads.", e);
        }
    }

    @Override
    public List<Ad> usersAds(Long userId) {
        String query = "SELECT * FROM ads WHERE user_id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, userId);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving user's ads.", e);
        }
    }

    @Override
    public List<Ad> lastFiveAds() {
        String query = "SELECT * FROM ads ORDER BY id DESC LIMIT 5";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving last five ads.", e);
        }
    }

    @Override
    public Ad findAdById(Long adId) {
        String query = "SELECT * FROM ads WHERE id = ?";
        Ad ad = null;
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, adId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ad = new Ad(
                        rs.getLong("id"),
                        rs.getLong("user_id"),
                        rs.getString("title"),
                        rs.getString("console"),
                        rs.getString("description"),
                        rs.getString("image_url"),
                        rs.getString("post_type")
                );
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error finding an ad by that id.", e);
        }
        return ad;
    }

    @Override
    public Long insert(Ad ad) {
        try {
            String query = "INSERT INTO ads(user_id, title, console, description, image_url, post_type) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getConsole());
            stmt.setString(4, ad.getDescription());
            stmt.setString(5, ad.getImageUrl());
            stmt.setString(6, ad.getPostType());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    @Override
    public int update(Ad ad) {
        String query = "UPDATE ads SET title = ?, console = ?, description = ?, image_url = ?, post_type = ? WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, ad.getTitle());
            stmt.setString(2, ad.getConsole());
            stmt.setString(3, ad.getDescription());
            stmt.setString(4, ad.getImageUrl());
            stmt.setString(5, ad.getPostType());
            stmt.setLong(6, ad.getId());
            return stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error updating ad.", e);
        }
    }

    @Override
    public boolean delete(Long adId) {
        try {
            String query = "DELETE FROM ads WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, adId);
            return stmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting ad.", e);
        }
    }

    @Override
    public boolean deleteByUserId(Long userId) {
        try {
            String query = "DELETE FROM ads WHERE user_id = ?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, userId);
            return stmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting user's ad(s).", e);
        }
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
                rs.getLong("id"),
                rs.getLong("user_id"),
                rs.getString("title"),
                rs.getString("console"),
                rs.getString("description"),
                rs.getString("image_url"),
                rs.getString("post_type")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }
}
