function onEvent(name, value1, value2)
	if name == "three" then
		--playSound('intro3')
		makeLuaSprite('three', 'three', 250, 200)
		setScrollFactor('three', 0, 0)
		addLuaSprite('three',true)
		doTweenAlpha('threeAlphaTween', 'three', 0, 0.5, 'cubeOut')
	end
	if name == "two" then
		--playSound('intro2')
		makeLuaSprite('two', 'ready', 250, 200)
		setScrollFactor('two', 0, 0)
		addLuaSprite('two',true)
		doTweenAlpha('twoAlphaTween', 'two', 0, 0.5, 'cubeOut')
	end
	if name == "one" then
		--playSound('intro1')
		makeLuaSprite('one', 'set', 250, 200)
		setScrollFactor('one', 0, 0)
		addLuaSprite('one',true)
		doTweenAlpha('oneAlphaTween', 'one', 0, 0.5, 'cubeOut')
	end
	if name == "go" then
		--playSound('introGo')
		makeLuaSprite('go', 'go', 300, 150)
		setScrollFactor('go', 0, 0)
		addLuaSprite('go',true)
		doTweenAlpha('goAlphaTween', 'go', 0, 0.5, 'cubeOut')
	end
end

function onTweenCompleted(tag)
	if tag == 'threeAlphaTween' then
		removeLuaSprite('three')
	end
	if tag == 'twoAlphaTween' then
		removeLuaSprite('two')
	end
	if tag == 'oneAlphaTween' then
		removeLuaSprite('one')
	end
	if tag == 'goAlphaTween' then
		removeLuaSprite('go')
	end
end