with Fuel_Dispenser; use Fuel_Dispenser;
with Fuel_Unit; use Fuel_Unit;
with Forcort; use Forcort;

package Staff_Interaction is

   procedure Open_Fuel_Dispenser(D : Fuel_Dispenser_Number);

   procedure Close_Fuel_Dispenser(D : Fuel_Dispenser_Number);

   procedure Authorize_Fuel_Dispensor (D : Fuel_Dispenser_Number);

   procedure Start_Fuel_Dispenser (D : Fuel_Dispenser_Number);

   procedure Stop_Fuel_Dispenser (D : Fuel_Dispenser_Number);

end Staff_Interaction;
