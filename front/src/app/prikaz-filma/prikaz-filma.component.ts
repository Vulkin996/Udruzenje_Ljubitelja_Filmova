import { Component, OnInit } from '@angular/core';
import { Film } from '../model/film';
import { Kategorija } from '../model/kategorija';

@Component({
  selector: 'app-prikaz-filma',
  templateUrl: './prikaz-filma.component.html',
  styleUrls: ['./prikaz-filma.component.css']
})
export class PrikazFilmaComponent implements OnInit {

  constructor() { }



  listaFIlm: Film[]=[
    {
      id_film:0,
      'naziv':'',
      'trajanje':'',
      'opis':'',
      'zanr':'',
      'trailer':'',
    
    },
    {
      id_film:0,
      'naziv':'',
      'trajanje':'',
      'opis':'',
      'zanr':'',
      'trailer':'',
    }
  ]


  lista: Kategorija[]=[{
    'id_kategorija':1,
    'naziv':'Akcija',
  },
  {
    'id_kategorija':2,
    'naziv':'Drama',
  
  },
  {
    'id_kategorija':3,
    'naziv':'Romantika',
    
  }
];
  

  ngOnInit(): void {

  }


}
