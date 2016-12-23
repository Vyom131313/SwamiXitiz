using System;
using System.Collections.Generic;
using System.ComponentModel;
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
            [Description("All")]
            All,

            [Description("સાચા_વિકલ્પો")]
            Correct_Option,

            [Description("સાચા_વાક્યો")]
            Correct_Sentence,

            [Description("સાચા_ક્રમ")]
            Correct_Sequence,

            [Description("ખાલી_જગ્યા")]
            Fill_In_Blank,

            [Description("કીર્તન")]
            Kirtan,

            [Description("એક_વાક્યમાં_જવાબ")]
            One_Sentence,

            [Description("કારણો")]
            Reason,

            //[Description("શ્લોક")]
            //Shlok,

            [Description("ટૂંકી_નોંધ")]
            Short_Note,

            [Description("સ્વામીની_વાતો")]
            Swamini_Vaato,

            [Description("કોણ_કોને_કહે_છે")]
            Who_Whom_When
        }
    }
}
