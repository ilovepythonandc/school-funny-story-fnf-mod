playDialogue = true;
function onStartCountdown()
	if isStoryMode then
		if playDialogue then
			startDialogue('dialogue', 'breakfast');
			playDialogue = false;
			return Function_Stop; --Prevents the song from starting naturally
		end
	end
	return Function_Continue; --Played video and dialogue, now the song can start normally
end