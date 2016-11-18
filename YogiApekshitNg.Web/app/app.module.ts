import { NgModule } from '@angular/core';
import { HttpModule } from '@angular/http';
import { BrowserModule } from '@angular/platform-browser';

import { MenuItemService } from './menuItem.service';
import { AppComponent } from './app.component';
import { DetailViewComponent } from './detail-view.component';
import { QueAnsComponent } from './queans.component';
import { NavbarLeftComponent } from './navbar-left.component';


@NgModule({
  imports: [BrowserModule, HttpModule ],
  declarations: [AppComponent, NavbarLeftComponent, DetailViewComponent, QueAnsComponent ],
  bootstrap: [AppComponent],
  providers: [MenuItemService ]
})
export class AppModule { }
