//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Weighing.Terminal.Models
{
    using OanTech.Common;
    using System;
    using System.Collections.Generic;

    public partial class TerminalConfiguration : ITimeStamp
    {
        public int TerminalConfigurationId { get; set; }
        public string TerminalId { get; set; }
        public string TerminalCategory { get; set; }
        public Nullable<int> TerminalGroup { get; set; }
        public string TerminalDescription { get; set; }
        public string TerminalLocation { get; set; }
        public bool IsAllergen { get; set; }
        public bool IsActive { get; set; }
        public string UsrCrt { get; set; }
        public System.DateTime DtmCrt { get; set; }
        public string UsrUpd { get; set; }
        public System.DateTime DtmUpd { get; set; }
    }
}
