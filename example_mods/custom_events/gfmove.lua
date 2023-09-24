function onEvent(name,value1,value2)
  	if name == 'gfmove' then
		doTweenX('posX', 'gf', value1, 1, 'cubeOut');
		doTweenY('posY', 'gf', value2, 1, 'cubeOut');
  	end
end