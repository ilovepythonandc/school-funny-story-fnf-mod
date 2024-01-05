playDialogue = true;
function onStartCountdown()
	--if isStoryMode then
		if playDialogue then
			--startDialogue('dialogue', 'breakfast');
			--playDialogue = false;
			setProperty("bf.visible", false)
			makeAnimatedLuaSprite("cutscenebf", "/cutscene/weekme/song2/bf", 1075-1652, -640);
			addAnimationByPrefix("cutscenebf", "song2a", "song2a",24,false);
			addAnimationByPrefix("cutscenebf", "song2b", "song2b",24,false);
			addAnimationByPrefix("cutscenebf", "song2c", "song2c",24,false);
			addAnimationByPrefix("cutscenebf", "song2d", "song2d",24,false);
			addLuaSprite("cutscenebf");
			objectPlayAnimation("cutscenebf", "song2a");
			triggerEvent('Camera Follow Pos', '1300', '600');
			runTimer("cutsceneTimer1", 4);
			return Function_Stop; --Prevents the song from starting naturally
		end
	--end
	return Function_Continue; --Played video and dialogue, now the song can start normally
end
fucntion onTimerCompleted(tag)
	if tag == "cutsceneTimer1" then
		triggerEvent('Camera Follow Pos', '900', '500');
		runTimer("cutsceneTimer2", 4);
	end
	if tag == "cutsceneTimer2" then
		triggerEvent("Camera Follow Pos", '1100', '500')
	end
end
function onSkipDialogue(line)
	debugPrint(line)
end