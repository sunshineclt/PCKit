classdef PCPoint < handle
    % PCPOINT is a point class :) nothing to say
    
    properties
        x % the point's x coord
        y % the point's y coord
    end
    
    methods
        function obj = PCPoint(x, y)
            obj.x = x;
            obj.y = y;
        end
        
        function move(obj, deltaX, deltaY, needRegulated)
            if nargin == 3
                needRegulated = true;
            end
            obj.x = obj.x + deltaX;
            obj.y = obj.y + deltaY;
            if needRegulated
                regular(obj);
            end
        end
    end
    
    methods (Access = private)
        function regular(obj)
            [width, height] = Screen('WindowSize', 0);
            while obj.x < 0
                obj.x = obj.x + width;
            end
            while obj.y < 0
                obj.y = obj.y + height;
            end
            while obj.x > width
                obj.x = obj.x - width;
            end
            while obj.y > height
                obj.y = obj.y - height;
            end
        end
    end
    
end

