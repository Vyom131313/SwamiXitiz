import { NgModule } from '@angular/core';
import { HttpModule } from '@angular/http';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { NavbarLeftComponent } from './navbar-left.component';

import { EventsService } from './Events.service';

@NgModule({
  imports: [BrowserModule, HttpModule ],
  declarations: [AppComponent, NavbarLeftComponent ],
  bootstrap: [AppComponent],
  providers: [EventsService]
})
export class AppModule { }
