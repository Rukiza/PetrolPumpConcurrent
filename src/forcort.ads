pragma Profile (Ravenscar);
with Fuel_Dispenser; use Fuel_Dispenser;

package Forcort is

   protected Fuel_Dispenser_One is
      function Get return Fuel_Dispenser_Record;
      procedure Put (D : in Fuel_Dispenser_Record);
   private
      pragma Priority(15);
      Current : Fuel_Dispenser_Record;
   end Fuel_Dispenser_One;


end Forcort;
