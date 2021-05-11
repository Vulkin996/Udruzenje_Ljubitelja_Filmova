package com.pris.controller;

import java.util.List;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.pris.service.KategorijaService;

import model.Kategorija;


@RestController
@RequestMapping("/kategorije")
public class KategorijaController{


    KategorijaService kategorijaService;

    @PostMapping("/sve")
    public List<Kategorija> all() {
        return kategorijaService.svi();
    }
}
