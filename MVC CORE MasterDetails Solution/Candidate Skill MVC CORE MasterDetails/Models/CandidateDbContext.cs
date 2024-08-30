using Microsoft.EntityFrameworkCore;

namespace Candidate_Skill_MVC_CORE_MasterDetails.Models
{
    public class CandidateDbContext:DbContext
    {
        public CandidateDbContext(DbContextOptions<CandidateDbContext> options) : base(options)
        {

        }

        public DbSet<Skill> Skills { get; set; }
        public DbSet<Candidate> Candidates { get; set; }
        public DbSet<CandidateSkill> CandidateSkills { get; set; }
    }
}
