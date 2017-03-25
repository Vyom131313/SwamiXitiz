import { Component, OnInit } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { FormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { SelectModule } from 'ng2-select';

import { Attendee_VM } from '../models.model';
import { AttendeesService } from './attendees.service';

@Component({
    selector: 'attendee-form',
    templateUrl: './app/Attendees/attendee-form-view.component.html',
    styleUrls: [
        'https://fonts.googleapis.com/icon?family=Material+Icons',
    ],
    providers: [AttendeesService]
})

export class AttendeeFormViewComponent implements OnInit {

    public form: FormGroup;
    public title: string;
    public attendee: Attendee_VM = new Attendee_VM();

    constructor(formBuilder: FormBuilder, private router: Router, private route: ActivatedRoute, private location: Location, private http: Http, private attendeesService: AttendeesService) {
        this.form = formBuilder.group({
            Id: [],
            FirstName: ['', [
                Validators.required,
                Validators.minLength(3)
            ]],
            MiddleName: [],
            LastName: ['', [
                Validators.required,
                Validators.minLength(3)
            ]],
            Gender: ['', [
                Validators.required,
                Validators.minLength(1)
            ]],
            Address: [],
            ImsId:[],
            ZoneId: [],
            CityId: [],
            IsKaryakar: [],
            IsDeleted: [],
        });
    }

    ngOnInit() {
        var id = this.route.params.subscribe(params => {
            var id = params['id'];
            this.title = id ? 'Edit Attendee' : 'New Attendee';
            if (!id)
                return;

            this.attendeesService.getItem(this.http, id).then(item => this.attendee = item);
        });
    }

    onZoneChange(id: number) {
        this.attendee.ZoneId = id;
    }

    onCityChange(id: number) {
        this.attendee.CityId = id;
    }

    onSevaChange(values: any) {

        this.attendee.SevaFullNames = this.itemsToString(values);
        
        //console.log('onSevaChange: ', this.attendee.SevaFullNames );
        //this.attendee.CityId = id;
    }

    onBack(event: any) {
        this.location.back();
    }


    public itemsToString(value: Array<any> = []): string {
        return value
            .map((item: any) => {
                return item.text;
            }).join(',');
    }

    save() {
        var data = this.form.value;
        data.ZoneId = this.attendee.ZoneId;
        data.CityId = this.attendee.CityId;
        data.SevaFullNames = this.attendee.SevaFullNames;

        console.log(data);

        var result = (data.Id)
            ? this.attendeesService.update(this.http, data)
            : this.attendeesService.add(this.http, data);

        result.subscribe(data =>
            //this.router.navigate(['attendees'])
            this.location.back()
        );
    }
}