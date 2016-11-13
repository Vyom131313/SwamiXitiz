import { Injectable } from '@angular/core';
import { Http } from "@angular/http";
import { Headers } from "@angular/http";
import { MenuItem } from './menuItem.model';
import { MENUITEMS } from './mock-menuItems';


@Injectable()
export class MenuItemService {
    getHeroes(): Promise<MenuItem[]> {
    return Promise.resolve(MENUITEMS);
  }
}


/*
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
*/