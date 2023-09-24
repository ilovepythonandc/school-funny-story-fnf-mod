function onCreate()
	makeAnimatedLuaSprite('leg', 'characters/lijiatian-run-leg', getProperty('boyfriend.x')-1020, getProperty('boyfriend.y')-50);
	addAnimationByPrefix('leg','run','runleg',60,true)
	addLuaSprite('leg',false)
	setObjectOrder('leg',getObjectOrder('boyfriendGroup')-1)
	objectPlayAnimation('leg','run',true);
end