classdef PCEvent < handle
    % PCEVENT define a event for PCRunloop
    
    properties
        eventName % the event's name, also identifier (different event using different name)
        fireJudger % a function that return a boolean to indicate whether the event is fired
        repeat % whether the event is a repeat or not (if not, it will be removed after the first fire)
    end
    
    methods
        function obj = PCEvent(eventName, fireJudger, repeat)
            obj.eventName = eventName;
            obj.fireJudger = fireJudger;
            obj.repeat = repeat;
        end
        
    end
    
end
