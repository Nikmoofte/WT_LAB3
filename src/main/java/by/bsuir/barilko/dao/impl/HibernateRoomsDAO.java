package by.bsuir.barilko.dao.impl;

import by.bsuir.barilko.dao.RoomsDAO;
import by.bsuir.barilko.entity.rooms.Rooms;
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
public class HibernateRoomsDAO implements RoomsDAO {

    private SessionFactory sessionFactory;

    @Autowired
    private HibernateRoomsDAO() { sessionFactory = HibernateSessionFactory.getSessionFactory();}

    @Override
    public Rooms findRoomByID(Long ID) {
        try(Session session = sessionFactory.openSession()) {
            Rooms rooms = session.get(Rooms.class, ID);
            return rooms;
        }
    }

    @Override
    public void deleteRoom(long ID) {
        try(Session session = sessionFactory.openSession()) {
            Rooms rooms = session.get(Rooms.class, ID);
            session.getTransaction().begin();
            session.delete(rooms);
            session.getTransaction().commit();
        }
    }

    @Override
    public void addRoom(Rooms rooms) {
        try(Session session = sessionFactory.openSession()) {
            session.getTransaction().begin();
            session.save(rooms);
            session.getTransaction().commit();
        }
    }

    @Override
    public void updateRoom(Rooms rooms, long ID) {
        try(Session session = sessionFactory.openSession()) {
            Rooms tempRooms = session.get(Rooms.class, ID);
            tempRooms.setRooms_discription(rooms.getRooms_discription());
            tempRooms.setRooms_guest_amount(rooms.getRooms_guest_amount());
            tempRooms.setRooms_price(rooms.getRooms_price());
            session.getTransaction().begin();
            session.update(tempRooms);
            session.getTransaction().commit();
        }
    }

    @Override
    public List<Rooms> findAllRooms() {
        try(Session session = sessionFactory.openSession()) {
            CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
            CriteriaQuery<Rooms> criteriaQuery = criteriaBuilder.createQuery(Rooms.class);
            Root<Rooms> root = criteriaQuery.from(Rooms.class);
            criteriaQuery.select(root);
            Query query = session.createQuery(criteriaQuery);
            return query.getResultList();
        }
    }
}
