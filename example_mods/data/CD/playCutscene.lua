playDialogue = true;
playVideo = true;
function onStartCountdown()
	if isStoryMode then
		if playVideo then
			startVideo('weekme-start');
			playVideo = false;
			return Function_Stop; --Prevents the song from starting naturally
		else if playDialogue then
			startDialogue('dialogue', 'breakfast');
			playDialogue = false;
			return Function_Stop; --Prevents the song from starting naturally
			end
		end
	end
	return Function_Continue; --Played video and dialogue, now the song can start normally
end