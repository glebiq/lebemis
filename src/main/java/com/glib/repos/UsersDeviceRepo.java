package com.glib.repos;

import com.glib.entity.User;
import com.glib.entity.UsersDevice;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UsersDeviceRepo extends CrudRepository<UsersDevice,Integer> {
    Page<UsersDevice> getUsersDevicesByUser(User user, Pageable pageable);
    UsersDevice getUsersDevicesById(Integer id);
}
