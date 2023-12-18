package by.bsuir.barilko.dao;

import by.bsuir.barilko.entity.rooms.Rooms;

import java.util.List;

public interface RoomsDAO {
    Rooms findRoomByID(Long ID);
    void deleteRoom(long ID);
    void addRoom(Rooms rooms);
    void updateRoom(Rooms rooms, long ID);

    List<Rooms> findAllRooms();
}
