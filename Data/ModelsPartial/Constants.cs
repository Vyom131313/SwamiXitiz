using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SwamiXitiz.Data.ModelsPartial
{
    public static class Constants
    {
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
            CorrectOption,
            CorrectSentence,
            CorrectSequence,
            FillInBlank,
            Kirtan,
            OneSentence,
            Reason,
            Shlok,
            ShortNote,
            SwaminiVat,
            WhoWhomWhen
        }
    }
}
