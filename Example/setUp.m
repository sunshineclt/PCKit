function [ w, rect ] = setUp( isFullScreen )
% setup app
% @param isFullScreen is full screen mode or not

global SCREEN_SIZE_INCH VIEW_DISTANCE
SCREEN_SIZE_INCH = 13;
VIEW_DISTANCE = 60;
Screen('Preference', 'SkipSyncTests', 1);
InitializeMatlabOpenGL;
if (isFullScreen)
    [w, rect]=Screen('OpenWindow', 0, [0 0 0]);
else
    [w, rect]=Screen('OpenWindow', 0, [0 0 0], [0 0 400 400]);
end
Screen('TextFont', w, 'Calibri');
Screen('TextSize', w, 18);
%ListenChar(2);
%HideCursor;

end
