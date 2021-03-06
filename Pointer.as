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
		[Embed(source = "assets/pointer_length.png")]private var length_image:Class;
		[Embed(source = "assets/pointer_tip.png")]private var tip_image:Class;
		[Embed(source = "assets/pointer_end.png")] private var end_image:Class;
		
		[Embed(source = "assets/pointer2_length.png")]private var length_image2:Class;
		[Embed(source = "assets/pointer2_tip.png")]private var tip_image2:Class;
		[Embed(source = "assets/pointer2_end.png")] private var end_image2:Class;

		[Embed(source = "assets/pointer3_length.png")]private var length_image3:Class;
		[Embed(source = "assets/pointer3_tip.png")]private var tip_image3:Class;
		[Embed(source = "assets/pointer3_end.png")] private var end_image3:Class;
		
		//constants
		public static const TIP_HEIGHT:Number = 32;
		public static const TIP_WIDTH:Number = 32;
		public static const POINTER_VELOCITY:Number = 1;
		
		//variables
		public var leftKey:String;
		public var rightKey:String;
		
		public var tipSprite:FlxSprite;
		public var lengthSprite:FlxSprite;
		public var endSprite:FlxSprite;
		public var playBar:PlayBar;
		public var hitBox:FlxSprite;
		public var player:Player;

		private var inSweetSpot:Boolean = false;
		private var inGSpot:Boolean = false;
		
		public function Pointer(xIn:Number,yIn:Number,widthIn:Number,lkIn:String,rkIn:String,playBarIn:PlayBar,playerIn:Player)
		{
			//try {
			leftKey = lkIn;
			rightKey = rkIn;
			
			FlxG.log('playerIn.type: ' + playerIn.type);
			//try {
			switch (playerIn.type) {
				case 'curry':
				case 'male':
					tipSprite = new FlxSprite(xIn, yIn, tip_image);
					lengthSprite = new FlxSprite(xIn + TIP_WIDTH, yIn, length_image);
					endSprite = new FlxSprite(0,yIn,end_image);
					break;
				case 'female':
					tipSprite = new FlxSprite(xIn, yIn, tip_image2);
					lengthSprite = new FlxSprite(xIn + TIP_WIDTH, yIn, length_image2);
					endSprite = new FlxSprite(0,yIn,end_image2);
					break;
				case 'robot':
					tipSprite = new FlxSprite(xIn, yIn, tip_image3);
					lengthSprite = new FlxSprite(xIn + TIP_WIDTH, yIn, length_image3);
					endSprite = new FlxSprite(0,yIn,end_image3);
					break;
			}
			lengthSprite.origin.x = lengthSprite.origin.y = 0;
			lengthSprite.scale.x = widthIn - TIP_WIDTH;
			endSprite.x = lengthSprite.x + lengthSprite.scale.x;

			playBar = playBarIn;
			player = playerIn;

			hitBox = new FlxSprite(tipSprite.x,tipSprite.y - 16);
			hitBox.makeGraphic(16,10,0x00000000);
			this.add(this.hitBox);
			
			this.add(this.tipSprite);
			this.add(this.lengthSprite);
			this.add(this.endSprite);
			//} catch(e:Error) { FlxG.log('Error in Pointer.create: ' + e); }
			
			FlxG.log('creating Pointer complete');
		}
		
		override public function update():void
		{
			//try {
			super.update();

			inSweetSpot = false;
			inGSpot = false;
			FlxG.overlap(hitBox, playBar.sweetSpot, sweetSpotOverlap);

			movePointer();
			FlxG.overlap(hitBox, playBar.gSpot, checkForGSpotHit);
			//} catch(e:Error) { FlxG.log('Pointer update error: ' + e); }
			
			if ( !inGSpot ) {
				playBar.gSpot.play("OFF");
			}

			if ( !inSweetSpot ) {
				playBar.gSpotCallback(false);
			}
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
			endSprite.x = lengthSprite.x + lengthSprite.scale.x;
			hitBox.x = tipSprite.x;
		}

		private function checkForGSpotHit(Object1:FlxObject,Object2:FlxObject):void {
			playBar.gSpotCallback(true);
			playBar.gSpot.play("ON");
			if ( Math.floor(Math.random()*240) < 1 ) {
				playBar.player.playSound();
			}
			player.wiggle();
			inGSpot = true;
		}
		
		//gets and sets
		public function getPointerPos():FlxPoint {
			return new FlxPoint(tipSprite.x + TIP_WIDTH / 2, tipSprite.y + TIP_HEIGHT/2);
		}
	}

}