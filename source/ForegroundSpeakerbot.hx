package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class ForegroundSpeakerbot extends FlxSprite
{
	public function new(x:Float, y:Float)
	{
		super(x, y);

		// the j
		frames = Paths.getSparrowAtlas('speakerbot/speakerbot-2','shared');

		animation.addByIndices('doYoThing', 'speakerbot ghosteffect', CoolUtil.numberArray(14), "", 24, false);

		animation.play('doYoThing');
	}

	var danceDir:Bool = false;

	public function noGhostEffect():Void
	{
		animation.addByIndices('doYoThing2', 'speakerbot do your thing', CoolUtil.numberArray(14), "", 24, false);
		dance();
	}

	public function dance():Void
	{
		danceDir = !danceDir;

		if (danceDir)
			animation.play('doYoThing', true);
		else
			animation.play('doYoThing2', true);
	}
}
