import { NgModule } from '@angular/core';
import { HttpModule } from '@angular/http';
import { BrowserModule } from '@angular/platform-browser';

import { MenuItemService } from './menuItem.service';
import { AppComponent } from './app.component';
import { DetailViewComponent } from './detail-view.component';
import { QueAnsComponent } from './queans.component';
import { MenuComponent } from './menu.component';


@NgModule({
  imports: [BrowserModule, HttpModule ],
  declarations: [AppComponent, MenuComponent, DetailViewComponent, QueAnsComponent ],
  bootstrap: [AppComponent],
  providers: [MenuItemService ]
})
export class AppModule { }
