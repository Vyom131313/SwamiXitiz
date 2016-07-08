using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SwamiXitiz.Data.ModelsPartial
{
    public static class Constants
    {
        public static class ExamLevels
        {
            public static int Prarambh = 1;
            public static int Pravesh = 2;
            public static int Parichay = 3;
            public static int Pravin = 4;
        }

        public static class Books
        {
            public static int Ghanshaym_Charitra = 1;
            public static int Yogiji_Maharaj = 2;
            public static int Kishore_Satsang_Prarambha = 3;

            public static List<int> Prarambha_AllBooks
            {
                get
                {
                    return new List<int> { Ghanshaym_Charitra, Yogiji_Maharaj, Kishore_Satsang_Prarambha };
                }
            }
        }

        public enum Que_Categories
        {
            Correct_Option,
            Correct_Sentence,
            Correct_Sequence,
            Fill_In_Blank,
            Kirtan,
            One_Sentence,
            Reason,
            Shlok,
            Short_Note,
            Swamini_Vaato,
            Who_Whom_When
        }
    }
}
