function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'stage/outside/outside-tree', -500, -300);
	setLuaSpriteScrollFactor('stageback', 0.9, 0.9);
	
	makeLuaSprite('house', 'stage/outside/house', -800, -1000);
	setLuaSpriteScrollFactor('house', 0.9, 0.9);
	
	makeLuaSprite('Dark Mask', 'stage/outside/night-dark', -500, -300);
	setLuaSpriteScrollFactor('Dark Mask', 0.9, 0.9);
	
	makeAnimatedLuaSprite('stagesky', 'stage/outside/night-sky', -500, -600);
	addAnimationByPrefix('stagesky','flicker','flicker',24,true);

	--setLuaSpriteScrollFactor('stagesky', 0.9, 0.9);
	
	makeLuaSprite('stagefront', 'stage/outside/outside-floor', -500, -300);
	setLuaSpriteScrollFactor('stagefront', 0.9, 0.9);
	
	addLuaSprite('stagesky', false);
	addLuaSprite('stageback', false);
	addLuaSprite('stagefront', false);
	addLuaSprite('house', false);
	addLuaSprite('Dark Mask', true);
	objectPlayAnimation('stagesky','flicker',true);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end 