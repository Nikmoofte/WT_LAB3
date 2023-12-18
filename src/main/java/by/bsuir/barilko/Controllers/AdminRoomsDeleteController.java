package by.bsuir.barilko.Controllers;


import by.bsuir.barilko.dao.RoomsDAO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

@Controller
@RequestMapping(value = "/admin/rooms/delete")
public class AdminRoomsDeleteController {


    @Resource
    private RoomsDAO roomsDAO;
    @PostMapping
    public String doPost(@RequestParam(name = "id") String id) {
        roomsDAO.deleteRoom(Long.parseLong(id));
        return "redirect:/admin/rooms";
    }
}
