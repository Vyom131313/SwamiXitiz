import { Component, OnInit } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { FormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';

import { Event_VM } from '../models.model';
import { EventsService } from './events.service';

@Component({
    selector: 'event-form',
    templateUrl: './app/Events/event-form-view.component.html',
    styleUrls: [
        'https://fonts.googleapis.com/icon?family=Material+Icons',
    ],
    providers: [EventsService]
})

export class EventFormViewComponent implements OnInit {

    public form: FormGroup;
    public title: string;
    public event: Event_VM = new Event_VM();

    constructor(formBuilder: FormBuilder, private router: Router, private route: ActivatedRoute, private http: Http, private eventsService: EventsService) {
        this.form = formBuilder.group({
            Id:[],
            Name: ['', [
                Validators.required,
                Validators.minLength(3)
            ]]
        });
    }

    ngOnInit() {
        var id = this.route.params.subscribe(params => {
            var id = params['id'];
            this.title = id ? 'Edit Event' : 'New Event';
            if (!id)
                return;

            this.eventsService.getItem(this.http, id).then(item => this.event = item);
        });
    }

    save() {
        var event = this.form.value;

        //console.log(event);

        var result = (event.Id)
            ? this.eventsService.update(this.http, event)
            : this.eventsService.add(this.http, event);

        result.subscribe(data => this.router.navigate(['events']));
    }
}