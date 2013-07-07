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
		[Embed(source = "assets/pointer_end.png")] private static var end_image:Class;
		
		[Embed(source = "assets/pointer2_length.png")]private static var length_image2:Class;
		[Embed(source = "assets/pointer2_tip.png")]private static var tip_image2:Class;
		[Embed(source = "assets/pointer2_end.png")] private static var end_image2:Class;
		
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
		public var hitBox:FlxSprite;
		public var player:Player;

		private var inSweetSpot:Boolean = false;
		
		public function Pointer(xIn:Number,yIn:Number,widthIn:Number,lkIn:String,rkIn:String,playBarIn:PlayBar,playerIn:Player)
		{
			leftKey = lkIn;
			rightKey = rkIn;
			
			tipSprite = new FlxSprite(xIn, yIn, tip_image);
			lengthSprite = new FlxSprite(xIn + TIP_WIDTH, yIn, length_image);
			lengthSprite.origin.x = lengthSprite.origin.y = 0;
			lengthSprite.scale.x = widthIn - TIP_WIDTH;
			playBar = playBarIn;
			player = playerIn;

			hitBox = new FlxSprite(tipSprite.x,tipSprite.y - 16);
			hitBox.makeGraphic(16,10,0x00000000);
			this.add(this.hitBox);
			
			this.add(this.tipSprite);
			this.add(this.lengthSprite);
			
			FlxG.log('creating Pointer complete');
		}
		
		override public function update():void
		{
			//try {
			super.update();

			inSweetSpot = false;
			FlxG.overlap(hitBox, playBar.sweetSpot, sweetSpotOverlap);

			movePointer();
			FlxG.overlap(hitBox, playBar.gSpot, checkForGSpotHit);
			//} catch(e:Error) { FlxG.log('Pointer update error: ' + e); }

			if ( !inSweetSpot ) { playBar.gSpotCallback(false); }
		}

		private function sweetSpotOverlap(Object1:FlxObject,Object2:FlxObject):void {
			inSweetSpot = true;
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
			hitBox.x = tipSprite.x;
		}

		private function checkForGSpotHit(Object1:FlxObject,Object2:FlxObject):void {
			playBar.gSpotCallback(true);
			playBar.player.playSound();
			player.wiggle();
		}
		
		//gets and sets
		public function getPointerPos():FlxPoint {
			return new FlxPoint(tipSprite.x + TIP_WIDTH / 2, tipSprite.y + TIP_HEIGHT/2);
		}
	}

}