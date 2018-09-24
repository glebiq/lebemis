package com.glib.repos;

import com.glib.entity.Device;
import org.springframework.data.repository.CrudRepository;

public interface DeviceRepo extends CrudRepository<Device,Integer> {
    Device getDeviceById(Integer id);
}
