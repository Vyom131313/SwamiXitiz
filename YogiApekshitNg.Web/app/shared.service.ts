import { Injectable, EventEmitter } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { URLSearchParams, QueryEncoder } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/share';
import { Observer } from 'rxjs/Observer';
import { BehaviorSubject } from 'rxjs/BehaviorSubject';

@Injectable()
export class SharedService {
    public Lang: BehaviorSubject<string> = new BehaviorSubject<string>("Eng");
    public TitleText: string = "Yogi<b> Apekshit</b>";
    public SelectLangText: string = "Language";
    public QueAnsColumnText: string = "Question and Answer" ;
    public ChapterColumnText: string = "Exams";
    public ExamsColumnText: string = "Chapter" ;

    constructor() {
        //this.Lang = 'Eng';
    }

    SetLanguage(newValue: string) {
        this.Lang = new BehaviorSubject<string>(newValue);
        this.TitleText = this.Lang.getValue() == "Eng" ? "Yogi<b> Apekshit</b>" : "યોગી<b> અપેક્ષિત</b>";

        this.SelectLangText = newValue == "Eng" ? "Language" : "ભાષા";
        this.QueAnsColumnText = newValue == "Eng" ? "Language" : "ભાષા";
        this.QueAnsColumnText = newValue == "Eng" ? "Question and Answer" : "પ્રશ્ન અને જવાબ ";
        this.ExamsColumnText = newValue == "Eng" ? "Exams" : "પરીક્ષા";
        this.ChapterColumnText = newValue == "Eng" ? "Chapter" : "પ્રકરણ";
    }
}