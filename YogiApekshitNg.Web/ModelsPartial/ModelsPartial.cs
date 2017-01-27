using Data.Core.IEntity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;

namespace SwamiXitiz.Data.Models
{
    public interface IQuestion
    {
        int BookId { get; set; }
        int ChapterNumber { get; set; }
        string Exams { get; set; }
    }

    public partial class Book : EntityBase
    {

    }

    public partial class BookChapter : EntityBase
    {

    }

    public partial class ExamLevel : EntityBase
    {

    }

    public partial class QueCorrectSentence : EntityBase, IQuestion
    {

    }

    public partial class QueCorrectSequence : EntityBase, IQuestion
    { }

    public partial class QueCorrectOption : EntityBase, IQuestion
    {

    }

    public partial class QueFillInBlank : EntityBase, IQuestion
    {

    }

    public partial class QueKirtan : EntityBase, IQuestion
    {

    }

    public partial class QueShlok : EntityBase, IQuestion
    {

    }

    public partial class QueReason : EntityBase, IQuestion
    {

    }

    public partial class QueSwaminiVat : EntityBase, IQuestion
    {

    }

    public partial class QuestionCategory : EntityBase
    {

    }

    public partial class QueOneSentence : EntityBase, IQuestion
    {

    }

    public partial class QueWhoWhomWhen : EntityBase, IQuestion
    {

    }

    public partial class QueShortNote : EntityBase, IQuestion
    {

    }
}