classdef PCSize < handle
    % PCSIZE is a size class :) nothing to say
    
    properties
        width
        height
    end
    
    methods
        function obj = PCSize(width, height)
            obj.width = width;
            obj.height = height;
        end
    end
    
end

