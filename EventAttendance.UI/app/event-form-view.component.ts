import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';

import { Event_VM } from './models.model';
import { EventsService } from './events.service';

@Component({
    selector: 'event-form',
    templateUrl: './app/event-form-view.component.html',
    styleUrls: [
        'https://fonts.googleapis.com/icon?family=Material+Icons',
    ],
    providers: [EventsService]
})

export class EventFormViewComponent implements OnInit {

    form: FormGroup;
    title: string;
    event: Event_VM = new Event_VM();

    constructor(formBuilder: FormBuilder, private router: Router, private route: ActivatedRoute, private eventsService: EventsService) {
        this.form = formBuilder.group({
            name: ['', [
                Validators.required,
                Validators.minLength(3)
            ]]
        });
    }

    ngOnInit() {
        var id = this.route.params.subscribe(params => {
            var id = params['Id'];

            this.title = id ? 'Edit User' : 'New User';

            if (!id)
                return;

            //this.eventsService.get(id)
            //    .subscribe(
            //    user => this.event = user,
            //    response => {
            //        if (response.status == 404) {
            //            this.router.navigate(['NotFound']);
            //        }
            //    });
        });
    }

    save() {
        var result,
            event = this.form.value;

        //if (event.Id) {
        //    result = this.eventsService.updateUser(event);
        //} else {
        //    result = this.eventsService.addUser(event);
        //}

        //result.subscribe(data => this.router.navigate(['users']));
    }
}