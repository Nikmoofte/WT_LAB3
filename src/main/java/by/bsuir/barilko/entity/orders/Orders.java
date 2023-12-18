package by.bsuir.barilko.entity.orders;


import by.bsuir.barilko.entity.rooms.Rooms;
import by.bsuir.barilko.entity.user.User;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
@Getter
@Setter
@Table(name = "orders")

public class Orders {

    public Orders() {}
    public Orders(String type, String name, String surname, String phonenumber, String email, String status, String paid, String startDate, String endDate) throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        order_type = type;
        order_name = name;
        order_surname = surname;
        order_phonenumber = phonenumber;
        order_email = email;
        order_status = status;
        order_date = new Date();
        order_paid = Boolean.valueOf(paid);
        order_startDate = format.parse(startDate);
        order_endDate = format.parse(endDate);
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id_order;
    @ManyToOne
    @JoinColumn(name="rooms_id_rooms", referencedColumnName = "id_rooms")
    private Rooms roomsOrders;
    @ManyToOne(cascade = CascadeType.REMOVE, fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id_user", referencedColumnName = "id_user")
    private User users;
    private String order_type;
    private String order_name;
    private String order_surname;
    private String order_phonenumber;
    private String order_email;
    private String order_status;
    private Date order_date;
    private Boolean order_paid;
    private Date order_startDate;
    private Date order_endDate;
}

