/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sm.springboot;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * By extending JpaRepository, ReadingListRepository inherits 18 methods for performing common persistence operations.
 * Spring Data provides a special magic of its own, making it possible to define a repository with just an interface. 
 * The interface will be implemented automatically at runtime when the application is started.
 * 
 * @author smdeveloper
 */
public interface ReadingListRepository extends JpaRepository<Book, Long>{
    
    List<Book> findByreader(String reader);
}
