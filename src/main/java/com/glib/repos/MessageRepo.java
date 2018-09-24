package com.glib.repos;


import com.glib.entity.Message;
import com.glib.entity.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface MessageRepo extends CrudRepository<Message, Long> {

    List<Message> findByTextContainsIgnoreCase(String text);
    List<Message> findByAuthor(User author);

}

