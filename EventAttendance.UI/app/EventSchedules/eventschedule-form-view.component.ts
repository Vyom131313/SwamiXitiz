import { Component, Renderer, OnInit, ViewChild, AfterViewInit, ElementRef } from '@angular/core';
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

export class EventScheduleFormViewComponent implements OnInit, AfterViewInit   {
    //@ViewChild('EventDate') eventDate: ElementRef;
    public form: FormGroup;
    public title: string;
    public eventschedule: EventSchedule_VM = new EventSchedule_VM();

    constructor(formBuilder: FormBuilder,
        private router: Router,
        private route: ActivatedRoute,
        public elementRef: ElementRef,
        public renderer: Renderer,
        private http: Http, private eventschedulesService: EventSchedulesService) {
        this.form = formBuilder.group({
            Id: [],
            EventId: ['', [
                //Validators.required,
            ]],
            EventDate: ['', [
                //Validators.required,
            ]],
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

    ngAfterViewInit() {
        //this.eventDate.nativeElement.datepicker({
        //    //... your datepicker attributes
        //}).change(function () {
        //   // that.dataModel.send_date = $('#send_date').val();
        //});
    }

    save() {
        var eventschedule = this.form.value;

        //console.log(eventschedule);

        var result = (eventschedule.Id)
            ? this.eventschedulesService.update(this.http, eventschedule)
            : this.eventschedulesService.add(this.http, eventschedule);

        result.subscribe(data => this.router.navigate(['eventschedules']));
    }
}