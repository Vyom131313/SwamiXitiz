using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;

namespace YogiApekshit.Web.Models
{
    public class FactorViewModel
    {
        public string Purpose { get; set; }
    }

    public class SetPasswordViewModel
    {
        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "New password")]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm new password")]
        [Compare("NewPassword", ErrorMessage = "The new password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
    }

    public class ChangePasswordViewModel
    {
        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Current password")]
        public string OldPassword { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "New password")]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm new password")]
        [Compare("NewPassword", ErrorMessage = "The new password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
    }

    public class AddPhoneNumberViewModel
    {
        [Required]
        [Phone]
        [Display(Name = "Phone Number")]
        public string Number { get; set; }
    }

    public class VerifyPhoneNumberViewModel
    {
        [Required]
        [Display(Name = "Code")]
        public string Code { get; set; }

        [Required]
        [Phone]
        [Display(Name = "Phone Number")]
        public string PhoneNumber { get; set; }
    }

    public class ConfigureTwoFactorViewModel
    {
        public string SelectedProvider { get; set; }
        public ICollection<System.Web.Mvc.SelectListItem> Providers { get; set; }
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