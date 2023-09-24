function onCreate()
	makeLuaSprite('stageback', 'stage/classroom/stageback', -450, 0);
	makeLuaSprite('stagefront', 'stage/classroom/stagefront', -1050, 400);
	makeLuaSprite('stagewall', 'stage/classroom/stagewall', 1600, 0);
	for i=1, 4 do
		makeAnimatedLuaSprite('table'..i, 'stage/classroom/table', 200+(i*200), 300);
		addAnimationByPrefix('table'..i, 'beathit', 'beat hit', 24, false)
	end
	for i=5, 8 do
		makeAnimatedLuaSprite('table'..i, 'stage/classroom/table', 100+((i-4)*200), 450);
		addAnimationByPrefix('table'..i, 'beathit', 'beat hit', 24, false)
	end
	for i=9, 10 do
		makeAnimatedLuaSprite('table'..i, 'stage/classroom/table', 1200+((i-8)*200), 300);
		addAnimationByPrefix('table'..i, 'beathit', 'beat hit', 24, false)
	end
	for i=11, 12 do
		makeAnimatedLuaSprite('table'..i, 'stage/classroom/table', 1100+((i-10)*200), 450);
		addAnimationByPrefix('table'..i, 'beathit', 'beat hit', 24, false)
	end

	addLuaSprite('stageback',false)
	addLuaSprite('stagewall',false)
	addLuaSprite('stagefront',false)
	for i=1, 12 do
		addLuaSprite('table'..i, false)
	end
end
function onBeatHit()
	for i=1, 12 do
		objectPlayAnimation('table'..i, 'beathit', true)
	end
end