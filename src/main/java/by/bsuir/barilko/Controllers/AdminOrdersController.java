package by.bsuir.barilko.Controllers;


import by.bsuir.barilko.dao.OrderDAO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/admin/orders")
public class AdminOrdersController {

    @Resource
    private OrderDAO orderDAO;

    @GetMapping
    public String doGet(HttpServletRequest request) {
        request.setAttribute("orders", orderDAO.findAllOrders());
        return "admin_orders";
    }

    @PostMapping
    public String doPost(@RequestParam(name = "status") String status, @RequestParam(name = "id") String roomID) {
        long id = Long.parseLong(roomID);
        orderDAO.updateOrderStatus(id, status.toUpperCase());
        return "redirect:/admin/orders";
    }
}
