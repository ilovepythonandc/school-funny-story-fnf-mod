playDialogue = true;
function onStartCountdown()
	if isStoryMode then
		if playDialogue then
			setProperty("dad.visible", false)
			setProperty("boyfriend.visible", false)
			setProperty("iconP1.visible", false)
			setProperty("iconP2.visible", false)
			setProperty("healthBar.visible", false)
			triggerEvent('Camera Follow Pos', '300', '900')
			makeAnimatedLuaSprite("cutscenebf", "/cutscene/weekme/song1/bf", -500, 700);
			addAnimationByPrefix("cutscenebf", "song1a", "song1a",24,false)
			addAnimationByPrefix("cutscenebf", "song1b", "song1b",24,false)
			makeAnimatedLuaSprite("cutsceneme", "/cutscene/weekme/song1/me", 400, 350);
			addAnimationByPrefix("cutsceneme", "song1a", "song1a0000",24,false);
			addAnimationByPrefix("cutsceneme", "song1b", "song1a0001",24,false);
			doTweenX("x", "cutsceneme.scale", 1.2, 1, "quardease");
			doTweenY("y", "cutsceneme.scale", 1.2, 1, "quardease");
			makeLuaSprite("bg", "/stage/park", -700, -300);
			addLuaSprite("bg");
			addLuaSprite("cutscenebf");
			objectPlayAnimation('cutscenebf','song1a',false);
			runTimer("cutsceneTimer1", 10);

			return Function_Stop; --Prevents the song from starting naturally
		end
	end
	return Function_Continue; --Played video and dialogue, now the song can start normally
end
function onUpdate()
	if isStoryMode then
		if playDialogue then
			if keyJustPressed('accept')then
				cancelTimer("cutsceneTimer1")
				cancelTimer("cutsceneTimer2")
				cancelTimer("cutsceneTimer3")
				cancelTween("maskalpha")
				setProperty("mask.alpha", 0);
				removeLuaSprite("mask", true)
				removeLuaSprite("bg", true)
				objectPlayAnimation('cutsceneme','song1b',false)
				startDialogue('dialogue', 'breakfast');
				playDialogue = false;
			end
			makeLuaText("pressentertoskip", "Press Enter for Skip", 100, 0, 0)
			addLuaText("pressentertoskip")
		else 
			removeLuaText("pressentertoskip")
		end
	end
end
function onTimerCompleted(tag)
	--debugPrint(tag)
	if tag == "cutsceneTimer1" then
		removeLuaSprite("bg", true);
		objectPlayAnimation('cutsceneme','song1a',false);
		addLuaSprite("cutsceneme");
		makeLuaSprite('mask', '', -1000, -300);
		makeGraphic('mask', 5000, 5000, '000000');
		setProperty("mask.alpha", 90/100);
		addLuaSprite("mask", true);
		setProperty("cutscenebf.x", 1075);
		setProperty("cutscenebf.y", -640);
		objectPlayAnimation('cutscenebf','song1b',false);
		triggerEvent('Camera Follow Pos', '1300', '600');
		--setProperty("dad.visible", true);
		--setProperty("bf.visible", true);
		runTimer("cutsceneTimer2", 3);
		
	end
	if tag == "cutsceneTimer2" then
		triggerEvent('Camera Follow Pos', '900', '500');
		runTimer("cutsceneTimer3",2)
	end
	if tag == "cutsceneTimer3" then
		doTweenAlpha("maskalpha", "mask", 0, 0.5, 'cubeOut')
		objectPlayAnimation('cutsceneme','song1b',false);
	end
end
function onTweenCompleted(tag)
	if tag == "maskalpha" then
		removeLuaSprite("mask", true)
		
		startDialogue('dialogue', 'breakfast');
		playDialogue = false;
	end
end
function onNextDialogue(count)
	triggerEvent('Camera Follow Pos', '', '')
	setProperty('dad.visible', true);
	setProperty('boyfriend.visible', true);
	setProperty('cutscenebf.visible', false);
	setProperty('cutsceneme.visible', false);
end