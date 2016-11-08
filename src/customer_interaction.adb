pragma Profile (Ravenscar);
pragma SPARK_Mode (On);
with Pump_Controller; use Pump_Controller;
with Tank; use Tank;

package body Customer_Interaction is

   procedure Nozzle_Out (N : Pump_Number; D: Fuel_Dispenser_Number)
   is
      E : Nozzle_Sensor_Event_Record :=
        Pump_Controller.Create_Nozzle_Sensor_Event_Record(False, D, N);
   begin
      Pump_Controller.Signal_Nozzle_Sensor(E);
   end Nozzle_Out;

   procedure Nozzle_In (N : Pump_Number; D: Fuel_Dispenser_Number)
   is
      E : Nozzle_Sensor_Event_Record :=
        Pump_Controller.Create_Nozzle_Sensor_Event_Record(True, D, N);
   begin
      Pump_Controller.Signal_Nozzle_Sensor(E);
   end Nozzle_In;

   procedure Pull_Trigger (N : Pump_Number; D : Fuel_Dispenser_Number)
   is
      T : Tank_Record := Tank.Create_Tank_Record(40);
      E : Trigger_Sensor_Event_Record :=
        Pump_Controller.Create_Trigger_Sensor_Event_Record(True, D, T);
   begin
      Pump_Controller.Signal_Trigger_Sensor(E);
   end Pull_Trigger;

   procedure Pay (D : Fuel_Dispenser_Number)
   is
   begin
      null;
   end Pay;

end Customer_Interaction;
