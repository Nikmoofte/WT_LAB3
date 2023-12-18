package by.bsuir.barilko.dao;

import by.bsuir.barilko.entity.user.User;

import java.util.List;

public interface UserDAO {

    User findUserByLoginAndPass(String login, String password);
    User findUserByLogin(String login);

    void addUser(User user);
    void setUserBan(long id);
    void setUserAdmin(long id);
    void setUserDiscount(long id, float discount);

    List<User> findAllUsers();
}
