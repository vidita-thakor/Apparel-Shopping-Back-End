using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Administrator.Models.Mapping
{
    public class ParamValueMap : EntityTypeConfiguration<ParamValue>
    {
        public ParamValueMap()
        {
            // Primary Key
            this.HasKey(t => t.ParamValueId);

            // Properties
            this.Property(t => t.ParamValue1)
                .IsRequired()
                .HasMaxLength(100);

            // Table & Column Mappings
            this.ToTable("ParamValues");
            this.Property(t => t.ParamValueId).HasColumnName("ParamValueId");
            this.Property(t => t.ProductParamId).HasColumnName("ProductParamId");
            this.Property(t => t.ParamValue1).HasColumnName("ParamValue");

            // Relationships
            this.HasRequired(t => t.ProductParam)
                .WithMany(t => t.ParamValues)
                .HasForeignKey(d => d.ProductParamId);

        }
    }
}
