package com.pris.service;

import java.util.List;

import com.pris.repository.KategorijaRepository;

import model.Kategorija;

public class KategorijaServiceImpl implements KategorijaService{


    KategorijaRepository kategorijaRepository;

    @Override
    public List<Kategorija> svi() {
        return kategorijaRepository.findAll();
    }
}