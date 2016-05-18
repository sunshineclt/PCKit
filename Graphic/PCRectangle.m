classdef PCRectangle
    % PCRECTANGLE is a class taking control of an rectangle object
    
    properties
        size   % the size of the rectangle
        center % the center point of the rectangle
        color  % the color of the rectangle(e.g. [255 255 255])
        w      % the screen pointer to be drawn
    end
    
    methods
        function obj = PCRectangle(w, height, width, color)
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
            Screen('FillRect', obj.w, obj.color,...
                                     [obj.center.x - obj.size.width / 2,...
                                      obj.center.y - obj.size.height / 2,...
                                      obj.center.x + obj.size.width / 2,...
                                      obj.center.y + obj.size.height / 2]);
        end
       
        function isContain = contains(obj, point)
            isContain = (abs(obj.center.x - point.x) <= obj.size.width / 2)...
                     && (abs(obj.center.y - point.y) <= obj.size.height / 2);
        end
    end
    
end

