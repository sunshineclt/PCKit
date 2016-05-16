function [ fireJudger ] = PCTimeReachedFireJudgerBuilder( time )
% PCTIMEREACHEDFIREJUDGERBUILDER can build time reached fire judger for PCEvent
% @param time: after the timestamp the fireJudger return true

    function isReached = timeReachedFireJudger(runloopRef)
        isReached = GetSecs() - runloopRef.startTime > time;
    end

    fireJudger = @(runloopRef)timeReachedFireJudger(runloopRef);

end
