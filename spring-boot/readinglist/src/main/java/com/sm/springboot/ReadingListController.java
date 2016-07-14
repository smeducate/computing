/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sm.springboot;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * ReadingListController is annotated with @Controller in order to be picked up by component-scanning and 
 * automatically be registered as a bean in the Spring application context.         
 * 
 * It’s also annotated with @RequestMapping to map all of its handler methods to a base URL path of “/”.
 * @author smdeveloper
 */

@Controller
@RequestMapping("/")
public class ReadingListController {
    
    private final ReadingListRepository readingListRepo;
    
    @Autowired
    public ReadingListController(ReadingListRepository repo) {
        this.readingListRepo = repo;
    }
    
    @RequestMapping(value="/{reader}", method=RequestMethod.GET)
    public String readersBooks(@PathVariable("reader") String reader, Model model) {
        
        List<Book> readingList = readingListRepo.findByreader(reader);
        if (readingList != null) {
            model.addAttribute("books",readingList);
        }
        return "readingList";
        
    }
    
    @RequestMapping(value="{reader}", method=RequestMethod.POST)
    public String addToReadingList(@PathVariable("reader") String reader, Book book) {
        book.setReader(reader);
        readingListRepo.save(book);
        return "redirect:/{reader}";
        
    }
    
    
    
}
