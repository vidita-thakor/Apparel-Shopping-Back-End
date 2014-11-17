using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Administrator.Models.Mapping
{
    public class CategoryMap : EntityTypeConfiguration<Category>
    {
        public CategoryMap()
        {
            // Primary Key
            this.HasKey(t => t.CategoryId);

            // Properties
            this.Property(t => t.CategoryName)
                .IsRequired()
                .HasMaxLength(100);

            this.Property(t => t.CategoryUrl)
                .HasMaxLength(200);

            this.Property(t => t.CategoryUpdated)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(8)
                .IsRowVersion();

            // Table & Column Mappings
            this.ToTable("Categories");
            this.Property(t => t.CategoryId).HasColumnName("CategoryId");
            this.Property(t => t.ParentCategoryId).HasColumnName("ParentCategoryId");
            this.Property(t => t.CategoryName).HasColumnName("CategoryName");
            this.Property(t => t.CategoryDescription).HasColumnName("CategoryDescription");
            this.Property(t => t.CategoryUrl).HasColumnName("CategoryUrl");
            this.Property(t => t.CategoryUpdated).HasColumnName("CategoryUpdated");
            this.Property(t => t.CategoryCreated).HasColumnName("CategoryCreated");
        }
    }
}
