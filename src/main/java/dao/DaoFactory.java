package dao;

public class DaoFactory {
    private static Users usersDao;
    private static Config config = new Config();

    public static Users getUsersDao() {
        if (usersDao == null) {
            usersDao = new UsersDao(config);
        }
        return usersDao;
    }
}