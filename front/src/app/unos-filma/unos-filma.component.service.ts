import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Film } from '../model/film';
import { environment } from 'src/environments/environment';

@Injectable({
    providedIn: 'root',
})

export class UnosFilmaService {
    private httpHeaders = new HttpHeaders({
        'Content- Type': 'application/json',
    })

    constructor(private http: HttpClient) {  }



    sacuvaj(film: Film) {
        const url = environment.serverUrl + 'film/sacuvaj';
        this.http.post(url, film, { headers: this.httpHeaders }).subscribe();

    }
}