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
@RequestMapping(value = "/main")
public class MainController {


    @Resource
    private UserDAO userDAO;

    private Password password = Password.getInstance();

    @GetMapping
    public String doGet(){
        return "main";
    }

    @PostMapping
    public String doPost(@RequestParam(name = "login") String userLogin, @RequestParam(name = "password") String userPassword,  HttpSession session) {
        User user = userDAO.findUserByLoginAndPass(userLogin, password.hashPassword(userPassword));
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
        return "main";
    }
}
