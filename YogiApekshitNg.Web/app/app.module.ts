import { NgModule } from '@angular/core';
import { HttpModule } from '@angular/http';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { DetailViewComponent } from './detail-view.component';
import { QAListComponent } from './QAList.component';
import { NavbarLeftComponent } from './navbar-left.component';

import { MenuItemService } from './menuItem.service';
import { SharedService } from './shared.service';

@NgModule({
  imports: [BrowserModule, HttpModule ],
  declarations: [AppComponent, NavbarLeftComponent, DetailViewComponent, QAListComponent ],
  bootstrap: [AppComponent],
  providers: [SharedService, MenuItemService]
})
export class AppModule { }
