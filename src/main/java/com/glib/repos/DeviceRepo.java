package com.glib.repos;

import com.glib.entity.Company;
import com.glib.entity.Device;
import com.glib.entity.Type;
import com.glib.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface DeviceRepo extends CrudRepository<Device, Integer> {
    Device getDeviceById(Integer id);

    List<Device> getDevicesByType(Type type);

    List<Device> getDevicesByCompany(Company company);

    List<Device> getDevicesByCompanyAndType(Company company, Type type);

    Page<Device> findAll(Pageable pageable);
}
