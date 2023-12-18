package by.bsuir.barilko.Controllers;

import by.bsuir.barilko.dao.RoomsDAO;
import by.bsuir.barilko.entity.rooms.Rooms;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/admin/rooms")
public class AdminRoomsController {

    @Resource
    private RoomsDAO roomsDAO;

    @GetMapping
    public String doGet(HttpServletRequest request) {

        request.setAttribute("rooms", roomsDAO.findAllRooms());
        return "admin_rooms";
    }

    @PostMapping
    public String doPost(HttpServletRequest request, @RequestParam(name = "num") String amount, @RequestParam(name = "price") String price, @RequestParam(name = "description") String description) {
        roomsDAO.addRoom(new Rooms(amount, price, description));
        request.setAttribute("rooms", roomsDAO.findAllRooms());
        return "admin_rooms";
    }
}
