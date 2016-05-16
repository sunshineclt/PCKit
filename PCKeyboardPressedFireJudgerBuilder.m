function [ func ] = PCKeyboardPressedFireJudgerBuilder( key )
% KEYBOARDPRESSEDFIREJUDGER can build key pressed fire judger for PCEvent
% @param key: the key you want to listen
    keyCode = KbName(key);
    function isPressed = keyboardPressedFireJudger(runloopRef)
        [~, ~, KC] = KbCheck;
        isPressed = false;
        if KC(keyCode)
            isPressed = true; 
        end
    end
    func = @(runloopRef)keyboardPressedFireJudger(runloopRef);
end