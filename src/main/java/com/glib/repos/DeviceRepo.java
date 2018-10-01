package com.glib.repos;

import com.glib.entity.Company;
import com.glib.entity.Device;
import com.glib.entity.Type;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface DeviceRepo extends CrudRepository<Device,Integer> {
    Device getDeviceById(Integer id);
    List<Device> getDevicesByType(Type type);
    List<Device> getDevicesByCompany(Company company);
}
