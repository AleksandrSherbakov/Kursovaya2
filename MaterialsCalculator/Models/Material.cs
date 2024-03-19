//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MaterialsCalculator.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Material
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Material()
        {
            this.Calculations = new HashSet<Calculation>();
        }
    
        public int MaterialID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }
        public string Square { get; set; }
        public string Price { get; set; }
        public Nullable<int> MaterialTypeID { get; set; }
        public Nullable<int> ManufacturerID { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Calculation> Calculations { get; set; }
        public virtual Manufacturer Manufacturer { get; set; }
        public virtual MaterialType MaterialType { get; set; }
    }
}
