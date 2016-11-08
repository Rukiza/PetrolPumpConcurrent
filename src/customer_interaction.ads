pragma Profile (Ravenscar);
pragma SPARK_Mode (On);
with Fuel_Dispenser; use Fuel_Dispenser;
with Fuel_Unit; use Fuel_Unit;
with Forcort; use Forcort;

package Customer_Interaction is

   procedure Nozzle_Out (N : Pump_Number; D: Fuel_Dispenser_Number);

   procedure Nozzle_In (N : Pump_Number; D: Fuel_Dispenser_Number);

   procedure Pull_Trigger (N : Pump_Number; D : Fuel_Dispenser_Number);

   procedure Pay (D : Fuel_Dispenser_Number);

end Customer_Interaction;
