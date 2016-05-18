classdef PCOval < handle
    % PCOVAL is a class taking control of an oval object
    
    properties
        size   % the size of the oval
        center % the center point of the oval
        color  % the color of the oval(e.g. [255 255 255])
        w      % the screen pointer to be drawn
    end
    
    methods
        function obj = PCOval(w, height, width, color)
            obj.w = w;
            if nargin == 2
                width = height;
                color = [255, 255, 255];
            elseif nargin == 3
                color = [255 255 255];
            end
            obj.size = PCSize(height, width);
            obj.color = color;
        end
        
        function draw(obj)
            Screen('FillOval', obj.w, obj.color,...
                                     [obj.center.x - obj.size.width / 2,...
                                      obj.center.y - obj.size.height / 2,...
                                      obj.center.x + obj.size.width / 2,...
                                      obj.center.y + obj.size.height / 2]);
        end
       
        function isContain = contains(obj, point)
            isContain = sqrt(power(obj.center.x - point.x, 2) + ...
                    power(obj.center.y - point.y, 2))...
                    < obj.size.width / 2;
        end
        
    end
    
end

