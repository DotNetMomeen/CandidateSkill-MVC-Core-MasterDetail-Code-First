using Candidate_Skill_MVC_CORE_MasterDetails.Models;
using Microsoft.EntityFrameworkCore;


var builder = WebApplication.CreateBuilder(args);
builder.Services.AddControllersWithViews();
//connection
builder.Services.AddDbContext<CandidateDbContext>(opt => opt.UseSqlServer(builder.Configuration.GetConnectionString("CandidateSkillCon")));
var app = builder.Build();


app.UseStaticFiles();
app.UseRouting();
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
