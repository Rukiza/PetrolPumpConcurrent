with Fuel_Unit; use Fuel_Unit;

package Tank is

   type Tank_Record is private;

private
   type Tank_Record is record
      Size : Liter;
      Amount : Liter;
   end record;

end Tank;
