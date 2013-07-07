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
		private const MALE_ARM_OFFSET_X = -40;
		private const MALE_ARM_OFFSET_Y = -33;
		private const MALE_HAND_OFFSET_X = -122;
		private const MALE_HAND_OFFSET_Y = -35;
		private const MALE_OFACE_OFFSET_X = -36;
		private const MALE_OFACE_OFFSET_Y = -123;
		private const MALE_OUCHFACE_OFFSET_X = -40;
		private const MALE_OUCHFACE_OFFSET_Y = -120;
		private const MALE_NORMFACE_OFFSET_X = -36;
		private const MALE_NORMFACE_OFFSET_Y = -119;
		
		//Variables
		public var xCor:Number;
		public var yCor:Number;
		public var bodySprite:FlxSprite;
		public var armSprite:FlxSprite;
		public var handSprite:FlxSprite;
		public var faceSprite:FlxSprite;
		
		public function Player(index:int,xIn:Number,yIn:Number,type:String)
		{
			xCor = xIn;
			yCor = yIn;
			
			switch (index) {
			case 0:
				// do stuff
			case 1:
				// do other stuff
			}
			
			if (type == "male") {
				bodySprite = new FlxSprite(xCor, yCor, male_body_img);
				armSprite = new FlxSprite(xCor + MALE_ARM_OFFSET_X, yCor + MALE_ARM_OFFSET_Y, male_arm_img);
				handSprite = new FlxSprite(xCor + MALE_HAND_OFFSET_X, yCor + MALE_HAND_OFFSET_Y, male_hand_img);
				faceSprite = new FlxSprite(xCor + MALE_NORMFACE_OFFSET_X, yCor + MALE_NORMFACE_OFFSET_Y, male_normFace_img);
			} 
			else if (type == "female") {
				bodySprite = new FlxSprite(xCor, yCor, female_body_img);
				armSprite = new FlxSprite(xCor + MALE_ARM_OFFSET_X, yCor + MALE_ARM_OFFSET_Y, female_arm_img);
				handSprite = new FlxSprite(xCor + MALE_HAND_OFFSET_X, yCor + MALE_HAND_OFFSET_Y, female_hand_img);
				faceSprite = new FlxSprite(xCor + MALE_NORMFACE_OFFSET_X, yCor + MALE_NORMFACE_OFFSET_Y, female_normFace_img);
			} else {
				//if the type doesn't match, it'll just load in Burt Reynolds
				bodySprite = new FlxSprite(xCor, yCor, male_body_img);
				armSprite = new FlxSprite(xCor + MALE_ARM_OFFSET_X, yCor + MALE_ARM_OFFSET_Y, male_arm_img);
				handSprite = new FlxSprite(xCor + MALE_HAND_OFFSET_X, yCor + MALE_HAND_OFFSET_Y, male_hand_img);
				faceSprite = new FlxSprite(xCor + MALE_NORMFACE_OFFSET_X, yCor + MALE_NORMFACE_OFFSET_Y, male_normFace_img);
			}
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
