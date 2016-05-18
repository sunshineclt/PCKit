classdef PCFixationPoint < handle
    % PCFIXATIONPOINT is a class taking control of fixation point
    
    properties
        size   % the size of the fixation point
        center % the center point of the fixation point
        color  % the color of the fixation point(e.g. [255 255 255])
        penWidth % the fixation point's width
        w      % the screen pointer to be drawn
        type   % the type of fixation point
    end
    
    methods
        function obj = PCFixationPoint(w, width, height, type, color, penWidth)
            if nargin == 2
                height = width;
                type = PCFixationPointType.cross;
                color = [255, 255, 255];
                penWidth = 5;
            elseif nargin == 3
                type = PCFixationPointType.cross;
                color = [255, 255, 255];
                penWidth = 5;
            elseif nargin == 4
                color = [255, 255, 255];                
                penWidth = 5;
            elseif nargin == 5
                penWidth = 5;                
            end
            obj.w = w;
            obj.size = PCSize(width, height);
            obj.type = type;
            obj.color = color;
            obj.penWidth = penWidth;
        end
        
        function draw(obj)
            if obj.type == PCFixationPointType.cross
                Screen('DrawLine', obj.w, obj.color,...
                                          obj.center.x - obj.size.width / 2,...
                                          obj.center.y,...
                                          obj.center.x + obj.size.width / 2,...
                                          obj.center.y,...
                                          obj.penWidth);
                Screen('DrawLine', obj.w, obj.color,...
                                          obj.center.x,...
                                          obj.center.y - obj.size.height / 2,...                                  
                                          obj.center.x,...
                                          obj.center.y + obj.size.height / 2,...                                  
                                          obj.penWidth);     
            elseif obj.type == PCFixationPointType.oval
                Screen('FillOval', obj.w, obj.color,...
                         [obj.center.x - obj.size.width / 2,...
                          obj.center.y - obj.size.height / 2,...
                          obj.center.x + obj.size.width / 2,...
                          obj.center.y + obj.size.height / 2]);
            else
                error('Unknown Fixation Point Type');
            end
        end
        
    end
    
end

