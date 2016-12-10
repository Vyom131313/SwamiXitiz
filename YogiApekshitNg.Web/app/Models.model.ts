import { NgModule } from '@angular/core';

export class QARecord {
    Id: number;
    Sr: number;
    Que: string;
    Ans: string;
    Chapter: string;
    Exams: string;
}

export class QA_VM{
    BookTitle:string;
    ChapterTitle :string;
    QARecords: Array<QARecord>;
}