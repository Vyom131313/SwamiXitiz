import { NgModule, EventEmitter } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { FormsModule } from '@angular/forms';
import { Component, Input, Output, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { SelectModule } from 'ng2-select';

import { Seva_VM } from '../Models.model';
import { AttendeesService } from './attendees.service';

@Component({
    selector: 'sevas-ddl',
    template: `<ng-select placeholder="No any seva selected"
                           [multiple]="true"
                           [items]="sevaItemsNameOnly"
                           (data)="refreshValue($event)"
                           (selected)="selected($event)"
                           (removed)="removed($event)"
                           >
                </ng-select>`,
    styleUrls: [
        'https://fonts.googleapis.com/icon?family=Material+Icons',
    ],
    providers: [AttendeesService]
})

export class SevasDdlComponent implements OnChanges {
    @Input() selectedSevas: any=[];
    @Output() select = new EventEmitter();

    //[disabled]="disabled"
    public sevaItems: Array<Seva_VM>;

    public sevaItemsNameOnly: Array<string> = [
        "Accounts --> Coordinator",
        "Accounts --> Team Member",
        "Admin Secretary --> Admin Secretary",
        "Bal --> Coordinator",
        "Bal --> Team Member",
        "Bookstall --> Corodinator",
        "Bookstall --> Team Member",
        "Database --> Coordinator",
        "Database --> Team Member",
        "Decoration --> Corodinator",
        "Decoration --> Team Member",
        "Facilities --> Admin Coordinator",
        "Facilities --> Audio-Video Coordinator",
        "Facilities --> Audio-Video Team Member",
        "Housekeeping --> Corodinator",
        "Housekeeping --> Team Member",
        "HR & Legal --> Coordinator",
        "HR & Legal --> Team Member",
        "IT Services --> Coordinator",
        "IT Services --> Team Member",
        "Kishor --> Team Member",
        "Kishore --> Coordinator",
        "Mahila --> Admin Coordinator",
        "Maintenance/Landscaping --> Coordinator",
        "Maintenance/Landscaping --> Team Member",
        "Mandir Coordinator --> Mandir Coordinator",
        "Media --> Coordinator",
        "Media --> Team Member",
        "Medical Services --> Coordinator",
        "Medical Services --> Team Member",
        "Outreach --> Admin Coordinator",
        "Outreach --> Coordinator",
        "Outreach --> Team Member",
        "Parking/Transportation --> Coordinator",
        "Parking/Transportation --> Team Member",
        "PR --> Coordinator",
        "PR --> Team Member",
        "Remote Network --> Coordinator",
        "Remote Network --> Team Member",
        "Sabha Sanchalan --> Announcement Lead",
        "Sabha Sanchalan --> Back Stage Lead",
        "Sabha Sanchalan --> Coordinator",
        "Sabha Sanchalan --> Cultural Program Lead",
        "Sabha Sanchalan --> Katha Sevak Lead",
        "Sabha Sanchalan --> Kirtan Team Lead",
        "Sabha Sanchalan --> Team Member",
        "Sabha Vyavastha --> Coordinator",
        "Sabha Vyavastha --> Team Member",
        "Satsang --> Admin Coordinator",
        "Satsang Exam --> Coordinator",
        "Satsang Exam --> Team Member",
        "Satsang Network --> Admin Coordinator",
        "Satsang Network --> Coordinator (SNC)",
        "Satsang Network --> Goshthi Moderator Lead",
        "Satsang Network --> Sampark Karyakar",
        "Satsang Network --> Zone Leader",
        "Satsang Outreach --> Coordinator",
        "Satsang Outreach --> Team Member",
        "Services --> Admin Coordinator",
        "Services --> Kitchen Coordinator",
        "Services --> Kitchen Team Member",
        "Shayona --> Coordinator",
        "Shayona --> Team Member",
        "Subscription --> Coordinator",
        "Subscription --> Team Member",
        "Telecom/Security --> Coordinator",
        "Telecom/Security --> Team Member",
        "Volunteer --> Coordinator",
        "Volunteer --> Team Member",
        "Yuvak --> Coordinator",
        "Yuvak --> Team Member"];

    constructor(private http: Http, private router: Router, private attendeesService: AttendeesService) {
        this.value = this.selectedSevas;
        console.log(this.selectedSevas);
    }

    //getSevaItems() {
    //    this.attendeesService.getSevaItems(this.http).then(items => {
    //        this.sevaItems = items;
    //        this.sevaItems.forEach(c => {
    //            this.sevaItemsNameOnly.push(c.FullName);

    //        });

    //        alert(JSON.stringify(this.sevaItemsNameOnly));
    //    });
    //}

    //private _disabledV: string = '0';
    //private disabled: boolean = false;

    //private get disabledV(): string {
    //    return this._disabledV;
    //}

    //private set disabledV(value: string) {
    //    this._disabledV = value;
    //    this.disabled = this._disabledV === '1';
    //}

    private value: any = [];

    public selected(val: any): void {
        this.select.emit(this.value);
    }

    public removed(val: any): void {
        this.select.emit(this.value);
    }

    public refreshValue(value: any): void {
        this.value = value;
    }

    public itemsToString(value: Array<Seva_VM> = []): string {
        return value
            .map((item: any) => {
                return item.FullName;
            }).join(',');
    }

    ngOnChanges(changes: SimpleChanges) {
        //console.log(changes);
    }
}