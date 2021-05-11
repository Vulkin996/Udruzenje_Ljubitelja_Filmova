package com.pris.service;

import java.util.List;

import com.pris.repository.FilmRepository;

import model.Film;

public class FilmServiceImpl implements FilmService{


    FilmRepository filmRepository;

    @Override
    public boolean save(Film film) {
        boolean postoji=false;
        List<Film> lista=filmRepository.findAll();
       // for(int i=0;i<lista.size();i++){
        for(Film f : lista) {
            if(f.getNaziv().equals(film.getNaziv()))
                postoji=true;
        }
        if(postoji)
            return false;
        else{
            Film sacuvan=filmRepository.saveAndFlush(film);
            return true;
        }


    }
}