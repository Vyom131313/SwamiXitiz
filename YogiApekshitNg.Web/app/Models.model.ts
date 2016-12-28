import { NgModule } from '@angular/core';

export class MenuItem{
    Id: number;
    Lang: string;
    Name: string;
    BookId: number;
    ChapterNumber: number;
    Category: string;
    IConUrl: string;
    MenuItems: Array<MenuItem>;
}

export class QARecord {
    Id: number;
    Sr: number;
    Que: string;
    Ans: string;
    ShowAns: boolean;
    Chapter: string;
    Exams: string;
}

export class QA_VM{
    BookTitle:string;
    ChapterTitle: string;
    Color: string;
    QARecords: Array<QARecord>;
}