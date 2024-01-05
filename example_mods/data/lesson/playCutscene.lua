playDialogue = true;
function onStartCountdown()
	if isStoryMode then
		if playDialogue then
			triggerEvent("Camera Follow Pos", "1120", "490")
			
			return Function_Stop; --Prevents the song from starting naturally
		--else if playDialogue then
		--	startDialogue('dialogue', 'breakfast');
		--	playDialogue = false;
		--	return Function_Stop; --Prevents the song from starting naturally
		--	end
		end
	end
	return Function_Continue; --Played video and dialogue, now the song can start normally

end
function onTimerCompleted(tag, loops, loopsLeft)
	
end
function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end 