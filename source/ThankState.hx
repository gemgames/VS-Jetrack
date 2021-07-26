package;
import flixel.*;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
 
/**
 * ...
 * @author bbpanzu
 */
class ThankState extends FlxState
{
 
	var _thankYou:Bool = false;
 
	public function new(thankYou:Bool = true) 
	{
		super();
		_thankYou = thankYou;
 
	}
 
	override public function create():Void 
	{
		super.create();
		var thanks:FlxSprite = new FlxSprite(0, 0);
        if (_thankYou)
        {
			thanks.loadGraphic(Paths.image("jetwacc", 'shared'));
		    FlxG.camera.fade(FlxColor.BLACK, 0.8, true);
        }
		thanks.setGraphicSize(Std.int(thanks.width / 6));
		thanks.updateHitbox();
		thanks.screenCenter();
		thanks.scrollFactor.set();
		add(thanks);
 
 
		new FlxTimer().start(8, endIt);
 
	}
 
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
 
		if (FlxG.keys.pressed.ENTER){
			endIt();
		}
 
	}
 
 
	public function endIt(e:FlxTimer=null){
		trace("THANK");
		FlxG.switchState(new StoryMenuState());
	}
 
}