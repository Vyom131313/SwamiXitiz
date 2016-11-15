import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import { Component, Input } from '@angular/core';
import { MenuItem } from './menuItem.model';

@Component({
  selector: 'my-hero-detail',
  template: `
    <div *ngIf="menu">
      <h2>{{menu.Name}} details!</h2>
      <div>
        <label>id: </label>{{menu.Name}}
      </div>
    </div>
  `
})
export class HeroDetailComponent {
    @Input() menu: MenuItem;
}


/*
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
*/