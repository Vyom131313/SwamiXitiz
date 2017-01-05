import { NgModule } from '@angular/core';
import { HttpModule } from '@angular/http';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { NavbarLeftComponent } from './navbar-left.component';
import { DetailViewComponent } from './detail-view.component';
import { QAListComponent } from './QAList.component';

import { SharedService } from './shared.service';
import { MenuItemService } from './menuItem.service';

@NgModule({
  imports: [BrowserModule, HttpModule ],
  declarations: [AppComponent, NavbarLeftComponent, DetailViewComponent, QAListComponent ],
  bootstrap: [AppComponent],
  providers: [SharedService, MenuItemService]
})
export class AppModule { }
