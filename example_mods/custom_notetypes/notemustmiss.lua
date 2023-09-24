function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'notemustmiss' then
		addMisses(1)
		if direction == 0 then
			value = 'LEFT'
		end
		if direction == 1 then
			value = 'DOWN'
		end
		if direction == 2 then
			value = 'UP'
		end
		if direction == 3 then
			value = 'RIGHT'
		end
		characterPlayAnim('boyfriend', 'sing'..value..'miss', true)
	end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'notemustmiss' then
		if direction == 0 then
			value = 'LEFT'
		end
		if direction == 1 then
			value = 'DOWN'
		end
		if direction == 2 then
			value = 'UP'
		end
		if direction == 3 then
			value = 'RIGHT'
		end
		characterPlayAnim('dad', 'sing'..value..'miss', true)
	end
end
