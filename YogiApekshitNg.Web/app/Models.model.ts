import { NgModule } from '@angular/core';

export class MenuItem{
    Id: number;
    Lang: string;
    Name: string;
    BookId: number;
    ChapterNumber: number;
    Category: string;
    MenuItems: Array<MenuItem>;
}

export class QARecord {
    Id: number;
    Sr: number;
    Que: string;
    Ans: string;
    Chapter: string;
    Exams: string;
}

export class QA_WWW {
    Id: number;
    Sr: number;
    Que: string;
    Who: string;
    Whom: string;
    When: string;
    Chapter: string;
    Exams: string;
}

export class QA_VM{
    BookTitle:string;
    ChapterTitle :string;
    QARecords: Array<QARecord>;
}