import { NgModule }      from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { MenuItemService } from './menuItem.service';

import { AppComponent }  from './app.component';

@NgModule({
  imports:      [ BrowserModule ],
  declarations: [ AppComponent ],
  bootstrap: [AppComponent],
  providers: [MenuItemService ]
})
export class AppModule { }
