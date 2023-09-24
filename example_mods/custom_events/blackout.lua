function onEvent(name, value1, value2)
	if name == 'blackout' then
		if value1 == 'blackout' then
			cameraFlash("game", 'ffffff', 0.7, true)
			makeLuaSprite('blackout', '', -1000, -300)
			makeGraphic('blackout', 5000, 5000, '000000')
			setScrollFactor('blackout', 0, 0)
			makeGraphic('blackout', 5000, 5000, '000000')
			setScrollFactor('blackout', 0, 0)
			doTweenAlpha('bfAlphaTwean', 'boyfriend', 0, 0.3, 'circleinout')
			doTweenAlpha('dadAlphaTwean', 'dad', 0, 0.3, 'circleinout')
			addLuaSprite('blackout', false)
			setObjectOrder('blackout', getObjectOrder('gfGroup')-1)
			blackout = true
		end
		if value1 == 'blackin' then
			cameraFlash("game", 'ffffff', 0.7, true)
			removeLuaSprite('blackout')
			doTweenAlpha('bfAlphaTwean', 'boyfriend', 100, 0.3, 'circleinout')
			doTweenAlpha('dadAlphaTwean', 'dad', 100, 0.3, 'circleinout')
			blackout = false
		end
		if value1 == 'bfout' then
			if blackout == true then
				cameraFlash("game", 'ffffff', 0.7, true)
				doTweenAlpha('dadinAlphaTwean', 'dad', 0, 0.1, 'circleinout')
				doTweenAlpha('bfoutAlphaTwean', 'boyfriend', 100, 0.1, 'circleinout')
			end
		end
		if value1 == 'dadout' then
			if blackout == true then
				cameraFlash("game", 'ffffff', 0.7, true)
				doTweenAlpha('dadoutAlphaTwean', 'dad', 100, 0.1, 'circleinout')
				doTweenAlpha('bfinAlphaTwean', 'boyfriend', 0, 0.1, 'circleinout')
			end
		end
	end
end