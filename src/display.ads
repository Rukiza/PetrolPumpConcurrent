with Fuel_Unit;
use Fuel_Unit;
with Forcort; use Forcort;
with Fuel_Dispenser; use Fuel_Dispenser;

package Display is

   type Display_Record is private;

   function Get_Amount (D : in Display_Record) return Liter;

   function Get_Fuel_Dispenser_Number (D : in Display_Record)
                                       return Fuel_Dispenser_Number;

   procedure Display_On_Screen (D : in Display_Record;
                               R : in Fuel_Dispenser_Record);

private
   type Display_Record is record
      Amount: Liter;
      Fuel_Number : Fuel_Dispenser_Number;
   end record;

end Display;
