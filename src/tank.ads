with Fuel_Unit; use Fuel_Unit;

package Tank is

   type Tank_Record is private;

   function Get_Size (T: Tank_Record) return Liter;

   function Get_Amount (T : Tank_Record) return Liter;

   procedure Set_Amount (T : in out Tank_Record; L : Liter);

   function Create_Tank_Record (Size : Liter) return Tank_Record;

private
   type Tank_Record is record
      Size : Liter;
      Amount : Liter;
   end record;

end Tank;
