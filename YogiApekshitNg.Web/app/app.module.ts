import { NgModule } from '@angular/core';
import { HttpModule } from '@angular/http';
import { BrowserModule } from '@angular/platform-browser';

import { MenuItemService } from './menuItem.service';
import { AppComponent } from './app.component';
import { HeroDetailComponent } from './hero-detail.component';

@NgModule({
  imports: [BrowserModule, HttpModule ],
  declarations: [AppComponent, HeroDetailComponent ],
  bootstrap: [AppComponent],
  providers: [MenuItemService ]
})
export class AppModule { }
