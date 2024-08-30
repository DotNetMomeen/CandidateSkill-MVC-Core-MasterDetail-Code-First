using Microsoft.AspNetCore.Mvc;

namespace Candidate_Skill_MVC_CORE_MasterDetails.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
