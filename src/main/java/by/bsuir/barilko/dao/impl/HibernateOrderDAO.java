package by.bsuir.barilko.dao.impl;


import by.bsuir.barilko.dao.OrderDAO;
import by.bsuir.barilko.entity.orders.Orders;
import by.bsuir.barilko.entity.rooms.Rooms;
import by.bsuir.barilko.entity.user.User;
import by.bsuir.barilko.utils.HibernateSessionFactory;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

@Component
public class HibernateOrderDAO implements OrderDAO {
    private SessionFactory sessionFactory;

    @Autowired
    private HibernateOrderDAO() { sessionFactory = HibernateSessionFactory.getSessionFactory();}


    @Override
    public void addOrder(Orders orders, long userId, long roomId) {
        try(Session session = sessionFactory.openSession()) {
            User user = session.get(User.class,userId);
            Rooms rooms = session.get(Rooms.class, roomId);
            orders.setRoomsOrders(rooms);
            orders.setUsers(user);
            session.getTransaction().begin();
            session.save(orders);
            session.getTransaction().commit();
        }
    }

    @Override
    public void cancelOrders(Long id) {

    }

    @Override
    public void cancelOrdersFromBannedUser(Long id) {

    }

    @Override
    public List<Orders> findAllOrdersOfUser(Long id) {
        return null;
    }

    @Override
    public void updateOrderStatus(Long id, String status) {
        try(Session session = sessionFactory.openSession()) {
            Orders orders = session.get(Orders.class, id);
            orders.setOrder_status(status);
            session.getTransaction().begin();
            session.update(orders);
            session.getTransaction().commit();
        }
    }

    @Override
    public List<Orders> findAllOrders() {
        try(Session session = sessionFactory.openSession()) {
            CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
            CriteriaQuery<Orders> criteriaQuery = criteriaBuilder.createQuery(Orders.class);
            Root<Orders> root = criteriaQuery.from(Orders.class);
            criteriaQuery.select(root);
            Query query = session.createQuery(criteriaQuery);
            return query.getResultList();
        }
    }
}
