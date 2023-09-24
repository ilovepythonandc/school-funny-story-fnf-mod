
function onEvent(n,v1,v2)
	if n == 'Flash Camera' then
		if stringStartsWith(version, '0.6') then
			if getPropertyFromClass('ClientPrefs', 'flashing') == true then
				cameraFlash("game", v1, 0.5,true)
			end
		end
		if stringStartsWith(version, '0.7') then
			if getPropertyFromClass('backend.ClientPrefs', 'data.flashing') == true then
				cameraFlash("game", v1, 0.5,true);
			end
		end
	end
end 