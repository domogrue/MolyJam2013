package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Jason Lee
	 */
	public class Pointer extends FlxGroup
	{
		//data
		[Embed(source = "assets/pointer_length.png")]private static var length_image:Class;
		[Embed(source = "assets/pointer_tip.png")]private static var tip_image:Class;
		
		//constants
		public static const TIP_HEIGHT:Number = 32;
		public static const TIP_WIDTH:Number = 32;
		public static const POINTER_VELOCITY:Number = 1;
		
		//variables
		public var leftKey:String;
		public var rightKey:String;
		
		public var tipSprite:FlxSprite;
		public var lengthSprite:FlxSprite;
		public var playBar:PlayBar;
		
		public function Pointer(xIn:Number,yIn:Number,widthIn:Number,lkIn:String,rkIn:String,playBarIn:PlayBar)
		{
			leftKey = lkIn;
			rightKey = rkIn;
			
			tipSprite = new FlxSprite(xIn, yIn, tip_image);
			lengthSprite = new FlxSprite(xIn + TIP_WIDTH, yIn, length_image);
			lengthSprite.origin.x = lengthSprite.origin.y = 0;
			lengthSprite.scale.x = widthIn - TIP_WIDTH;
			playBar = playBarIn
			
			this.add(this.tipSprite);
			this.add(this.lengthSprite);
			
			trace("tipSprite X is " + tipSprite.x +" and playbar X is " + playBar.x);
		}
		
		override public function update():void
		{
			super.update();
			movePointer();
		}
		
		public function movePointer():void
		{
			if (FlxG.keys.pressed(leftKey) && tipSprite.x - POINTER_VELOCITY > playBar.x)
			{
				tipSprite.x -= POINTER_VELOCITY;
			}
			else if (FlxG.keys.pressed(rightKey) && tipSprite.x + POINTER_VELOCITY < playBar.x+playBar.width)
			{
				tipSprite.x += POINTER_VELOCITY;
			}
			//trace("MovePointerCalled");
			lengthSprite.x = tipSprite.x+TIP_WIDTH;
		}
		
		//gets and sets
		public function getPointerPos():FlxPoint {
			return new FlxPoint(tipSprite.x + TIP_WIDTH / 2, tipSprite.y + TIP_HEIGHT/2);
		}
	}

}