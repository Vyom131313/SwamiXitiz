import { Routes, RouterModule }  from '@angular/router';

import { PrarambhComponent } from './Prarambh.component';
import { Ch01Component } from './Ch01/Ch01.component';

// noinspection TypeScriptValidateTypes
const routes: Routes = [
  {
    path: '',
    component: PrarambhComponent,
    children: [
        { path: 'ch01', component: Ch01Component },
    ]
  }
];

export const routing = RouterModule.forChild(routes);
