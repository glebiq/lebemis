package com.glib.repos;

import com.glib.entity.Company;
import com.glib.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

public interface CompanyRepo extends CrudRepository<Company, Integer> {
    Company getCompanyById(Integer id);

    Company getCompanyByName(String name);

    Page<Company> findAll(Pageable pageable);
}
