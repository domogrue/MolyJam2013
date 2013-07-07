package
{
	import org.flixel.*;

	public class Player extends FlxGroup
	{
		//DATA
		[Embed(source = "assets/characters/BurtReynolds_Arm.png")]private var male_arm_img:Class;
		[Embed(source = "assets/characters/BurtReynolds_Body.png")]private var male_body_img:Class;
		[Embed(source = "assets/characters/BurtReynolds_Hand.png")]private var male_hand_img:Class;
		[Embed(source = "assets/characters/BurtReynolds_NormFace.png")]private var male_normFace_img:Class;
		[Embed(source = "assets/characters/BurtReynolds_OFace.png")]private var male_oFace_img:Class;
		[Embed(source = "assets/characters/BurtReynolds_OuchFace.png")]private var male_ouchFace_img:Class;
		
		[Embed(source = "assets/characters/BurtReynolds_Arm.png")]private var female_arm_img:Class;
		[Embed(source = "assets/characters/BurtReynolds_Body.png")]private var female_body_img:Class;
		[Embed(source = "assets/characters/BurtReynolds_Hand.png")]private var female_hand_img:Class;
		[Embed(source = "assets/characters/BurtReynolds_NormFace.png")]private var female_normFace_img:Class;
		[Embed(source = "assets/characters/BurtReynolds_OFace.png")]private var female_oFace_img:Class;
		[Embed(source = "assets/characters/BurtReynolds_OuchFace.png")]private var female_ouchFace_img:Class;
		
		//constants
		private const MALE_ARM_OFFSET_X:Number = 57;
		private const MALE_ARM_OFFSET_Y:Number = 92;
		private const MALE_HAND_OFFSET_X:Number = 22;
		private const MALE_HAND_OFFSET_Y:Number = 114;
		private const MALE_OFACE_OFFSET_X:Number = 85;
		private const MALE_OFACE_OFFSET_Y:Number = 4;
		private const MALE_OUCHFACE_OFFSET_X:Number = 84;
		private const MALE_OUCHFACE_OFFSET_Y:Number = 13;
		private const MALE_NORMFACE_OFFSET_X:Number = 92;
		private const MALE_NORMFACE_OFFSET_Y:Number = 10;
		private const MALE_BODY_OFFSET_X:Number = 78;
		private const MALE_BODY_OFFSET_Y:Number = 81;
		
		private const WIGGLE_SPEED:Number = 0.7;
		private const WIGGLE_MAX:Number = 5;

		
		//Variables
		private var _x:Number;
		private var _y:Number;
		private var _wiggle_direction:Number = 1;
		private var _wiggle_count:Number = 0;
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
			
			if (type == "male") {
				bodySprite = new FlxSprite(x, y, male_body_img);
				armSprite = new FlxSprite(x, y, male_arm_img);
				handSprite = new FlxSprite(x, y, male_hand_img);
				faceSprite = new FlxSprite(x, y, male_normFace_img);
			} 
			else if (type == "female") {
				bodySprite = new FlxSprite(x + MALE_BODY_OFFSET_X, y + MALE_BODY_OFFSET_Y, female_body_img);
				armSprite = new FlxSprite(x + MALE_ARM_OFFSET_X, y + MALE_ARM_OFFSET_Y, female_arm_img);
				handSprite = new FlxSprite(x + MALE_HAND_OFFSET_X, y + MALE_HAND_OFFSET_Y, female_hand_img);
				faceSprite = new FlxSprite(x + MALE_NORMFACE_OFFSET_X, y + MALE_NORMFACE_OFFSET_Y, female_normFace_img);
			} else {
				//if the type doesn't match, it'll just load in Burt Reynolds
				bodySprite = new FlxSprite(x + MALE_BODY_OFFSET_X, y + MALE_BODY_OFFSET_Y, male_body_img);
				armSprite = new FlxSprite(x + MALE_ARM_OFFSET_X, y + MALE_ARM_OFFSET_Y, male_arm_img);
				handSprite = new FlxSprite(x + MALE_HAND_OFFSET_X, y + MALE_HAND_OFFSET_Y, male_hand_img);
				faceSprite = new FlxSprite(x + MALE_NORMFACE_OFFSET_X, y + MALE_NORMFACE_OFFSET_Y, male_normFace_img);
			}

			FlxG.log('bodySprite bottom: ' + (bodySprite.y + bodySprite.height));

			add(bodySprite);
			add(armSprite);
			add(handSprite);
			add(faceSprite);
		}

		public function wiggle():void {
			if ( _wiggle_count > WIGGLE_MAX ) {
				_wiggle_direction *= -1;
				_wiggle_count = 0;
			} else {
				_wiggle_count += 1;
			}
			this.x += WIGGLE_SPEED*_wiggle_direction;
		}
		
		public function set x(inX:Number):void {
			_x = inX;
			bodySprite.x = inX;
			armSprite.x = inX;
			handSprite.x = inX;
			faceSprite.x = inX;
		}
		
		public function set y(inY:Number):void {
			_y = inY;
			bodySprite.y = inY;
			armSprite.y = inY;
			handSprite.y = inY;
			faceSprite.y = inY;
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
