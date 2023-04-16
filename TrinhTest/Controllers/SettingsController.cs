﻿using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace TrinhTest.Controllers
{
    public class SettingsController : Controller
    {
        [Authorize]
        [Route("PriceServices")]
        public IActionResult PriceServices()
        {
            return View("~/Views/Pages/Setting/PriceServices/SettingPriceServices.cshtml");
        }
        [Authorize]
        [Route("SLanguages")]
        public IActionResult Languages()
        {
            return View("~/Views/Pages/Setting/Languages.cshtml");
        }
    }
}
