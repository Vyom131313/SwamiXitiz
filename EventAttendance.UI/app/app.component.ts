import { Component, OnInit } from '@angular/core';
import { EventsService } from './Events.service';

@Component({
    selector: 'my-app',
    template: `<navbar-left></navbar-left>`,
    providers: [EventsService]

})
export class AppComponent {
    constructor() { }
}
