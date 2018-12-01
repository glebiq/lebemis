package com.glib.repos;

import com.glib.entity.User;
import com.glib.entity.UsersDevice;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UsersDeviceRepo extends CrudRepository<UsersDevice,Integer> {
    List<UsersDevice> getUsersDevicesByUser(User user);
    UsersDevice getUsersDevicesById(Integer id);
}
