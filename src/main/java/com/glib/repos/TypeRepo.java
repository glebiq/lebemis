package com.glib.repos;

import com.glib.entity.Type;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface TypeRepo extends CrudRepository<Type,Integer> {
Type getTypeById(Integer id);
Type getTypeByName(String name);

}
