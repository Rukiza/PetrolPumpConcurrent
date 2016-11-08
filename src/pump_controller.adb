pragma Profile (Ravenscar);
pragma SPARK_Mode (On);
with Fuel_Dispenser; use Fuel_Dispenser;

package body Pump_Controller is

   protected body Nozzle_Sensor_Event is

      entry Wait(D : out Nozzle_Sensor_Event_Record) when Signalled is
      begin
         D := Current;
         Signalled := False;
      end Wait;

      procedure Signal(D : in Nozzle_Sensor_Event_Record) is
      begin
         Current := D;
         Signalled := True;
      end Signal;

   end Nozzle_Sensor_Event;



   Nozzle_Sensor_Event_Object : Nozzle_Sensor_Event(15);

   -- Handles the updating of the display in the
   -- Fuel dispensing Unit.
   task body Nozzle_Sensor_Handler is
      D : Nozzle_Sensor_Event_Record;
      FD: Fuel_Dispenser_Record;
   begin
      loop
         Nozzle_Sensor_Event_Object.Wait(D);
         FD := Forcort.Fuel_Dispensers.Get(D.Fuel_Number);
         if (not D.Signal) then
            Fuel_Dispenser.Handle_Nozzle_Out(FD, D.PN);
         elsif (D.Signal) then
            Fuel_Dispenser.Handle_Nozzle_In(FD, D.PN);
         end if;
         Forcort.Fuel_Dispensers.Put(FD, D.Fuel_Number);
      end loop;
   end Nozzle_Sensor_Handler;

   protected body Trigger_Sensor_Event is

      entry Wait(D : out Trigger_Sensor_Event_Record) when Signalled is
      begin
         D := Current;
         Signalled := False;
      end Wait;

      procedure Signal(D : in Trigger_Sensor_Event_Record) is
      begin
         Current := D;
         Signalled := True;
      end Signal;

   end Trigger_Sensor_Event;



   Trigger_Sensor_Event_Object : Trigger_Sensor_Event(15);

   -- Handles the updating of the display in the
   -- Fuel dispensing Unit.
   task body Trigger_Sensor_Handler is
      D : Trigger_Sensor_Event_Record;
      FD: Fuel_Dispenser_Record;
   begin
      loop
         Trigger_Sensor_Event_Object.Wait(D);
         if (D.Signal) then
            FD := Forcort.Fuel_Dispensers.Get(D.Fuel_Number);
            Fuel_Dispenser.Pump_Fuel(FD, D.Tank, 1);
            Forcort.Fuel_Dispensers.Put(FD, D.Fuel_Number);
         end if;
      end loop;
   end Trigger_Sensor_Handler;



   protected body Tank_Full_Sensor_Event is

      entry Wait(D : out Tank_Full_Sensor_Event_Record) when Signalled is
      begin
         D := Current;
         Signalled := False;
      end Wait;

      procedure Signal(D : in Tank_Full_Sensor_Event_Record) is
      begin
         Current := D;
         Signalled := True;
      end Signal;

   end Tank_Full_Sensor_Event;

   Tank_Full_Sensor_Event_Object : Tank_Full_Sensor_Event(15);

   -- Handles the updating of the display in the
   -- Fuel dispensing Unit.
   task body Tank_Full_Sensor_Handler is
      D : Tank_Full_Sensor_Event_Record;
      FD: Fuel_Dispenser_Record;
   begin
      loop
         Tank_Full_Sensor_Event_Object.Wait(D);
         FD := Forcort.Fuel_Dispensers.Get(D.Fuel_Number);

      end loop;
   end Tank_Full_Sensor_Handler;

   procedure Signal_Nozzle_Sensor (T : Nozzle_Sensor_Event_Record)
   is
   begin
     Nozzle_Sensor_Event_Object.Signal(T);
   end Signal_Nozzle_Sensor;

   function Create_Nozzle_Sensor_Event_Record (
                                                Signal : Boolean;
                                                Fuel_Number : Fuel_Dispenser_Number;
                                                PN : Pump_Number
                                               )
                                               return Nozzle_Sensor_Event_Record
   is
      (Signal, Fuel_Number, PN);

   procedure Signal_Trigger_Sensor (T : Trigger_Sensor_Event_Record)
   is
   begin
     Trigger_Sensor_Event_Object.Signal(T);
   end Signal_Trigger_Sensor;

   function Create_Trigger_Sensor_Event_Record (
                                                Signal : Boolean;
                                                Fuel_Number : Fuel_Dispenser_Number;
                                                Tank : Tank_Record
                                               )
                                                return Trigger_Sensor_Event_Record
   is
      (Signal, Fuel_Number, Tank);

end Pump_Controller;
