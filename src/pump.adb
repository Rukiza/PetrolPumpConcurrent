pragma SPARK_Mode(On);
with Fuel_Unit;
use Fuel_Unit;

package body Pump is

   function Get_Reserve (D : in Pump_Record) return Liter
   is
      (D.Reserve);

   function Get_Nozzle_Out_State (D : in Pump_Record) return Boolean
   is
      (D.Nozzle_Out);

   procedure Set_Nozzle_Out_State (D : in out Pump_Record; B : Boolean)
   is
   begin
      D.Nozzle_Out := B;
   end Set_Nozzle_Out_State;

end Pump;
