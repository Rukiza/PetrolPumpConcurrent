pragma Profile (Ravenscar);
pragma SPARK_Mode (On);
with Forcort; use Forcort;
with System;
with Tank; use Tank;
with Fuel_Dispenser; use Fuel_Dispenser;

package Pump_Controller is

   type Nozzle_Sensor_Event_Record is private;
   type Trigger_Sensor_Event_Record is private;
   type Tank_Full_Sensor_Event_Record is private;



   protected type Nozzle_Sensor_Event(Ceiling : System.Priority) is
      entry Wait(D : out Nozzle_Sensor_Event_Record);
      procedure Signal(D : in Nozzle_Sensor_Event_Record);
   private
      pragma Priority(Ceiling);
      Current : Nozzle_Sensor_Event_Record;
      Signalled : Boolean := False;
   end Nozzle_Sensor_Event;

   task Nozzle_Sensor_Handler is
      pragma Priority(14);
   end Nozzle_Sensor_Handler;

   protected type Trigger_Sensor_Event(Ceiling : System.Priority) is
      entry Wait(D : out Trigger_Sensor_Event_Record);
      procedure Signal(D : in Trigger_Sensor_Event_Record);
   private
      pragma Priority(Ceiling);
      Current : Trigger_Sensor_Event_Record;
      Signalled : Boolean := False;
   end Trigger_Sensor_Event;

   task Trigger_Sensor_Handler is
      pragma Priority(14);
   end Trigger_Sensor_Handler;

   protected type Tank_Full_Sensor_Event(Ceiling : System.Priority) is
      entry Wait(D : out Tank_Full_Sensor_Event_Record);
      procedure Signal(D : in Tank_Full_Sensor_Event_Record);
   private
      pragma Priority(Ceiling);
      Current : Tank_Full_Sensor_Event_Record;
      Signalled : Boolean := False;
   end Tank_Full_Sensor_Event;

   task Tank_Full_Sensor_Handler is
      pragma Priority(14);
   end Tank_Full_Sensor_Handler;

   procedure Signal_Nozzle_Sensor (T : in Nozzle_Sensor_Event_Record);

   function Create_Nozzle_Sensor_Event_Record (
                                                Signal : Boolean;
                                                Fuel_Number : Fuel_Dispenser_Number;
                                                PN : Pump_Number
                                               ) return Nozzle_Sensor_Event_Record;

   procedure Signal_Trigger_Sensor (T : in Trigger_Sensor_Event_Record);

   function Create_Trigger_Sensor_Event_Record (
                                                Signal : Boolean;
                                                Fuel_Number : Fuel_Dispenser_Number;
                                                Tank : Tank_Record
                                               ) return Trigger_Sensor_Event_Record;
private

   type Nozzle_Sensor_Event_Record is record
      Signal : Boolean;
      Fuel_Number : Fuel_Dispenser_Number;
      PN : Pump_Number;
   end record;

   type Trigger_Sensor_Event_Record is record
      Signal : Boolean;
      Fuel_Number : Fuel_Dispenser_Number;
      Tank : Tank_Record;
   end record;

   type Tank_Full_Sensor_Event_Record is record
      Signal : Boolean;
      Fuel_Number : Fuel_Dispenser_Number;
      Tank : Tank_Record;
   end record;

end Pump_Controller;
