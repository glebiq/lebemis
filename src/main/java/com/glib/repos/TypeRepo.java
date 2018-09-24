package com.glib.repos;

import com.glib.entity.Type;
import org.springframework.data.repository.CrudRepository;

public interface TypeRepo extends CrudRepository<Type,Integer> {
Type getTypeById(Integer id);
}
