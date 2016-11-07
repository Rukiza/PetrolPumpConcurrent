pragma Profile (Ravenscar);
with Display;
use Display;
with System;

package body Display_Controller is

   -- Event for updating the display.
   protected body Display_Event is

      entry Wait(D : out Display_Record) when Signalled is
      begin
         D := Current;
         Signalled := False;
      end Wait;

      procedure Signal(D : in Display_Record) is
      begin
         Current := D;
         Signalled := True;
      end Signal;

   end Display_Event;

   Display_Event_Object : Display_Event(15);

   -- Handles the updating of the display in the
   -- Fuel dispensing Unit.
   task body Display_Update_Handler is
      D : Display_Record;
   begin
      loop
         Display_Event_Object.Wait(D);
      end loop;
   end Display_Update_Handler;

end Display_Controller;
