package by.bsuir.barilko.entity.user;


import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "user")
@Getter
@Setter
public class User {

    public User() {}
    public User(String login, String password, String name, String surname, String email) {
        user_email = email;
        user_ban = false;
        user_discount = 0;
        user_role = false;
        user_surname = surname;
        user_login = login;
        user_password = password;
        user_name = name;
    }
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_user")
    private long id_user;

    @Column(name = "user_login")
    private String user_login;
    @Column(name = "user_password")
    private String user_password;
    @Column(name = "user_name")
    private String user_name;
    @Column(name = "user_surname")
    private String user_surname;
    @Column(name = "user_role")
    private Boolean user_role;
    @Column(name = "user_discount")
    private float user_discount;
    @Column(name = "user_ban")
    private Boolean user_ban;
    @Column(name = "user_email")
    private String user_email;

}
