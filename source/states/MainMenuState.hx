package states;

import haxe.macro.Expr.Case;
import flixel.addons.display.shapes.FlxShape;
import flixel.addons.display.shapes.FlxShapeSquareDonut;
import flixel.graphics.FlxGraphic;
import flixel.math.FlxRandom;
import objects.Character;
import backend.Achievements;

import flixel.FlxObject;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;

import flixel.input.keyboard.FlxKey;
import lime.app.Application;

import objects.AchievementPopup;
import states.editors.MasterEditorMenu;
import options.OptionsState;


class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.7.1h'; //This is also used for Discord RPC
	public static var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;
	
	var optionShit:Array<String> = [
		'story_mode',
		'freeplay',
		#if ACHIEVEMENTS_ALLOWED 'awards', #end
		'credits', 
		'options'
	];

	var bgflicker:FlxSprite;
	var camFollow:FlxObject;

	private var menuCharacter:Character = null;
	private var menuCharacterIsBf:Bool = false;
	private var menuCharacterName:String = "";
	private var menuCharacterScale:Float = 0;
	private var menuCharacterOffsetX:Int = 0;
	private var menuCharacterOffsetY:Int = 0;


	override function create()
	{
		#if MODS_ALLOWED
		Mods.pushGlobalMods();
		#end
		Mods.loadTopMod();

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camAchievement, false);
		FlxG.cameras.setDefaultDrawTarget(camGame, true);

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var yScroll:Float = Math.max(0.25 - (0.05 * (optionShit.length - 4)), 0.1);

		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		bg.antialiasing = ClientPrefs.data.antialiasing;
		bg.scrollFactor.set(0, yScroll);
		bg.setGraphicSize(Std.int(bg.width * 1.175));
		bg.updateHitbox();
		bg.screenCenter();
		add(bg);

		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);

		bgflicker = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		bgflicker.antialiasing = ClientPrefs.data.antialiasing;
		bgflicker.scrollFactor.set(0, yScroll);
		bgflicker.setGraphicSize(Std.int(bgflicker.width * 1.175));
		bgflicker.updateHitbox();
		bgflicker.screenCenter();
		bgflicker.visible = false;
		trace(ClientPrefs.data.BGcolor);
		//'ORANGE', 'GREEN', 'BROWN', 'MAGENTA', "BLUE", "WHITE", "CYAN", "PINK", "PURPLE", "RED", "YELLOW", "LIME"
		switch(ClientPrefs.data.BGcolor){
			case "ORANGE" :bgflicker.color = 0xFFFFA500;
			case "GREEN"  :bgflicker.color = 0xFF008000;
			case "BROWN"  :bgflicker.color = 0xFF8B4513;
			case "MAGENTA":bgflicker.color = 0xFFFF00FF;
			case "BLUE"   :bgflicker.color = 0xFF0000FF;
			case "WHITE"  :bgflicker.color = 0xFFFFFFFF;
			case "CYAN"   :bgflicker.color = 0xFF00FFFF;
			case "PINK"   :bgflicker.color = 0xFFFFC0CB;
			case "PURPLE" :bgflicker.color = 0xFF800080;
			case "RED"    :bgflicker.color = 0xFFFF0000;
			case "YELLOW" :bgflicker.color = 0xFFFFFF00;
			case "LIME"   :bgflicker.color = 0xFF00FF00;
		}
		add(bgflicker);
		
		// magenta.scrollFactor.set();

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var scale:Float = 1;
		/*if(optionShit.length > 6) {
			scale = 6 / optionShit.length;
		}*/

		for (i in 0...optionShit.length)
		{
			var offset:Float = 108 - (Math.max(optionShit.length, 4) - 4) * 80;
			var menuItem:FlxSprite = new FlxSprite(0, (i * 140)  + offset);
			menuItem.antialiasing = ClientPrefs.data.antialiasing;
			menuItem.scale.x = scale;
			menuItem.scale.y = scale;
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[i]);
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			menuItem.x = 100;
			menuItems.add(menuItem);
			var scr:Float = (optionShit.length - 4) * 0.135;
			if(optionShit.length < 6) scr = 0;
			menuItem.scrollFactor.set(0, scr);
			//menuItem.setGraphicSize(Std.int(menuItem.width * 0.58));
			menuItem.updateHitbox();
		}
		var rd:FlxRandom = new FlxRandom();
		switch (rd.int(0, 3)){
			case 0:
				menuCharacterName = "xiaozirui";
				menuCharacterScale = 0.4;
				menuCharacterIsBf = false;
				menuCharacterOffsetX = 480;
				menuCharacterOffsetY = 150;
			case 1:
				menuCharacterName = "me";
				menuCharacterScale = 0.5;
				menuCharacterIsBf = false;
				menuCharacterOffsetX = 450;
				menuCharacterOffsetY = 200;
			case 2:
				menuCharacterName = "lijiatian";
				menuCharacterScale = 0.3;
				menuCharacterIsBf = true;
				menuCharacterOffsetX = 450;
				menuCharacterOffsetY = 100;
			case 3:
				menuCharacterName = "zenben";
				menuCharacterScale = 0.3;
				menuCharacterIsBf = false;
				menuCharacterOffsetX = 600;
				menuCharacterOffsetY = 200;
		}
		//menuCharacter.x = menuCharacter.x - 100;
		menuCharacter = new Character(0, 0, menuCharacterName, menuCharacterIsBf);
		menuCharacter.setGraphicSize(Std.int(menuCharacter.width* menuCharacterScale));
		menuCharacter.screenCenter();
		menuCharacter.x += menuCharacterOffsetX;
		menuCharacter.y += menuCharacterOffsetY;
		menuCharacter.visible = true;
		add(menuCharacter);
		

		var versionShit:FlxText = new FlxText(12, FlxG.height - 44, 0, "Psych Engine v" + psychEngineVersion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(12, FlxG.height - 24, 0, "Friday Night Funkin' v" + Application.current.meta.get('version'), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(12, FlxG.height - 64, 0, "School Funny Story v0.6.0", 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		// NG.core.calls.event.logEvent('swag').send();

		changeItem();

		#if ACHIEVEMENTS_ALLOWED
		Achievements.loadAchievements();
		var leDate = Date.now();
		if (leDate.getDay() == 5 && leDate.getHours() >= 18) {
			var achieveID:Int = Achievements.getAchievementIndex('friday_night_play');
			if(!Achievements.isAchievementUnlocked(Achievements.achievementsStuff[achieveID][2])) { //It's a friday night. WEEEEEEEEEEEEEEEEEE
				Achievements.achievementsMap.set(Achievements.achievementsStuff[achieveID][2], true);
				giveAchievement();
				ClientPrefs.saveSettings();
			}
		}
		#end

		super.create();
	}

	#if ACHIEVEMENTS_ALLOWED
	// Unlocks "Freaky on a Friday Night" achievement
	function giveAchievement() {
		add(new AchievementPopup('friday_night_play', camAchievement));
		FlxG.sound.play(Paths.sound('confirmMenu'), ClientPrefs.data.soundvolume/100);
		trace('Giving achievement "friday_night_play"');
	}
	#end



	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * elapsed;
			if(FreeplayState.vocals != null) FreeplayState.vocals.volume += 0.5 * elapsed;
		}
		FlxG.camera.followLerp = FlxMath.bound(elapsed * 9 / (FlxG.updateFramerate / 60), 0, 1);
		
		menuCharacter.dance();
		menuCharacter.updateHitbox();

		if (!selectedSomethin)
		{
			if (controls.UI_UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'), ClientPrefs.data.soundvolume/100);
				changeItem(-1);
			}

			if (controls.UI_DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'), ClientPrefs.data.soundvolume/100);
				changeItem(1);
			}

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'), ClientPrefs.data.soundvolume/100);
				MusicBeatState.switchState(new TitleState());
			}

			if (controls.ACCEPT)
			{
				if (optionShit[curSelected] == 'donate')
				{
					CoolUtil.browserLoad('https://ninja-muffin24.itch.io/funkin');
				}
				else
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'), ClientPrefs.data.soundvolume/100);

					if(ClientPrefs.data.flashing) FlxFlicker.flicker(bgflicker, 1.1, 0.15, false);
					FlxTween.tween(menuCharacter, {x: menuCharacter.x+500}, 0.4, {
						onComplete: function (twn:FlxTween) {
							menuCharacter.kill();
						}
					});
					menuItems.forEach(function(spr:FlxSprite)
					{
						if (curSelected != spr.ID)
						{
							FlxTween.tween(spr, {alpha: 0}, 0.4, {ease: FlxEase.quadOut,onComplete: function(twn:FlxTween){}});
							FlxTween.tween(spr, {x: -500}, 0.4, {ease: FlxEase.quadOut,onComplete: function(twn:FlxTween){spr.kill();}});
						}
						else
						{
							FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
							{
								var daChoice:String = optionShit[curSelected];

								switch (daChoice)
								{
									case 'story_mode':
										MusicBeatState.switchState(new StoryMenuState());
									case 'freeplay':
										MusicBeatState.switchState(new FreeplayState());
									#if MODS_ALLOWED
									case 'mods':
										MusicBeatState.switchState(new ModsMenuState());
									#end
									case 'awards':
										MusicBeatState.switchState(new AchievementsMenuState());
									case 'credits':
										MusicBeatState.switchState(new CreditsState());
									case 'options':
										LoadingState.loadAndSwitchState(new OptionsState());
										OptionsState.onPlayState = false;
										if (PlayState.SONG != null)
										{
											PlayState.SONG.arrowSkin = null;
											PlayState.SONG.splashSkin = null;
										}
								}
							});
						}
					});
				}
			}
			#if desktop
			else if (controls.justPressed('debug_1'))
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			#end
		}

		super.update(elapsed);

	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');
			spr.updateHitbox();

			if (spr.ID == curSelected)
			{
				spr.animation.play('selected');
				var add:Float = 0;
				if(menuItems.length > 4) {
					add = menuItems.length * 8;
				}
				camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y - add);
				spr.centerOffsets();
			}
		});
	}
}
