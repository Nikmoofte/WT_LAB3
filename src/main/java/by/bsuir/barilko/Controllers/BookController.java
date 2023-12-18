package by.bsuir.barilko.Controllers;


import by.bsuir.barilko.dao.OrderDAO;
import by.bsuir.barilko.dao.RoomsDAO;
import by.bsuir.barilko.entity.orders.Orders;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;

@Controller
@RequestMapping(value = "/book")
public class BookController {
    @Resource
    private OrderDAO orderDAO;
    @Resource
    private RoomsDAO roomsDAO;

    @GetMapping
    public String doGet(HttpServletRequest request) {
        request.setAttribute("rooms", roomsDAO.findAllRooms());
        return "order";
    }

    @PostMapping
    public String doPost(@RequestParam(name = "type") String type, @RequestParam(name = "name") String name, @RequestParam(name = "surname") String surname, @RequestParam(name = "phone") String phone, @RequestParam(name = "email") String email, @RequestParam(name = "roomID") String roomID, @RequestParam(name = "startDate") String startDate, @RequestParam(name = "endDate") String endDate, HttpSession session) throws ParseException {
        long idUser = (long) session.getAttribute("id");
        long idRoom = Long.parseLong(roomID);
        Orders orders = new Orders(type, name, surname, phone, email, "SENTED", Boolean.toString(false), startDate, endDate);
        orderDAO.addOrder(orders, idUser, idRoom);
        return "redirect:/orders";
    }



}
