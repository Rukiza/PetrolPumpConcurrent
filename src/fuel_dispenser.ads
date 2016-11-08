with State; use State;
with Pump; use Pump;
with Tank; use Tank;
with Fuel_Unit; use Fuel_Unit;

package Fuel_Dispenser is

   type Fuel_Dispenser_Record is private;

   type Pump_Number is new Integer range 1..3;

   type Pump_Array is array (Pump_Number) of Pump_Record;

   procedure Pump_Fuel (R : in out Fuel_Dispenser_Record;
                        T : in out Tank_Record;
                        A : in Liter);

   procedure Handle_Nozzle_Out(R : in out Fuel_Dispenser_Record;
                               F : in Pump_Number);

   procedure Handle_Nozzle_In(R : in out Fuel_Dispenser_Record;
                              F : in Pump_Number);

private
   type Fuel_Dispenser_Record is record
      State : State_Enum;
      Pumps : Pump_Array;
      Current_Pump : Pump_Number;
      Has_Current : Boolean;
   end record;

end Fuel_Dispenser;
