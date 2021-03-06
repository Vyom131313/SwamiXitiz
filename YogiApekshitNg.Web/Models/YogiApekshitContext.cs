using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using SwamiXitiz.Data.Models.Mapping;

namespace SwamiXitiz.Data.Models
{
    public partial class YogiApekshitContext : DbContext
    {
        static YogiApekshitContext()
        {
            Database.SetInitializer<YogiApekshitContext>(null);
        }

        public YogiApekshitContext()
            : base("Name=YogiApekshitContext")
        {
        }

        public DbSet<Book> Books { get; set; }
        public DbSet<BookChapter> BookChapters { get; set; }
        public DbSet<ExamLevel> ExamLevels { get; set; }
        public DbSet<QueCorrectOption> QueCorrectOptions { get; set; }
        public DbSet<QueCorrectSentence> QueCorrectSentences { get; set; }
        public DbSet<QueCorrectSequence> QueCorrectSequences { get; set; }
        public DbSet<QueFillInBlank> QueFillInBlanks { get; set; }
        public DbSet<QueKirtan> QueKirtans { get; set; }
        public DbSet<QueOneSentence> QueOneSentences { get; set; }
        public DbSet<QueReason> QueReasons { get; set; }
        public DbSet<QueShlok> QueShloks { get; set; }
        public DbSet<QueShortNote> QueShortNotes { get; set; }
        public DbSet<QuestionCategory> QuestionCategories { get; set; }
        public DbSet<QueSwaminiVat> QueSwaminiVats { get; set; }
        public DbSet<QueWhoWhomWhen> QueWhoWhomWhens { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new BookMap());
            modelBuilder.Configurations.Add(new BookChapterMap());
            modelBuilder.Configurations.Add(new ExamLevelMap());
            modelBuilder.Configurations.Add(new QueCorrectOptionMap());
            modelBuilder.Configurations.Add(new QueCorrectSentenceMap());
            modelBuilder.Configurations.Add(new QueCorrectSequenceMap());
            modelBuilder.Configurations.Add(new QueFillInBlankMap());
            modelBuilder.Configurations.Add(new QueKirtanMap());
            modelBuilder.Configurations.Add(new QueOneSentenceMap());
            modelBuilder.Configurations.Add(new QueReasonMap());
            modelBuilder.Configurations.Add(new QueShlokMap());
            modelBuilder.Configurations.Add(new QueShortNoteMap());
            modelBuilder.Configurations.Add(new QuestionCategoryMap());
            modelBuilder.Configurations.Add(new QueSwaminiVatMap());
            modelBuilder.Configurations.Add(new QueWhoWhomWhenMap());
        }
    }
}
