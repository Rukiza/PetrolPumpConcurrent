pragma Profile (Ravenscar);
pragma SPARK_Mode(On);

package body Forcort is

   -- Set up for storage about fuel dispenser.
   protected body Fuel_Dispensers is
      function Get (N : in Fuel_Dispenser_Number) return Fuel_Dispenser_Record is
      begin
         return Current(N);
      end Get;
      procedure Put (D : in Fuel_Dispenser_Record; N: in Fuel_Dispenser_Number) is
      begin
         Current(N) := D;
      end Put;
      procedure Put (A : in Fuel_Dispenser_Array) is
      begin
         Current := A;
      end Put;
   end Fuel_Dispensers;



end Forcort;
