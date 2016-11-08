with Fuel_Unit; use Fuel_Unit;

package body Tank is

   function Get_Size (T: Tank_Record) return Liter
   is
     (T.Size);

   function Get_Amount (T : Tank_Record) return Liter
   is
      (T.Amount);

   procedure Set_Amount (T : in out Tank_Record; L : Liter) is
   begin
      T.Amount := T.Amount + L;
   end Set_Amount;


end Tank;
