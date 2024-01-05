playDialogue = true;
normal_leg_x = -110+625;
go_into_BODY = 1000;
go_into_LEGS = normal_leg_x-550;
luaDebugMode = true;
function onStartCountdown()
    if isStoryMode then
        if playDialogue then
            debugPrint(defaultBoyfriendX)
            setProperty("boyfriend.x", go_into_BODY);
            setProperty("lijiatianleg.x", go_into_LEGS);
            doTweenX("lijiatian come X1", "boyfriend", getCharacterX("boyfriend")+defaultBoyfriendX, 4.5, "QuardOut");
            doTweenX("lijiatian come X2", "lijiatianleg", normal_leg_x , 4.5, "QuardOut");
            --startDialogue('dialogue', 'breakfast');
            --playDialogue = false;
            return Function_Stop
        end
    end
    return Function_Continue
end

function onUpdate()
    if isStoryMode then
        if playDialogue then
            if keyJustPressed('accept')then
                cancelTween("lijiatian come X1");
                cancelTween("lijiatian come X2");
                setProperty("boyfriend.x", getCharacterX("boyfriend")+defaultBoyfriendX);
                setProperty("lijiatianleg.x", normal_leg_x);
                startDialogue('dialogue', 'breakfast');
                playDialogue = false;
            end
            makeLuaText("pressentertoskip", "Press Enter for Skip", 100, 0, 0);
            addLuaText("pressentertoskip");
        else 
            removeLuaText("pressentertoskip");
        end
    end
end

function onTweenCompleted(tag)
    if tag == "lijiatian come X1" then
        startDialogue('dialogue', 'breakfast');
		playDialogue = false;
    end
end
function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end 