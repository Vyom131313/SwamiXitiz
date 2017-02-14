import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpModule, Http } from '@angular/http';
import { Routes, RouterModule } from '@angular/router';

// Components
import { LoginComponent } from './login.component';

// Services
import { AuthGuard } from './authGuard.component';

@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        ReactiveFormsModule,
        RouterModule,
        HttpModule
    ],
    declarations: [
        LoginComponent
    ],
    exports: [
        LoginComponent
    ],
    providers: [
    ]
})
export class LoginModule { }

const loginRoutes: Routes = [
    { path: 'login', component: LoginComponent, pathMatch: 'full' },
];

export const LoginRouting = RouterModule.forChild(loginRoutes);