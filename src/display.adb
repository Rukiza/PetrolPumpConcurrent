pragma SPARK_Mode(On);
with Fuel_Unit; use Fuel_Unit;
with Forcort; use Forcort;
with Fuel_Dispenser; use Fuel_Dispenser;

package body Display is

   function Get_Amount (D : in Display_Record) return Liter
   is
      (D.Amount);

   function Get_Fuel_Dispenser_Number (D : in Display_Record)
                                       return Fuel_Dispenser_Number
   is
      (D.Fuel_Number);

   procedure Display_On_Screen (D : in Display_Record;
                                R : in Fuel_Dispenser_Record)
   is
   begin
      null;
   end Display_On_Screen;

end Display;
