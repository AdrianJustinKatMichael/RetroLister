package dao;

import models.Ad;
import java.util.List;

public interface Ads {
    List<Ad> all();
    List<Ad> search(String searchQuery);
    List<Ad> usersAds(Long userId);
    List<Ad> lastFiveAds();
    Ad findAdById(Long adId);
    Long insert(Ad ad);
    int update(Ad ad);
    boolean delete(Long adId);
}
