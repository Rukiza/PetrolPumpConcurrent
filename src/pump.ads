with Fuel_Unit;
use Fuel_Unit;

package Pump is

   type Pump_Record is private;



private
   type Pump_Record is record
      Fuel_Type : Integer;
      Reserve : Liter;
      Nozzle_Out : Boolean;
   end record;

end Pump;
