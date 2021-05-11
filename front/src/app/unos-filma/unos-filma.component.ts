import { Component, OnInit } from '@angular/core';
import { Film } from '../model/film';
import { UnosFilmaService } from './unos-filma.component.service';

@Component({
  selector: 'app-unos-filma',
  templateUrl: './unos-filma.component.html',
  styleUrls: ['./unos-filma.component.css']
})
export class UnosFilmaComponent implements OnInit {

  film: Film | undefined;
  film2: Film={
    id_film:0,
    'naziv':'',
    'trajanje':'',
    'opis':'',
    'zanr':'',
    'trailer':'',
  }
   service!: UnosFilmaService;
 

  constructor() { 
    
  }

  ngOnInit(): void {
  }

  enterInfo(filmForm: any){
    console.log(filmForm);
    this.film=filmForm.value;
    this.film2=filmForm.value;
    console.log(this.film);
    console.log(this.film2);
    this.service.sacuvaj(this.film2);
  }

}
