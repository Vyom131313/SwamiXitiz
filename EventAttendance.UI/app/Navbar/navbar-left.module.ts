import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpModule, Http } from '@angular/http';
import { Routes, RouterModule } from '@angular/router';

// Components
import { NavbarLeftComponent } from './navbar-left.component';

@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        ReactiveFormsModule,
        RouterModule,
        HttpModule
    ],
    declarations: [NavbarLeftComponent],
    exports: [
        NavbarLeftComponent
    ],
    providers: []
})
export class NavbarLeftModule { }