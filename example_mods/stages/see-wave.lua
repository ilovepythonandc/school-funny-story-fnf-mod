dobfTween=0
dodadTween=0
function onUpdate()
	if stringStartsWith(version, '0.6') then
		framemultiple = getPropertyFromClass('ClientPrefs', 'framerate')/60
	end
	if stringStartsWith(version, '0.7') then 
		framemultiple = getPropertyFromClass('backend.ClientPrefs', 'data.framerate')/60
	end
	setProperty('sea.x',getProperty('sea.x') - 55/framemultiple)
	setProperty('sea1.x',getProperty('sea1.x') - 55/framemultiple)
	setProperty('cloud1.x',getProperty('cloud1.x') - 35/framemultiple)
	setProperty('cloud2.x',getProperty('cloud2.x') - 35/framemultiple)
	
	if getProperty('sea.x') <= -1550 and getProperty('sea.x') >= -2000 then
		if dobfTween==0 then 
			dobfTween=1;
			doTweenY('bfposY', 'boyfriend', 100, 0.2, 'circInOut');
		end
	end
	if getProperty('sea.x') <= 1975 and getProperty('sea.x') >= 985 then
		if dodadTween==0 then 
			dodadTween=1;
			doTweenY('dadposY', 'dad', 90, 0.2, 'circInOut');
		end
	end
	if getProperty('sea1.x') <= -3060 then
		setProperty('sea1.x', 2030);
	end
	if getProperty('sea.x') <= -3060 then
		setProperty('sea.x', 2030);
	end
	if getProperty('cloud1.x') <= -3060 then
		setProperty('cloud1.x', -500);
		setProperty('cloud2.x', 2060);
	end
end

function onCreate()
	makeLuaSprite('sky', 'stage/skling/sky', -500, -300);
	setLuaSpriteScrollFactor('sky', 0, 0);
	makeLuaSprite('sky-night', 'stage/skling/sky-night', -500, -300);
	setLuaSpriteScrollFactor('sky-night', 0.114514, 0.114514);
	makeLuaSprite('sun', 'stage/skling/sun', -500, -300);
	setLuaSpriteScrollFactor('sun', 0.9, 0.9);
	makeLuaSprite('moon', 'stage/skling/moon', -500, 800);
	setLuaSpriteScrollFactor('sun', 0.9, 0.9);
	makeLuaSprite('sea', 'stage/skling/sea', -500, -200);
	setLuaSpriteScrollFactor('seewave', 0.9, 0.9);
	makeLuaSprite('sea1', 'stage/skling/sea-wave', 2060, -200);
	setLuaSpriteScrollFactor('seewave1', 0.9, 0.9);
	makeLuaSprite('cloud1', 'stage/skling/cloud1', -500, -300);
	setLuaSpriteScrollFactor('cloud1', 0.9, 0.9);
	makeLuaSprite('cloud2', 'stage/skling/cloud2', 2060, -300);
	setLuaSpriteScrollFactor('cloud2', 0.9, 0.9);
	addLuaSprite('sky-night',false)
	addLuaSprite('sky',false)
	addLuaSprite('moon',false)
	addLuaSprite('sun',false)
	addLuaSprite('sea',false)
	addLuaSprite('sea1',false)
	addLuaSprite('cloud2',false)
	addLuaSprite('cloud1',false)
end
function onEndSong()
	close(true)-- For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end
function onTweenCompleted(tag)
	if tag == 'bfposY' then
		doTweenY('bfposYdown', 'boyfriend', 640, 0.2, 'cubeOut');
	end
	if tag == 'bfposYdown' then
		dobfTween=0;
	end
	if tag == 'dadposY' then
		doTweenY('dadposYdown', 'dad', 720, 0.2, 'cubeOut');
	end
	if tag == 'dadposYdown' then
		dodadTween=0;
	end
	if tag == 'sunY' then
		doTweenY('moonY', 'moon', -300, 0.7, 'circInOut')
	end
end
times=0
function onBeatHit()
	if times == 8 then
		times = 0;
		triggerEvent('Add Camera Zoom', '1', '');
	else
		times=times+1;
	end
end
function onEvent(name, value1, value2)
	if name == 'to night' then
		doTweenAlpha('skyAlpha', 'sky', 0, 0.5, 'linear')
		doTweenY('sunY', 'sun', 800, 0.7, 'circInOut')
		doTweenAlpha('cloud1Alpha', 'cloud1', 0, 0.5, 'linear')
		doTweenAlpha('cloud2Alpha', 'cloud2', 0, 0.5, 'linear')
	end
end