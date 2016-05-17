function main()
    [w, wrect] = setUp(false);
    global SCREEN_SIZE_INCH VIEW_DISTANCE
    
    fixationPoint = PCFixationPoint(w, PCdeg2pix(0.5, SCREEN_SIZE_INCH, VIEW_DISTANCE),...
        PCdeg2pix(0.5, SCREEN_SIZE_INCH, VIEW_DISTANCE), PCFixationPointType.oval);
    fixationPoint.center = PCPoint(wrect(3) / 2, wrect(4) / 2);    
    oval = PCOval(w, PCdeg2pix(2, SCREEN_SIZE_INCH, VIEW_DISTANCE));
    oval.center = PCPoint(0, 0);
    
    % initialize PCRunloop
    runloop = PCRunloop(@(obj)GetSecs()-obj.startTime>5, @()closeDown);
    % initialize PCEvent
    zPressed = PCEvent('zPressed',PCKeyboardPressedFireJudgerBuilder('z'),true);
    % register zPressedEvent
    zPressCount = 0;
    function zPressedCallback()
        zPressCount = zPressCount + 1;
        DrawFormattedText(w, sprintf('z has been pressed %d times', zPressCount), 'center', 'center', [255 255 255]);
        oval.draw();
        fixationPoint.draw();
        Screen('Flip', w);
    end
    runloop.register(zPressed, @()zPressedCallback);
    % initialize PCEvent
    escPressed = PCEvent('escPressed', PCKeyboardPressedFireJudgerBuilder('escape'), false);
    function forceQuit()
        runloop.forceEndFlag = true;
    end
    % register escPressedEvent
    runloop.register(escPressed, @()forceQuit);
    second1Reached = PCEvent('1sReached', PCTimeReachedFireJudgerBuilder(1),false);
    second2Reached = PCEvent('2sReached', PCTimeReachedFireJudgerBuilder(2),false);
    runloop.register(second1Reached, @()draw);
    function draw()
        fixationPoint.draw();
        oval.draw();
        Screen('Flip', w);
    end
    runloop.register(second2Reached, @()moveAndDraw);
    function moveAndDraw()
        fixationPoint.center.move(50, 50);
        fixationPoint.draw();
        Screen('Flip', w);
    end
    runloop.run();
end

