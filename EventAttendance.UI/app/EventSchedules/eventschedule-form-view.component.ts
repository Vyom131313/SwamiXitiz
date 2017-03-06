import { Component, Renderer, OnInit } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { FormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';

import { EventSchedule_VM } from '../models.model';
import { EventSchedulesService } from './eventschedules.service';

@Component({
    selector: 'eventschedule-form',
    templateUrl: './app/EventSchedules/eventschedule-form-view.component.html',
    styleUrls: [
        'https://fonts.googleapis.com/icon?family=Material+Icons',
    ],
    providers: [EventSchedulesService]
})

export class EventScheduleFormViewComponent implements OnInit {
    public form: FormGroup;
    public title: string;
    public eventschedule: EventSchedule_VM = new EventSchedule_VM();

    constructor(formBuilder: FormBuilder,
        private router: Router,
        private route: ActivatedRoute,
        private http: Http, private eventschedulesService: EventSchedulesService) {
        this.form = formBuilder.group({
            Id: [],
            EventId: ['', [
                Validators.required,
            ]],
            EventShortDate: [],
            Notes: [],
            IsFreezed: ['', [
                //Validators.required,
            ]]
        });
    }

    ngOnInit() {
        var id = this.route.params.subscribe(params => {
            var id = params['id'];
            this.title = id ? 'Edit Event Schedule' : 'New Event Schedule';
            if (!id)
                return;

            this.eventschedulesService.getItem(this.http, id).then(item => this.eventschedule = item);
        });
    }

    onEventChange(id: number) {
        this.eventschedule.EventId = id;
    }

    save() {
        var data = this.form.value;
        data.EventId = this.eventschedule.EventId;

        if (data.EventShortDate == null)
            data.EventShortDate = this.eventschedule.EventShortDate;

        console.log(data);

        var result = (data.Id && data.Id > 0)
            ? this.eventschedulesService.update(this.http, data)
            : this.eventschedulesService.add(this.http, data);

        result.subscribe(data => this.router.navigate(['eventschedules']));
    }
}