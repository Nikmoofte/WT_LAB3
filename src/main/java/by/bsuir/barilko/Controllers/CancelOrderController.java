package by.bsuir.barilko.Controllers;


import by.bsuir.barilko.dao.OrderDAO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

@Controller
@RequestMapping(value = "/orders/cancel")
public class CancelOrderController {
    
    @Resource
    private OrderDAO orderDAO;

    @PostMapping
    public String doPost(@RequestParam(name = "orderID") String id) {
        orderDAO.updateOrderStatus(Long.parseLong(id), "CANCELED");
        return "redirect:/orders";
    }
}
