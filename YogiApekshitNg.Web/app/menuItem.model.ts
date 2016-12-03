export class MenuItem
{
    Id: number;
    Lang: string;
    Name: string;
    BookId: number;
    ChapterNumber: number;
    Category: string;
    MenuItems: Array<MenuItem>;
}
