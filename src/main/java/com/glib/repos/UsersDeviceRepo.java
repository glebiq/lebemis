package com.glib.repos;

import com.glib.entity.Device;
import com.glib.entity.User;
import com.glib.entity.UsersDevice;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface UsersDeviceRepo extends CrudRepository<UsersDevice,Integer> {
    List<UsersDevice> getUsersDevicesByUser(User user);
}
