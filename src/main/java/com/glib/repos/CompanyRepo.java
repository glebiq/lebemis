package com.glib.repos;

import com.glib.entity.Company;
import org.springframework.data.repository.CrudRepository;

public interface CompanyRepo extends CrudRepository<Company, Integer> {
Company getCompanyById(Integer id);
}
