pragma SPARK_Mode(On);
with Fuel_Unit;
use Fuel_Unit;

package Pump is

   type Pump_Record is private;

   function Get_Reserve (D : in Pump_Record) return Liter;

   function Get_Nozzle_Out_State (D : in Pump_Record) return Boolean;

   procedure Set_Nozzle_Out_State (D : in out Pump_Record; B : Boolean);

private
   type Pump_Record is record
      Reserve : Liter;
      Nozzle_Out : Boolean;
   end record;

end Pump;
