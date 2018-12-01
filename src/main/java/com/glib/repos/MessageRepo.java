package com.glib.repos;


import com.glib.entity.Message;
import com.glib.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface MessageRepo extends CrudRepository<Message, Long> {

    Page<Message> findByTextContainsIgnoreCase(String text,Pageable pageable);
    List<Message> findByAuthor(User author);
    Page<Message> findAll(Pageable pageable);


}

