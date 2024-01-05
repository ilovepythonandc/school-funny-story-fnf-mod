time=0
function onUpdate()
	if stringStartsWith(version, '0.6') then
		framemultiple = getPropertyFromClass('ClientPrefs', 'framerate')/60
	end
	if stringStartsWith(version, '0.7') then 
		framemultiple = getPropertyFromClass('backend.ClientPrefs', 'data.framerate')/60
	end
	setProperty('understageback.x',getProperty('understageback.x') - 0.01/framemultiple)
	setProperty('stageback.x',getProperty('stageback.x') - 65/framemultiple)
	setProperty('stagefront.x',getProperty('stagefront.x') - 65/framemultiple)
	setProperty('stagemask.x',getProperty('stagemask.x') - 65/framemultiple)
	setProperty('students.x',getProperty('students.x') - 65/framemultiple)
	setProperty('stageback1.x',getProperty('stageback1.x') - 65/framemultiple)
	setProperty('stagefront1.x',getProperty('stagefront1.x') - 65/framemultiple)
	setProperty('stagemask1.x',getProperty('stagemask1.x') - 65/framemultiple)
	setProperty('students1.x',getProperty('students1.x') - 65/framemultiple)
	if getProperty('stageback.x') <= -3060 then 
		setProperty('stageback.x', -500)
		setProperty('stagefront.x', -500)
		setProperty('stagemask.x', -500)
		setProperty('students.x', -500)
	end
	if getProperty('stageback1.x') <= -500 then 
		setProperty('stageback1.x', 2060)
		setProperty('stagefront1.x', 2060)
		setProperty('stagemask1.x', 2060)
		setProperty('students1.x', 2060)
	end
end

function onBeatHit()
	if time == 0 then
		time=time+1;
		objectPlayAnimation('students','beathit',true);
	else
		time=0;
		objectPlayAnimation('students1','beathit',true);
	end
end

function onCreate()
	makeLuaSprite('understageback', 'stage/teaching-bliuding/school', -500, -300);

	makeLuaSprite('stageback', 'stage/teaching-bliuding/wall', -500, -300);
	setLuaSpriteScrollFactor('stageback', 0.9, 0.9);


	makeLuaSprite('stagefront', 'stage/teaching-bliuding/floor', -500, -300);
	setLuaSpriteScrollFactor('stagefront', 0.9, 0.9);
	
	makeLuaSprite('stagemask', 'stage/teaching-bliuding/classroom-wall', -500, -300);
	setLuaSpriteScrollFactor('stagemask', 0.9, 0.9);
	
	makeAnimatedLuaSprite('students', 'stage/teaching-bliuding/students', -500, -300);
	addAnimationByPrefix('students', 'beathit', 'beathit', 24, false);
	setLuaSpriteScrollFactor('students', 0.9, 0.9);

	makeLuaSprite('stageback1', 'stage/teaching-bliuding/wall', 2060, -280);
	setLuaSpriteScrollFactor('stageback', 0.9, 0.9);

	makeLuaSprite('stagefront1', 'stage/teaching-bliuding/floor', 2060, -280);
	setLuaSpriteScrollFactor('stagefront', 0.9, 0.9);
	
	makeLuaSprite('stagemask1', 'stage/teaching-bliuding/classroom-wall', 2060, -279);
	setLuaSpriteScrollFactor('stagemask', 0.9, 0.9);
	
	makeAnimatedLuaSprite('students1', 'stage/teaching-bliuding/students', 2060, -280);
	addAnimationByPrefix('students1', 'beathit', 'beathit', 24, false);
	setLuaSpriteScrollFactor('students1', 0.9, 0.9);
	
	addLuaSprite('understageback', false);
	addLuaSprite('stageback', false);
	addLuaSprite('stagefront', false);
	addLuaSprite('stagemask', true);
	addLuaSprite('students', true);
	addLuaSprite('stageback1', false);
	addLuaSprite('stagefront1', false);
	addLuaSprite('stagemask1', true);
	addLuaSprite('students1', true);
	objectPlayAnimation('leg','run',true);
	objectPlayAnimation('students','beathit',true);
	
end
function onEndSong()
	close(true)-- For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end
