package options;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

import backend.Paths;
import backend.ClientPrefs;


class FullscreenSetSubState extends MusicBeatState
{
	public var text:FlxText;
	public var bg:FlxSprite = new FlxSprite();
	override public function create()
	{
		bg.loadGraphic(Paths.image('menuOptin'));
		switch(ClientPrefs.data.BGcolor){
			case "ORANGE" :bg.color = 0xFFFFA500;
			case "GREEN"  :bg.color = 0xFF008000;
			case "BROWN"  :bg.color = 0xFF8B4513;
			case "MAGENTA":bg.color = 0xFFFF00FF;
			case "BLUE"   :bg.color = 0xFF0000FF;
			case "WHITE"  :bg.color = 0xFFFFFFFF;
			case "CYAN"   :bg.color = 0xFF00FFFF;
			case "PINK"   :bg.color = 0xFFFFC0CB;
			case "PURPLE" :bg.color = 0xFF800080;
			case "RED"    :bg.color = 0xFFFF0000;
			case "YELLOW" :bg.color = 0xFFFFFF00;
			case "LIME"   :bg.color = 0xFF00FF00;
		}
		add(bg);
		text = new FlxText(0, 0, 0, 'Press F11 \nfor fullscreen');
		text.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER);
		text.screenCenter();
		add(text);
		trace(FlxG.camera.zoom);
		FlxG.camera.zoom = 1.15;
		onTween2over(null);
		super.create();
	}
	function onTween1over(tween:FlxTween){
		FlxG.camera.zoom = 1.15;
		FlxG.camera.angle = -20;
		FlxTween.tween(FlxG.camera, {angle:0, zoom:1}, 2.5, {ease: FlxEase.quadOut,onComplete: onTween2over});
	}
	function onTween2over(tween:FlxTween){
		FlxG.camera.zoom = 1.15;
		FlxG.camera.angle = 20;
		FlxTween.tween(FlxG.camera, {angle:0, zoom:1}, 2.5, {ease: FlxEase.quadOut,onComplete: onTween1over});
	}
	override public function update(elapsed:Float){
		if (FlxG.keys.anyJustReleased([F11])){
			FlxG.fullscreen = !FlxG.fullscreen;
		}
		if (controls.BACK)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new OptionsState());
			}
	}
}