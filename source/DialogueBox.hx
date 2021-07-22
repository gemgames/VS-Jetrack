package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;

	public var finishThing:Void->Void;

	var portraitChallenge:FlxSprite;
	var portraitHappy:FlxSprite;
	var portraitSweat:FlxSprite;
	var portraitError:FlxSprite;
	var portraitBeep:FlxSprite;
	var portraitWindyBoi:FlxSprite;
	var portraitBF:FlxSprite;
	var portraitFunny:FlxSprite;
	var portraitBfFunkinDies:FlxSprite;
	var portraitTrauma:FlxSprite;
	var portraitBfSweat:FlxSprite;
	var portraitblank:FlxSprite;

	var handSelect:FlxSprite;
	var bgFade:FlxSprite;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				FlxG.sound.playMusic(Paths.music('Lunchbox'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'thorns':
				FlxG.sound.playMusic(Paths.music('LunchboxScary'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
		}

		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		new FlxTimer().start(0.83, function(tmr:FlxTimer)
		{
			bgFade.alpha += (1 / 5) * 0.7;
			if (bgFade.alpha > 0.7)
				bgFade.alpha = 0.7;
		}, 5);

		box = new FlxSprite(-20, 45);
		
		var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'bopeebo':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talkingFEATNOTATHING', 'shared');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.width = 200;
				box.height = 200;
				box.x = 100;
				box.y = 365;
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;
		
		portraitChallenge = new FlxSprite(10, 40);
		portraitChallenge.frames = Paths.getSparrowAtlas('portraits/portraitsthree', 'shared');
		portraitChallenge.animation.addByPrefix('enter', 'portraits challenge', 24, false);
		portraitChallenge.setGraphicSize(Std.int(box.width / 0.1));
		portraitChallenge.updateHitbox();
		portraitChallenge.scrollFactor.set();
		add(portraitChallenge);

		portraitHappy = new FlxSprite(10, 40);
		portraitHappy.frames = Paths.getSparrowAtlas('portraits/portraitsthree', 'shared');
		portraitHappy.animation.addByPrefix('enter', 'portraits happy', 24, false);
		portraitHappy.setGraphicSize(Std.int(box.width / 0.1));
		portraitHappy.updateHitbox();
		portraitHappy.scrollFactor.set();
		add(portraitHappy);

		portraitSweat = new FlxSprite(10, 40);
		portraitSweat.frames = Paths.getSparrowAtlas('portraits/portraitsthree', 'shared');
		portraitSweat.animation.addByPrefix('enter', 'portraits sweat', 24, false);
		portraitSweat.setGraphicSize(Std.int(box.width / 0.1));
		portraitSweat.updateHitbox();
		portraitSweat.scrollFactor.set();
		add(portraitSweat);

		portraitError = new FlxSprite(10, 40);
		portraitError.frames = Paths.getSparrowAtlas('portraits/portraitsthree', 'shared');
		portraitError.animation.addByPrefix('enter', 'portraits error', 24, false);
		portraitError.setGraphicSize(Std.int(box.width / 0.1));
		portraitError.updateHitbox();
		portraitError.scrollFactor.set();
		add(portraitError);

		portraitBeep = new FlxSprite(650, 205);
		portraitBeep.frames = Paths.getSparrowAtlas('portraits/portraitsthree', 'shared');
		portraitBeep.animation.addByPrefix('enter', 'portraits bfBeep', 24, false);
		portraitBeep.updateHitbox();
		portraitBeep.scrollFactor.set();
		add(portraitBeep);

		portraitWindyBoi = new FlxSprite(650, 175);
		portraitWindyBoi.frames = Paths.getSparrowAtlas('portraits/portraitsthree', 'shared');
		portraitWindyBoi.animation.addByPrefix('enter', 'portraits blowinwindiguess', 24, false);
		portraitWindyBoi.updateHitbox();
		portraitWindyBoi.scrollFactor.set();
		add(portraitWindyBoi);

		portraitBF = new FlxSprite(650, 205);
		portraitBF.frames = Paths.getSparrowAtlas('portraits/portraitsthree', 'shared');
		portraitBF.animation.addByPrefix('enter', 'portraits bf', 24, false);
		portraitBF.updateHitbox();
		portraitBF.scrollFactor.set();
		add(portraitBF);

		portraitFunny = new FlxSprite(650, 205);
		portraitFunny.frames = Paths.getSparrowAtlas('portraits/portraitsthree', 'shared');
		portraitFunny.animation.addByPrefix('enter', 'portraits idkwhatthisis', 24, false);
		portraitFunny.updateHitbox();
		portraitFunny.scrollFactor.set();
		add(portraitFunny);

		portraitBfFunkinDies = new FlxSprite(650, 200);
		portraitBfFunkinDies.frames = Paths.getSparrowAtlas('portraits/portraitsthree', 'shared');
		portraitBfFunkinDies.animation.addByPrefix('enter', 'portraits bfSkeleton', 24, false);
		portraitBfFunkinDies.updateHitbox();
		portraitBfFunkinDies.scrollFactor.set();
		add(portraitBfFunkinDies);

		portraitTrauma = new FlxSprite(650, 180);
		portraitTrauma.frames = Paths.getSparrowAtlas('portraits/portraitsthree', 'shared');
		portraitTrauma.animation.addByPrefix('enter', 'portraits traumaBf', 24, false);
		portraitTrauma.updateHitbox();
		portraitTrauma.scrollFactor.set();
		add(portraitTrauma);

		portraitBfSweat = new FlxSprite(650, 205);
		portraitBfSweat.frames = Paths.getSparrowAtlas('portraits/portraitsthree', 'shared');
		portraitBfSweat.animation.addByPrefix('enter', 'portraits sweatBf', 24, false);
		portraitBfSweat.updateHitbox();
		portraitBfSweat.scrollFactor.set();
		add(portraitBfSweat);

		portraitblank = new FlxSprite(600, 215);
		portraitblank.frames = Paths.getSparrowAtlas('portraits/portraitsthree', 'shared');
		portraitblank.animation.addByPrefix('enter', 'portraits blank', 24, false);
		portraitblank.updateHitbox();
		portraitblank.scrollFactor.set();
		add(portraitblank);
		
		box.animation.play('normalOpen');
		box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * 0.9));
		box.updateHitbox();
		add(box);

		box.screenCenter(X);

		handSelect = new FlxSprite(FlxG.width * 0.9, FlxG.height * 0.9).loadGraphic(Paths.image('weeb/pixelUI/hand_textbox'));
		add(handSelect);


		if (!talkingRight)
		{
			// box.flipX = true;
		}

		dropText = new FlxText(242, 502, Std.int(FlxG.width * 0.6), "", 32);
		dropText.font = 'Pixel Arial 11 Bold';
		dropText.color = 0xFFD89494;
		add(dropText);

		swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 0.6), "", 32);
		swagDialogue.font = 'Pixel Arial 11 Bold';
		swagDialogue.color = 0xFF3F2021;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
		add(swagDialogue);

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		// HARD CODING CUZ IM STUPDI
		dropText.text = swagDialogue.text;

		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				box.animation.play('normal');
				dialogueOpened = true;
			}
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		if (PlayerSettings.player1.controls.ACCEPT && dialogueStarted == true)
		{
			remove(dialogue);
				
			FlxG.sound.play(Paths.sound('clickText'), 0.8);

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					if (PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'thorns')
						FlxG.sound.music.fadeOut(2.2, 0);

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						box.alpha -= 1 / 5;
						bgFade.alpha -= 1 / 5 * 0.7;
						swagDialogue.alpha -= 1 / 5;
						dropText.alpha = swagDialogue.alpha;
					}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);

		switch (curCharacter)
		{
			case 'jetrack-challenge':
				portraitHappy.visible = false;
				portraitSweat.visible = false;
				portraitError.visible = false;
				portraitBeep.visible = false;
				portraitWindyBoi.visible = false;
				portraitBF.visible = false;
				portraitFunny.visible = false;
				portraitBfFunkinDies.visible = false;
				portraitTrauma.visible = false;
				portraitBfSweat.visible = false;
				portraitblank.visible = false;
				if (!portraitChallenge.visible)
				{
					portraitChallenge.visible = true;
					portraitChallenge.animation.play('enter');
				}
			case 'jet-happy':
				portraitChallenge.visible = false;
				portraitSweat.visible = false;
				portraitError.visible = false;
				portraitBeep.visible = false;
				portraitWindyBoi.visible = false;
				portraitBF.visible = false;
				portraitFunny.visible = false;
				portraitBfFunkinDies.visible = false;
				portraitTrauma.visible = false;
				portraitBfSweat.visible = false;
				portraitblank.visible = false;
				if (!portraitHappy.visible)
				{
					portraitHappy.visible = true;
					portraitHappy.animation.play('enter');
				}
			case 'jetsrack-sweat':
				portraitChallenge.visible = false;
				portraitHappy.visible = false;
				portraitError.visible = false;
				portraitBeep.visible = false;
				portraitWindyBoi.visible = false;
				portraitBF.visible = false;
				portraitFunny.visible = false;
				portraitBfFunkinDies.visible = false;
				portraitTrauma.visible = false;
				portraitBfSweat.visible = false;
				portraitblank.visible = false;
				if (!portraitSweat.visible)
				{
					portraitSweat.visible = true;
					portraitSweat.animation.play('enter');
				}
			case 'jet-BSOD':
				portraitChallenge.visible = false;
				portraitHappy.visible = false;
				portraitSweat.visible = false;
				portraitBeep.visible = false;
				portraitWindyBoi.visible = false;
				portraitBF.visible = false;
				portraitFunny.visible = false;
				portraitBfFunkinDies.visible = false;
				portraitTrauma.visible = false;
				portraitBfSweat.visible = false;
				portraitblank.visible = false;
				if (!portraitError.visible)
				{
					portraitError.visible = true;
					portraitError.animation.play('enter');
				}
			case 'beepFunkinBop':
				portraitChallenge.visible = false;
				portraitHappy.visible = false;
				portraitSweat.visible = false;
				portraitError.visible = false;
				portraitWindyBoi.visible = false;
				portraitBF.visible = false;
				portraitFunny.visible = false;
				portraitBfFunkinDies.visible = false;
				portraitTrauma.visible = false;
				portraitBfSweat.visible = false;
				portraitblank.visible = false;
				if (!portraitBeep.visible)
				{
					portraitBeep.visible = true;
					portraitBeep.animation.play('enter');
				}
			case 'bfDodgeIg':
				portraitChallenge.visible = false;
				portraitHappy.visible = false;
				portraitSweat.visible = false;
				portraitError.visible = false;
				portraitBeep.visible = false;
				portraitBF.visible = false;
				portraitFunny.visible = false;
				portraitBfFunkinDies.visible = false;
				portraitTrauma.visible = false;
				portraitBfSweat.visible = false;
				portraitblank.visible = false;
				if (!portraitWindyBoi.visible)
				{
					portraitWindyBoi.visible = true;
					portraitWindyBoi.animation.play('enter');
				}
			case 'boyfriend':
				portraitChallenge.visible = false;
				portraitHappy.visible = false;
				portraitSweat.visible = false;
				portraitError.visible = false;
				portraitBeep.visible = false;
				portraitWindyBoi.visible = false;
				portraitFunny.visible = false;
				portraitBfFunkinDies.visible = false;
				portraitTrauma.visible = false;
				portraitBfSweat.visible = false;
				portraitblank.visible = false;
				if (!portraitBF.visible)
				{
					portraitBF.visible = true;
					portraitBF.animation.play('enter');
				}
			case 'wotBf':
				portraitChallenge.visible = false;
				portraitHappy.visible = false;
				portraitSweat.visible = false;
				portraitError.visible = false;
				portraitBeep.visible = false;
				portraitWindyBoi.visible = false;
				portraitBF.visible = false;
				portraitBfFunkinDies.visible = false;
				portraitTrauma.visible = false;
				portraitBfSweat.visible = false;
				portraitblank.visible = false;
				if (!portraitFunny.visible)
				{
					portraitFunny.visible = true;
					portraitFunny.animation.play('enter');
				}
			case 'bfFunkinDies':
				portraitChallenge.visible = false;
				portraitHappy.visible = false;
				portraitSweat.visible = false;
				portraitError.visible = false;
				portraitBeep.visible = false;
				portraitWindyBoi.visible = false;
				portraitBF.visible = false;
				portraitFunny.visible = false;
				portraitTrauma.visible = false;
				portraitBfSweat.visible = false;
				portraitblank.visible = false;
				if (!portraitBfFunkinDies.visible)
				{
					portraitBfFunkinDies.visible = true;
					portraitBfFunkinDies.animation.play('enter');
				}
			case 'bfButScared':
				portraitChallenge.visible = false;
				portraitHappy.visible = false;
				portraitSweat.visible = false;
				portraitError.visible = false;
				portraitBeep.visible = false;
				portraitWindyBoi.visible = false;
				portraitBF.visible = false;
				portraitFunny.visible = false;
				portraitBfFunkinDies.visible = false;
				portraitBfSweat.visible = false;
				portraitblank.visible = false;
				if (!portraitTrauma.visible)
				{
					portraitTrauma.visible = true;
					portraitTrauma.animation.play('enter');
				}
			case 'bf-Sweat':
				portraitChallenge.visible = false;
				portraitHappy.visible = false;
				portraitSweat.visible = false;
				portraitError.visible = false;
				portraitBeep.visible = false;
				portraitWindyBoi.visible = false;
				portraitBF.visible = false;
				portraitFunny.visible = false;
				portraitBfFunkinDies.visible = false;
				portraitTrauma.visible = false;
				portraitblank.visible = false;
				if (!portraitBfSweat.visible)
				{
					portraitBfSweat.visible = true;
					portraitBfSweat.animation.play('enter');
				}
			case 'literally-noone':
				portraitChallenge.visible = false;
				portraitHappy.visible = false;
				portraitSweat.visible = false;
				portraitError.visible = false;
				portraitBeep.visible = false;
				portraitWindyBoi.visible = false;
				portraitBF.visible = false;
				portraitFunny.visible = false;
				portraitBfFunkinDies.visible = false;
				portraitTrauma.visible = false;
				portraitBfSweat.visible = false;
				if (!portraitblank.visible)
				{
					portraitblank.visible = true;
					portraitblank.animation.play('enter');
				}
				// If there was an easier way to do this then I hate myself (please fix my code other programmers)
		}
	}

	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	}
}
