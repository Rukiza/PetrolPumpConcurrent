package State is

   type State_Enum is (Inopritive, Closed,
                       Idle,
                       Calling,
                       Started,
                       Suspended_Started,
                       Fuelling,
                       Suspended_Fuelling);

end State;
