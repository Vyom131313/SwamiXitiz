using Mvc.Core.ThirdParty;

namespace YogiApekshit
{
    public static class IConweyConfigurator
    {
        public static void Configure()
        {
            Settings.Lookup.HighlightChange = true;
            Settings.MultiLookup.HighlightChange = true;
            Settings.GetText = GetTranslate;
        }

        private static string GetTranslate(string type, string key)
        {
            if (type == "Form.ConfirmOptions" && key == "Title") return "";
            if (type == "Form.ConfirmOptions" && key == "Message") return "Confirm Delete";
            if (type == "PopupForm" && key == "Title") return "";
            if (type == "Lookup" && key == "Title") return "";
            if (type == "MultiLookup" && key == "Title") return "";
            switch (key)
            {
                case "CancelText": return "Cancel";
                case "YesText": return "Yes";
                case "NoText": return "No";
                case "MoreText": return "more";
                case "SearchText": return "Search";
            }
            return null;
        }
    }
}