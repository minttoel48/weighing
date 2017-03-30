using OanTech.Paging;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Weighing.App.Web.ViewModels
{
    public class TerminalConfigurationViewModel
    {
        public int TerminalConfigurationId { get; set; }
        [Required]
        [Display(Name = "Terminal ID")]
        public string TerminalId { get; set; }
        [Required]
        [Display(Name = "Terminal Category")]
        public string TerminalCategory { get; set; }
        [Required]
        [Display(Name = "Terminal Group")]
        public Nullable<int> TerminalGroup { get; set; }
        [Required]
        [Display(Name = "Terminal Description")]
        public string TerminalDescription { get; set; }
        [Required]
        [Display(Name = "Terminal Location")]
        public string TerminalLocation { get; set; }
        [Required]
        [Display(Name = "Allergen")]
        public bool IsAllergen { get; set; }
        [Required]
        [Display(Name = "Active")]
        public bool IsActive { get; set; }
    }

    public class TerminalConfigurationViewPaging
    {
        public IPagingHelper Paging { get; set; }
        public List<TerminalConfigurationViewModel> Data { get; set; }
    }
}