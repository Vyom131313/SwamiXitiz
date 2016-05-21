using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;

namespace YogiApekshit.Models
{
    public class SignInInput
    {
        [Required]
        [Display(Name = "Login")]
        public string Login { get; set; }

        [Required]
        [UIHint("Password")]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [Display(Name = "Remember")]
        public bool Remember { get; set; }
    }

    public class BreadcrumbAndTitleModel
    {
        public string PageTitle { get; set; }
        public List<string> Breadcrumbs { get; set; }

        public BreadcrumbAndTitleModel()
        {

        }

        public BreadcrumbAndTitleModel(string pagetitle)
        {
            this.PageTitle = pagetitle;
        }
    }

    public class GridToolbarModel
    {
        public GridToolbarModel()
        {
            ShowSearch = true;
            ShowCreate = true;
            ShowFullScreen = true;
            ShowCollapse = true;
        }

        public string GridId { get; set; }
        public string Title { get; set; }
        public string SubTitle { get; set; }
        public bool ShowSearch { get; set; }
        public bool ShowCreate { get; set; }
        public bool ShowFullScreen { get; set; }
        public bool ShowCollapse { get; set; }

        public List<string> CustomOptions = new List<string>();
    }

    public class EmailAttribute : RegularExpressionAttribute
    {
        public EmailAttribute()
            : base(@"[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}")
        {
            this.ErrorMessage = "Please provide a valid email address";
        }
    }

    public class PhoneExprAttribute : RegularExpressionAttribute
    {
        public PhoneExprAttribute()
            : base(@"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$")
        {
            this.ErrorMessage = "Please provide a valid email address";
        }
    }

    public class MenuItem
    {
        public string Name { get; set; }
        public string AreaName { get; set; }
        public string ControllerName { get; set; }
        public string ActionName { get; set; }
        public string IConClass { get; set; }
        public bool IsActive { get; set; }
        public List<MenuItem> MenuItems = new List<MenuItem>();
        public List<NonMenuItem> NonMenuItems = new List<NonMenuItem>();

        public MenuItem()
        {
            Name = string.Empty;
            AreaName = string.Empty;
            ControllerName = string.Empty;
            ActionName = string.Empty;

            IConClass = "fa fa-caret-right";
        }

        public BreadCrumb BreadCrumb
        {
            get
            {
                return new BreadCrumb
                {
                    Title = this.Name,
                    ControllerName = this.ControllerName,
                    ActionName = this.ActionName,
                    AreaName = this.AreaName
                };
            }
        }

        public List<BreadCrumb> GetByControllerAndAction(string controller, string action, string area = "")
        {
            var breadCrumbs = new List<BreadCrumb>();
            if (this.ControllerName.Equals(controller) && this.ActionName.Equals(action) && this.AreaName.Equals(area))
            {
                breadCrumbs.Add(this.BreadCrumb);
            }
            else if (this.NonMenuItems.Where(obj => obj.ControllerName.Equals(controller) && obj.ActionName.Equals(action) && obj.AreaName.Equals(area)).Count() > 0)
            {
                var nonMenuItem = this.NonMenuItems.Where(obj => obj.ControllerName.Equals(controller) && obj.ActionName.Equals(action) && obj.AreaName.Equals(area)).FirstOrDefault();
                breadCrumbs.Add(this.BreadCrumb);
                breadCrumbs.Add(nonMenuItem.BreadCrumb);
            }
            else
            {
                foreach (var child in this.MenuItems)
                {
                    breadCrumbs = child.GetByControllerAndAction(controller, action, area);
                    if (breadCrumbs.Count > 0)
                    {
                        breadCrumbs.Insert(0, this.BreadCrumb);
                        break;
                    }
                }
            }

            return breadCrumbs;
        }
    }

    public class NonMenuItem
    {
        public string Name { get; set; }
        public string AreaName { get; set; }
        public string ControllerName { get; set; }
        public string ActionName { get; set; }

        public NonMenuItem()
        {
            Name = string.Empty;
            AreaName = string.Empty;
            ControllerName = string.Empty;
            ActionName = string.Empty;
        }

        public BreadCrumb BreadCrumb
        {
            get
            {
                return new BreadCrumb
                {
                    Title = this.Name,
                    ControllerName = this.ControllerName,
                    ActionName = this.ActionName,
                    AreaName = this.AreaName
                };
            }
        }

    }

    public class BreadCrumb
    {
        public string Title { get; set; }
        public string AreaName { get; set; }
        public string ControllerName { get; set; }
        public string ActionName { get; set; }
    }

    public class MenuBuilder
    {
        public static List<BreadCrumb> BuildBreadCrumb(string controller, string action, string area = "")
        {
            var menus = BuildMenu();
            return menus.GetByControllerAndAction(controller, action, area);
        }

        public static MenuItem BuildMenu()
        {
            var root = new MenuItem { Name = "Home", ControllerName = "Home", ActionName = "Index" };
            root.MenuItems = new List<MenuItem> 
            {
                new MenuItem { Name = "Dashboard", ControllerName="Home", ActionName="Index", IConClass = "fa fa-dashboard" },
                
                new MenuItem { Name = "Prarambh", IConClass = "fa fa-pencil",
                    MenuItems = new List<MenuItem>
                    {
                        new MenuItem { Name = "Que-2", ControllerName="Prarambh", ActionName="Que_2" },
                    }
                },

                new MenuItem { Name = "Pravesh-1", IConClass = "fa fa-pencil",
                    MenuItems = new List<MenuItem>
                    {
                        new MenuItem { Name = "Que-1", ControllerName="Pravesh_1", ActionName="Que_1" },
                        new MenuItem { Name = "Que-2", ControllerName="Pravesh_1", ActionName="Que_2" },
                        new MenuItem { Name = "Que-4", ControllerName="Pravesh_1", ActionName="Que_4" },
                        new MenuItem { Name = "Que-7", ControllerName="Pravesh_1", ActionName="Que_7" },
                        new MenuItem { Name = "Que-8", ControllerName="Pravesh_1", ActionName="Que_8" },
                        new MenuItem { Name = "Que-9", ControllerName="Pravesh_1", ActionName="Que_9" },
                        new MenuItem { Name = "Que-12", ControllerName="Pravesh_1", ActionName="Que_12" }
                    }
                }, 
            };
            return root;
        }
    }
}