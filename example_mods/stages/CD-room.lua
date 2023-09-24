function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'stage/CD-room/CD-room', -500, -300);
	setLuaSpriteScrollFactor('stageback', 0.9, 0.9);
	-- sprites that only load if Low Quality is turned off
	addLuaSprite('stageback', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end