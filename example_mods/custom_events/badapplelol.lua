function onEvent(name, value1, value2)
	if name == 'badapplelol' then
		if value1 == 'a' then
			cameraFlash("game", 'ffffff', 0.7, true)
			makeLuaSprite('whitebg', '', -1000, -300)
			makeGraphic('whitebg',5000,5000,'ffffff')
			setScrollFactor('whitebg', 0, 0)
			addLuaSprite('whitebg', false)
			setProperty('boyfriend.color', '000000')
			setProperty('leg.color', '000000')
			setProperty('stagemask.alpha', 0)
			setProperty('stagemask1.alpha', 0)
			setProperty('students.alpha', 0)
			setProperty('students1.alpha', 0)
			setProperty('dad.color', '000000')
			setProperty('gf.color', '000000')
		else
			cameraFlash("game", 'ffffff', 0.7, true)
			removeLuaSprite('whitebg')
			setProperty('stagemask.alpha', 100)
			setProperty('stagemask1.alpha', 100)
			setProperty('students.alpha', 100)
			setProperty('students1.alpha', 100)
			setProperty('leg.color', getColorFromHex('FFFFFF'))
			setProperty('boyfriend.color', getColorFromHex('FFFFFF'))
			setProperty('dad.color', getColorFromHex('FFFFFF'))
			setProperty('gf.color', getColorFromHex('FFFFFF'))
		end
	end
end