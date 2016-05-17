classdef PCRunloop < handle
    % PCRUNLOOP is a class that take control of whole application
    % PCRunloop is the core in PCKit
    % when using PCRunloop, you need to register event in PCRunloop ...
    % instance, and then call the run() method, the PCRunloop will ...
    % automatically check every registered events in every loop and call...
    % the callback when one events' fireJudger() return true.
    % notice: you can register more than one callback within one event by
    % calling register using the same event and different callback.
    % Actually as long as the event's name is the same, the PCRunloop
    % treats them as the same event even if the fireJudger is different(the
    % first fireJudger will be recorded)
    
    properties
        startTime % the runloop's start time
        eventArray % registered event and callback are saved here
                   % every row's first column is the event
                   % the rest column is the event's callback
        endJudger
    end
    
    methods
        function obj = PCRunloop(endJudger)
            obj.startTime = GetSecs();
            obj.eventArray = {};
            obj.endJudger = endJudger;
        end
        
        function register(obj, event, callback)
            found = false;
            for eventIndex = 1:size(obj.eventArray, 1)
                if strcmp(obj.eventArray{eventIndex, 1}.eventName, event.eventName) == 1
                    found = true;
                    hasAdded = false;
                    for callbackIndex = 2:size(obj.eventArray, 2)
                        if ~isa(obj.eventArray{eventIndex, callbackIndex}, 'function_handle')
                            hasAdded = true;
                            obj.eventArray{eventIndex, callbackIndex} = callback;
                            break;
                        end
                    end
                    if ~hasAdded
                        obj.eventArray{eventIndex, size(obj. eventArray, 2) + 1} = callback;
                    end
                    break;
                end
            end
            if ~found
                obj.eventArray{size(obj.eventArray, 1) + 1, 1} = event;
                obj.eventArray{size(obj.eventArray, 1), 2} = callback;
            end
        end
        
        function run(obj)
            while ~obj.endJudger(obj)
                eventIndex = 1;
                while eventIndex <= size(obj.eventArray, 1)
                    event = obj.eventArray{eventIndex, 1};
                    if event.fireJudger(obj)
                        callbackIndex = 2;
                        while callbackIndex <= size(obj.eventArray, 2) && isa(obj.eventArray{eventIndex, callbackIndex}, 'function_handle')
                            obj.eventArray{eventIndex, callbackIndex}();
                            callbackIndex = callbackIndex + 1;
                        end
                        if ~obj.eventArray{eventIndex, 1}.repeat
                            obj.eventArray(eventIndex, :) = [];
                        end
                    end
                    eventIndex = eventIndex + 1;
                end
            end
        end
    end
    
end
