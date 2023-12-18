package by.bsuir.barilko.Controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/main/sing-out")
public class LogOutController {

    @GetMapping
    public String doPost(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
