---like this
function onEvent(name, value1, value2)
    debugPrint(getPropertyFromClass('FlxG', width), getPropertyFromClass('FlxG', heigth))
	setPropertyFromClass('openfl.Lib','application.window.x', value1)
    setPropertyFromClass('openfl.Lib','application.window.y', value2) 
end