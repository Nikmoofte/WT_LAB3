package by.bsuir.barilko.Controllers;

import by.bsuir.barilko.dao.UserDAO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/admin")
public class AdminPanelController {

    @Resource
    private UserDAO userDAO;

    @GetMapping
    public String doGet(HttpServletRequest request) {
        request.setAttribute("users", userDAO.findAllUsers());
        return "admin";
    }

    @PostMapping
    public String doPost(HttpServletRequest request, @RequestParam(name = "sub") String command, @RequestParam(name = "user_id") String user_id, @RequestParam(name = "discount") String discount) {
        long id = Long.parseLong(user_id);

        switch (command) {
            case "discount": {
                float discountSet = Float.parseFloat(discount);
                userDAO.setUserDiscount(id, discountSet);
                break;
            }
            case "admin": {
                userDAO.setUserAdmin(id);
                break;
            }
            case "ban": {
                userDAO.setUserBan(id);
                break;
            }
        }
        request.setAttribute("users", userDAO.findAllUsers());
        return "admin";
    }
}
