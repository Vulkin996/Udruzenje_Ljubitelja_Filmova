import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { UnosFilmaComponent } from './unos-filma/unos-filma.component';
import { PrikazFilmaComponent } from './prikaz-filma/prikaz-filma.component';

@NgModule({
  declarations: [
    AppComponent,
    UnosFilmaComponent,
    PrikazFilmaComponent
  ],
  imports: [
    BrowserModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
