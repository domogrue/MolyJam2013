package
{
	import org.flixel.*;

	public class Player extends FlxGroup
	{
		//DATA
		[Embed(source = "assets/characters/BurtReynolds_Arm.png")]private static var male_arm_img:Class;
		[Embed(source = "assets/characters/BurtReynolds_Body.png")]private static var male_body_img:Class;
		[Embed(source = "assets/characters/BurtReynolds_Hand.png")]private static var male_hand_img:Class;
		[Embed(source = "assets/characters/BurtReynolds_NormFace.png")]private static var male_normFace_img:Class;
		[Embed(source = "assets/characters/BurtReynolds_OFace.png")]private static var male_oFace_img:Class;
		[Embed(source = "assets/characters/BurtReynolds_OuchFace.png")]private static var male_ouchFace_img:Class;
		
		[Embed(source = "assets/characters/BurtReynolds_Arm.png")]private static var female_arm_img:Class;
		[Embed(source = "assets/characters/BurtReynolds_Body.png")]private static var female_body_img:Class;
		[Embed(source = "assets/characters/BurtReynolds_Hand.png")]private static var female_hand_img:Class;
		[Embed(source = "assets/characters/BurtReynolds_NormFace.png")]private static var female_normFace_img:Class;
		[Embed(source = "assets/characters/BurtReynolds_OFace.png")]private static var female_oFace_img:Class;
		[Embed(source = "assets/characters/BurtReynolds_OuchFace.png")]private static var female_ouchFace_img:Class;
		
		//constants
		private const MALE_ARM_OFFSET_X:Number = -40;
		private const MALE_ARM_OFFSET_Y:Number = -33;
		private const MALE_HAND_OFFSET_X:Number = -122;
		private const MALE_HAND_OFFSET_Y:Number = -35;
		private const MALE_OFACE_OFFSET_X:Number = -36;
		private const MALE_OFACE_OFFSET_Y:Number = -123;
		private const MALE_OUCHFACE_OFFSET_X:Number = -40;
		private const MALE_OUCHFACE_OFFSET_Y:Number = -120;
		private const MALE_NORMFACE_OFFSET_X:Number = -36;
		private const MALE_NORMFACE_OFFSET_Y:Number = -119;
		
		//Variables
		private var _x:Number;
		private var _y:Number;
		public var bodySprite:FlxSprite;
		public var armSprite:FlxSprite;
		public var handSprite:FlxSprite;
		public var faceSprite:FlxSprite;
		
		public function Player(index:int,xIn:Number,yIn:Number,type:String)
		{
			_x = xIn;
			_y = yIn;
			
			switch (index) {
			case 0:
				// do stuff
			case 1:
				// do other stuff
			}
			
			try {
			
			if (type == "male") {
				bodySprite = new FlxSprite(x, y, male_body_img);
				armSprite = new FlxSprite(x + MALE_ARM_OFFSET_X, y + MALE_ARM_OFFSET_Y, male_arm_img);
				handSprite = new FlxSprite(x + MALE_HAND_OFFSET_X, y + MALE_HAND_OFFSET_Y, male_hand_img);
				faceSprite = new FlxSprite(x + MALE_NORMFACE_OFFSET_X, y + MALE_NORMFACE_OFFSET_Y, male_normFace_img);
			} 
			else if (type == "female") {
				bodySprite = new FlxSprite(x, y, female_body_img);
				armSprite = new FlxSprite(x + MALE_ARM_OFFSET_X, y + MALE_ARM_OFFSET_Y, female_arm_img);
				handSprite = new FlxSprite(x + MALE_HAND_OFFSET_X, y + MALE_HAND_OFFSET_Y, female_hand_img);
				faceSprite = new FlxSprite(x + MALE_NORMFACE_OFFSET_X, y + MALE_NORMFACE_OFFSET_Y, female_normFace_img);
			} else {
				//if the type doesn't match, it'll just load in Burt Reynolds
				bodySprite = new FlxSprite(x, y, male_body_img);
				armSprite = new FlxSprite(x + MALE_ARM_OFFSET_X, y + MALE_ARM_OFFSET_Y, male_arm_img);
				handSprite = new FlxSprite(x + MALE_HAND_OFFSET_X, y + MALE_HAND_OFFSET_Y, male_hand_img);
				faceSprite = new FlxSprite(x + MALE_NORMFACE_OFFSET_X, y + MALE_NORMFACE_OFFSET_Y, male_normFace_img);
			}
			
			add(bodySprite);
			add(armSprite);
			add(handSprite);
			add(faceSprite);
			
			} catch (error:Error) {
				trace('Failed trying to create FlxSprites from assets within Player');
			}
		}
		
		public function set x(inX:Number):void {
			_x = inX;
		}
		
		public function set y(inY:Number):void {
			_y = inY;
		}
		
		public function get x():Number {
			return _x;
		}
		
		public function get y():Number {
			return _y;
		}
		
		/*
		public function updateOFace():void {
			
			faceSprite.x = xCor + MALE_OFACE_OFFSET_X;
			faceSprite.y = yCor + MALE_OFACE_OFFSET_Y;
		}
		public function updateOuchFace():void {
			
		}
		public function updateNormFace():void {
			
		}
		*/
	}
}
