package by.bsuir.barilko.dao;

import by.bsuir.barilko.entity.orders.Orders;

import java.util.List;

public interface OrderDAO {

    void addOrder(Orders orders, long userId, long roomId);
    void cancelOrders(Long id);
    void cancelOrdersFromBannedUser(Long id);
    List<Orders> findAllOrdersOfUser(Long id);

    void updateOrderStatus(Long id, String status);
    List<Orders> findAllOrders();

}
