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
@RequestMapping(value = "/admin/rooms/edit")
public class AdminRoomsEditController {


    @Resource
    private RoomsDAO roomsDAO;
    private long idToEdit;
    @GetMapping
    public String doGet(HttpServletRequest request, @RequestParam(name = "id") String id) {
        idToEdit = Long.parseLong(id);
        request.setAttribute("room", roomsDAO.findRoomByID(idToEdit));
        return "admin_room_edit";
    }

    @PostMapping
    public String doPost(@RequestParam(name = "id") String id, @RequestParam(name = "num") String amount, @RequestParam(name = "price") String price, @RequestParam(name = "description") String description) {
        Rooms rooms = new Rooms(amount, price, description);
        roomsDAO.updateRoom(rooms, Long.parseLong(id));
        return "redirect:/admin/rooms";
    }
}
