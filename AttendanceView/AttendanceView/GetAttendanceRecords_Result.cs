//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AttendanceView
{
    using System;
    
    public partial class GetAttendanceRecords_Result
    {
        public int AttendanceID { get; set; }
        public Nullable<int> ProjectID { get; set; }
        public Nullable<long> EmployeeID { get; set; }
        public System.DateTime AttedanceDate { get; set; }
        public System.TimeSpan InTime { get; set; }
        public System.TimeSpan OutTime { get; set; }
        public string AttendanceStatus { get; set; }
        public Nullable<System.DateTime> StatusUpdateDate { get; set; }
        public Nullable<long> StatusUpdatedBy { get; set; }
    }
}
