pragma Profile (Ravenscar);
with Display;
use Display;
with System;

package Display_Controller is

   -- Event for updating the display.
   protected type Display_Event(Ceiling : System.Priority) is
      entry Wait(D : out Display_Record);
      procedure Signal(D : in Display_Record);
   private
      pragma Priority(Ceiling);
      Current : Display_Record;
      Signalled : Boolean := False;
   end Display_Event;

   -- Handles the updating of the display in the
   -- Fuel dispensing Unit.
   task Display_Update_Handler is
      pragma Priority(14);
   end Display_Update_Handler;

end Display_Controller;
