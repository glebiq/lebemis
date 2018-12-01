package com.glib.repos;

import com.glib.entity.Type;
import com.glib.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface TypeRepo extends CrudRepository<Type, Integer> {
    Type getTypeById(Integer id);

    Type getTypeByName(String name);

    Page<Type> findAll(Pageable pageable);
}
