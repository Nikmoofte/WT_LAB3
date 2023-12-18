package by.bsuir.barilko.Controllers;

import by.bsuir.barilko.dao.OrderDAO;
import by.bsuir.barilko.entity.orders.Orders;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/orders")
public class UserOrdersController {

    @Resource
    private OrderDAO orderDAO;

    @GetMapping
    public String doGet(HttpServletRequest request, HttpSession session) {
        List<Orders> ordersList = orderDAO.findAllOrders();
        List<Orders> resultList = new ArrayList<>();
        long id = (long) session.getAttribute("id");
        for (Orders order: ordersList) {
            if(order.getUsers().getId_user() == id) {
                resultList.add(order);
            }
        }
        request.setAttribute("orders", resultList);
        return "ordersList";
    }
}
