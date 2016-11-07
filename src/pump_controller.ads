pragma Profile (Ravenscar);

package Pump_Controller is

   task Nozzle_Sensor is
      pragma Priority(14);
   end Nozzle_Sensor;

   task Trigger_Sensor is
      pragma Priority(14);
   end Trigger_Sensor;

   task Tank_Full_Sensor is
      pragma Priority(14);
   end Tank_Full_Sensor;


end Pump_Controller;
