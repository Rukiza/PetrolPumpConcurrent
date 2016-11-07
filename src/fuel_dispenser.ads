with State; use State;

package Fuel_Dispenser is

   type Fuel_Dispenser_Record is private;

private
   type Fuel_Dispenser_Record is record
      State : State_Enum;
      Pump_One : Pump_Record;
      Pump_Two : Pump_Record;
      Pump_Three : Pump_Record;
   end record;

end Fuel_Dispenser;
