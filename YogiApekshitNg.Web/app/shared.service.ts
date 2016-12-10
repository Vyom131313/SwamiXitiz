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
    public ChapterColumnText: string = "Chapter";
    public ExamsColumnText: string = "Exams";
    public BookColumnText: string = "Book";

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
    }

    GetQueAnsColumnText(category: string): string {

        if (this.Lang.value == 'Guj') {
            switch (category) {
                case 'Correct_Option': return 'ફક્ત સાચા વિકલ્પો પસંદ કરો.'
                case 'Fill_In_Blank': return 'ખાલી જગ્યા પૂરો.'
                case 'One_Sentence': return 'એક (સંપૂર્ણ) વાક્યમાં જવાબ આપો.'
                case 'Correct_Sentence': return 'ખોટા વાક્યોને મથાળાના સંદર્ભમાં સાચા લખો.'
                case 'Correct_Sequence': return 'સાચા ક્રમ નંબર અને ઘટના ક્રમ પ્રમાણે ગોઠવો.'
                case 'Kirtan': return 'કીર્તન / શ્લોક / અષ્ટક ની ખૂટતી કડીઓ પુરી કરો.'
                case 'Reason': return 'વાક્યોના કારણો જણાવો '
                case 'Shlok': return 'કીર્તન / શ્લોક / અષ્ટક ની ખૂટતી કડીઓ પુરી કરો.'
                case 'Short_Note': return 'ટૂંક નોંધ લખો.'
                case 'Swamini_Vaato': return 'સ્વામીની વાત પુરી કરી તેનું નિરુપણ કરો.'
                default: return 'પ્રશ્નના જવાબ આપો.'
            }
        }
        else {
            switch (category) {
                case 'Correct_Option': return 'Select Correct Options'
                case 'Fill_In_Blank': return 'Fill In Blanks'
                case 'One_Sentence': return 'Answer in One Sentence'
                case 'Correct_Sentence': return 'Correct the Sentence'
                case 'Correct_Sequence': return 'Correct the Sentence of incident'
                case 'Kirtan': return 'Complete the Kirtan'
                case 'Reason': return 'Give Reasons'
                case 'Shlok': return 'Complete the Shloks'
                case 'Short_Note': return 'Write a short note'
                case 'Swamini_Vaato': return 'Complete Swamini Vaato'
                default: return 'Question and Answer'
            }
        }
    }
}