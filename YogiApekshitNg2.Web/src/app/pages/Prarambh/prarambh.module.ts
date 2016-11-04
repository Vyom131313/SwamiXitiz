import { NgModule }      from '@angular/core';
import { CommonModule }  from '@angular/common';
import { FormsModule } from '@angular/forms';
import { NgaModule } from '../../theme/nga.module';

import { routing } from './Prarambh.routing';
import { PrarambhComponent } from './Prarambh.component';
import { Ch01Component } from './Ch01/Ch01.component';


@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    NgaModule,
    routing
  ],
  declarations: [
      PrarambhComponent, Ch01Component 
  ],
  //providers: [
  //  BubbleMapsService,
  //  LineMapsService
  //]
})
export default class PrarambhModule {}
