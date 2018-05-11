using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AssignmentWeb.Helpers;

namespace AssignmentWeb.Services
{
    public class BaseService
    {
        public static string BaseURL { get { return CommonHelper.GetWebConfigValue("AssignmentAPIURL"); } }  
    }
}