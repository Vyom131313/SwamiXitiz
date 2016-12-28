﻿import { Injectable, EventEmitter } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { URLSearchParams, QueryEncoder } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/share';
import { Observer } from 'rxjs/Observer';
import { BehaviorSubject } from 'rxjs/BehaviorSubject';

@Injectable()
export class SharedService {
    public Lang: BehaviorSubject<string> = new BehaviorSubject<string>("Guj");
    public TitleText: string = "યોગી<b> અપેક્ષિત</b>";
    public SelectLangText: string = "ભાષા";
    public ChapterColumnText: string = "પ્રકરણ";
    public ExamsColumnText: string = "પરીક્ષા";
    public BookColumnText: string = "પુસ્તક";
    public AnsColumnText: string = "જવાબ";
    public IsAssessmentMode: boolean = false;
    public SwitchModeText: string = "સ્વ પરીક્ષણ સ્થિતિ"
    public ShowAnsText: string = "જ";

    constructor() {
        //this.Lang = 'Eng';
    }

    SetLanguage(newValue: string) {
        this.Lang = new BehaviorSubject<string>(newValue);
        this.TitleText = this.Lang.getValue() == "Eng" ? "Yogi<b> Apekshit</b>" : "યોગી<b> અપેક્ષિત</b>";

        this.SelectLangText = newValue == "Eng" ? "Language" : "ભાષા";
        this.ExamsColumnText = newValue == "Eng" ? "Exams" : "પરીક્ષા";
        this.ChapterColumnText = newValue == "Eng" ? "Chapter" : "પ્રકરણ";
        this.BookColumnText = newValue == "Eng" ? "Book" : "પુસ્તક";
        this.AnsColumnText = newValue == "Eng" ? "Ans" : "જવાબ";
        this.ShowAnsText = newValue == "Eng" ? "A" : "જ";

        this.SetAssessmentMode(this.IsAssessmentMode);
    }

    SetAssessmentMode(isAssessmentMode: boolean) {
        this.IsAssessmentMode = isAssessmentMode;

        if (this.IsAssessmentMode) {
            this.SwitchModeText = this.Lang.getValue() == "Eng" ? "Reading mode" : "વાંચન સ્થિતિ";
        }
        else {
            this.SwitchModeText = this.Lang.getValue() == "Eng" ? "Self Assessment" : "સ્વ પરીક્ષણ સ્થિતિ";
        }
    }

    GetQueAnsColumnText(category: string): string {

        switch (category) {
            case 'Correct_Option': return this.Lang.value == 'Guj' ? 'ફક્ત સાચા વિકલ્પો પસંદ કરો.' : 'Select Correct Options'
            case 'Fill_In_Blank': return this.Lang.value == 'Guj' ? 'ખાલી જગ્યા પૂરો.' : 'Fill In Blanks'
            case 'One_Sentence': return this.Lang.value == 'Guj' ? 'એક (સંપૂર્ણ) વાક્યમાં જવાબ આપો.' : 'Answer in One Sentence'
            case 'Correct_Sentence': return this.Lang.value == 'Guj' ? 'ખોટા વાક્યોને મથાળાના સંદર્ભમાં સાચા લખો.' : 'Correct the Sentence'
            case 'Correct_Sequence': return this.Lang.value == 'Guj' ? 'સાચા ક્રમ નંબર અને ઘટના ક્રમ પ્રમાણે ગોઠવો.' : 'Correct the Sentence of incident'
            case 'Kirtan': return this.Lang.value == 'Guj' ? 'કીર્તન / શ્લોક / અષ્ટક ની ખૂટતી કડીઓ પુરી કરો.' : 'Complete the Kirtan'
            case 'Reason': return this.Lang.value == 'Guj' ? 'વાક્યોના કારણો જણાવો.' : 'Give Reasons'
            case 'Short_Note': return this.Lang.value == 'Guj' ? 'ટૂંક નોંધ લખો.' : 'Write a short note'
            case 'Swamini_Vaato': return this.Lang.value == 'Guj' ? 'સ્વામીની વાત પુરી કરી તેનું નિરુપણ કરો.' : 'Complete Swamini Vaato'
            case 'Who_Whom_When': return this.Lang.value == 'Guj' ? 'કોણ, કોને, ક્યારે કહે છે.' : 'Speaking: Who, Whom, When'
            default: return this.Lang.value == 'Guj' ? 'પ્રશ્નના જવાબ આપો.' : 'Question and Answer'
        }
    }
}