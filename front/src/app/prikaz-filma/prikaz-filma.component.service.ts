import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Kategorija } from '../model/kategorija';

@Injectable({
	providedIn: 'root',
})
export class CodebookService {
	private httpHeaders = new HttpHeaders({
		'Content-Type': 'application/json',
	});

    constructor(private http: HttpClient) {}
    /*
    sve(): Observable<Kategorija[]>{
        const url = environment.serverUrl+'kategorija/sve';
        return new Observable((o:any)=>{
            this.http.get(url,{headers: this.httpHeaders}).subscribe((data: Kategorija[])=>{
                o.next(data);
                return o.complete();
            });
        });

    }
*/
}