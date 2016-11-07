pragma Profile (Ravenscar);

package body Forcort is

   -- Set up for storage about fuel dispenser.
   protected body Fuel_Dispenser_One is
      function Get return Fuel_Dispenser_Record is
      begin
         return Current;
      end Get;
      procedure Put (D : in Fuel_Dispenser_Record) is
      begin
         Current := D;
      end Put;
   end Fuel_Dispenser_One;



end Forcort;
