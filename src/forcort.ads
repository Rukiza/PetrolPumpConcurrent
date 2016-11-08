pragma Profile (Ravenscar);
pragma SPARK_Mode(On);
with Fuel_Dispenser; use Fuel_Dispenser;

package Forcort is

   type Fuel_Dispenser_Number is new Integer range 1 .. 2;

   type Fuel_Dispenser_Array is array (Fuel_Dispenser_Number) of Fuel_Dispenser_Record;

   protected Fuel_Dispensers is
      function Get (N: Fuel_Dispenser_Number) return Fuel_Dispenser_Record;
      procedure Put (D : in Fuel_Dispenser_Record; N: in Fuel_Dispenser_Number);
      procedure Put (A : in Fuel_Dispenser_Array);
   private
      pragma Priority(15);
      Current : Fuel_Dispenser_Array;
   end Fuel_Dispensers;


end Forcort;
