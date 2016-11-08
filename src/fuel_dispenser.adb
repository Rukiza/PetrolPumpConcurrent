with State; use State;
with Pump; use Pump;
with Tank; use Tank;
with Fuel_Unit; use Fuel_Unit;

package body Fuel_Dispenser is

   procedure Pump_Fuel (R : in out Fuel_Dispenser_Record;
                        T : in out Tank_Record;
                        A : in Liter)
   is
   begin
      null;
   end Pump_Fuel;

   procedure Handle_Nozzle_Out(R : in out Fuel_Dispenser_Record;
                               F : in Pump_Number)
   is
   begin
      null;
   end Handle_Nozzle_Out;

   procedure Handle_Nozzle_In(R : in out Fuel_Dispenser_Record;
                              F : in Pump_Number)
   is
   begin
      null;
   end Handle_Nozzle_In;

end Fuel_Dispenser;
