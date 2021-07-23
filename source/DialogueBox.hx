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
			case 'cloud':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talkingFEATNOTATHING', 'shared');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.width = 225;
				box.height = 225;
				box.x = 125;
				box.y = 350;

			case 'jet':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talkingFEATNOTATHING', 'shared');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.width = 225;
				box.height = 225;
				box.x = 125;
				box.y = 350;

			case 'proton':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talkingFEATNOTATHING', 'shared');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.width = 225;
				box.height = 225;
				box.x = 125;
				box.y = 350;

			case 'rocket':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talkingFEATNOTATHING', 'shared');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.width = 225;
				box.height = 225;
				box.x = 125;
				box.y = 350;

			case 'autrua':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talkingFEATNOTATHING', 'shared');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
				box.width = 225;
				box.height = 225;
				box.x = 125;
				box.y = 350;
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;
		
		portraitChallenge = new FlxSprite(75, 75).loadGraphic(Paths.image('portraits/challenge', 'shared'));
		portraitChallenge.setGraphicSize(Std.int(portraitChallenge.width / 1.5));
		portraitChallenge.updateHitbox();
		portraitChallenge.scrollFactor.set();
		add(portraitChallenge);

		portraitHappy = new FlxSprite(75, 75).loadGraphic(Paths.image('portraits/happy', 'shared'));
		portraitHappy.setGraphicSize(Std.int(portraitHappy.width / 1.5));
		portraitHappy.updateHitbox();
		portraitHappy.scrollFactor.set();
		add(portraitHappy);

		portraitSweat = new FlxSprite(75, 75).loadGraphic(Paths.image('portraits/sweat', 'shared'));
		portraitSweat.setGraphicSize(Std.int(portraitSweat.width / 1.5));
		portraitSweat.updateHitbox();
		portraitSweat.scrollFactor.set();
		add(portraitSweat);

		portraitError = new FlxSprite(75, 75).loadGraphic(Paths.image('portraits/error', 'shared'));
		portraitError.setGraphicSize(Std.int(portraitError.width / 1.5));
		portraitError.updateHitbox();
		portraitError.scrollFactor.set();
		add(portraitError);

		portraitBeep = new FlxSprite(650, 175).loadGraphic(Paths.image('portraits/beep', 'shared'));
		portraitBeep.updateHitbox();
		portraitBeep.scrollFactor.set();
		add(portraitBeep);

		portraitWindyBoi = new FlxSprite(650, 175).loadGraphic(Paths.image('portraits/idk', 'shared'));
		portraitWindyBoi.updateHitbox();
		portraitWindyBoi.scrollFactor.set();
		add(portraitWindyBoi);

		portraitBF = new FlxSprite(650, 205).loadGraphic(Paths.image('portraits/bf', 'shared'));
		portraitBF.updateHitbox();
		portraitBF.scrollFactor.set();
		add(portraitBF);

		portraitFunny = new FlxSprite(650, 205).loadGraphic(Paths.image('portraits/bfchallenge', 'shared'));
		portraitFunny.updateHitbox();
		portraitFunny.scrollFactor.set();
		add(portraitFunny);

		portraitBfFunkinDies = new FlxSprite(650, 175); 
		portraitBfFunkinDies.frames = Paths.getSparrowAtlas('portraits/bfdies', 'shared');
		portraitBfFunkinDies.animation.addByPrefix('enter', 'BF dies', 24, false);
		portraitBfFunkinDies.updateHitbox();
		portraitBfFunkinDies.scrollFactor.set();
		add(portraitBfFunkinDies);

		portraitTrauma = new FlxSprite(650, 180).loadGraphic(Paths.image('portraits/trauma', 'shared'));
		portraitTrauma.updateHitbox();
		portraitTrauma.scrollFactor.set();
		add(portraitTrauma);

		portraitBfSweat = new FlxSprite(650, 205).loadGraphic(Paths.image('portraits/bfsweat', 'shared'));
		portraitBfSweat.updateHitbox();
		portraitBfSweat.scrollFactor.set();
		add(portraitBfSweat);

		portraitblank = new FlxSprite(650, 205).loadGraphic(Paths.image('portraits/blank', 'shared'));
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

		dropText = new FlxText(242, 450, Std.int(FlxG.width * 0.6), "", 30);
		dropText.font = 'Pixel Arial 11 Bold';
		dropText.color = 0xFFD89494;
		add(dropText);

		swagDialogue = new FlxTypeText(240, 448, Std.int(FlxG.width * 0.6), "", 30);
		swagDialogue.font = 'Pixel Arial 11 Bold';
		swagDialogue.color = 0xFF3F2021;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('JetrackSFX/Dialogue/Jetrack Speaking'), 0.6)];
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
				
			FlxG.sound.play(Paths.sound('JetrackSFX/Dialogue/DialogueEnter'), 0.8);

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
					FlxG.sound.play(Paths.sound('fnf_loss_sfx'));
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
