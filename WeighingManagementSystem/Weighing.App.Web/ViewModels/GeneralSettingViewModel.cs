using OanTech.Paging;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Weighing.App.Web.ViewModels
{
    public class GeneralSettingViewModel
    {
        public long GeneralSettingId { get; set; }

        [Required]
        [Display(Name = "General Setting Code")]
        public string GSCode { get; set; }

        [Required]
        [Display(Name = "General Setting Key")]
        public string GSKey { get; set; }

        [Required]
        [Display(Name = "General Setting Value")]
        public string GSValue { get; set; }
    }

    public class GeneralSettingViewPaging
    {
        public IPagingHelper Paging { get; set; }
        public List<GeneralSettingViewModel> Data { get; set; }
    }
}