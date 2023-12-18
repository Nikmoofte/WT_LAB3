package by.bsuir.barilko.Controllers;


import by.bsuir.barilko.dao.UserDAO;
import by.bsuir.barilko.entity.password.Password;
import by.bsuir.barilko.entity.user.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/registration")
public class RegistrationController {

    @Resource
    private UserDAO userDAO;

    @GetMapping
    public String doGet() {
        return "reg";
    }
    private Password password = Password.getInstance();

    @PostMapping
    public String doPost(@RequestParam(name = "name") String name, @RequestParam(name = "surname") String surname, @RequestParam(name = "login") String login, @RequestParam(name = "password") String userPassword, @RequestParam(name = "email") String email, HttpSession session) {
        User user = new User(login, password.hashPassword(userPassword), name, surname, email);
        userDAO.addUser(user);
        user = userDAO.findUserByLoginAndPass(login, password.hashPassword(userPassword));
        if(user != null) {
            if(user.getUser_ban()) {
                session.setAttribute("role", "BANNED");
            }else if (user.getUser_role()) {
                session.setAttribute("role", "admin");
            } else {
                session.setAttribute("role", "client");
            }
            session.setAttribute("name", user.getUser_name() + " " + user.getUser_surname());
            session.setAttribute("id", user.getId_user());
            session.setAttribute("discount", user.getUser_discount() == 0.0 ? 0 : user.getUser_discount());
        }
        return "redirect:/";
    }
}
