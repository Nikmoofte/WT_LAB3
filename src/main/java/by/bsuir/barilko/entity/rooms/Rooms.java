package by.bsuir.barilko.entity.rooms;


import by.bsuir.barilko.entity.orders.Orders;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Getter
@Setter
@Table(name = "rooms")
public class Rooms {

    public Rooms() {}
    public Rooms(String amount, String price, String discription) {
        rooms_guest_amount = Integer.parseInt(amount);
        rooms_price = Float.parseFloat(price);
        rooms_discription = discription;
        rooms_deleted = false;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id_rooms;
    private int rooms_guest_amount;
    private float rooms_price;
    private String rooms_discription;
    private Boolean rooms_deleted;

    @OneToMany(mappedBy = "roomsOrders", cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
    private List<Orders> ordersList;
}
