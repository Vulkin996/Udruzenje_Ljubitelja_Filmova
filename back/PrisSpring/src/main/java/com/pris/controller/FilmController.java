package com.pris.controller;



import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.pris.repository.FilmRepository;
import com.pris.service.FilmService;

import model.Film;


@RestController
@RequestMapping("/film")
public class FilmController{
	

        FilmRepository filmRepository;
        FilmService filmService;

    @PostMapping("/sacuvaj")
    public boolean save(@RequestBody @Validated Film film) {
        return filmService.save(film);
    }
}