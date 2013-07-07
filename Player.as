package
{
	import org.flixel.*;

	public class Player extends FlxGroup
	{
		//VISUALS
		[Embed(source = "assets/characters/BurtReynolds_Whole.png")]private var male_img:Class;
		[Embed(source = "assets/characters/BabeWhole.png")]private var female_img:Class;

		// AUDIO
		[Embed(source = "assets/audio/male/male1_norm1.mp3")]private var male1_norm1_snd:Class;
		[Embed(source = "assets/audio/male/male1_norm2.mp3")]private var male1_norm2_snd:Class;
		[Embed(source = "assets/audio/male/male1_norm3.mp3")]private var male1_norm3_snd:Class;
		[Embed(source = "assets/audio/male/male1_oface1.mp3")]private var male1_oface1_snd:Class;
		[Embed(source = "assets/audio/male/male1_oface2.mp3")]private var male1_oface2_snd:Class;
		[Embed(source = "assets/audio/male/male1_oface3.mp3")]private var male1_oface3_snd:Class;

		[Embed(source = "assets/audio/male/male2_norm1.mp3")]private var male2_norm1_snd:Class;
		[Embed(source = "assets/audio/male/male2_norm2.mp3")]private var male2_norm2_snd:Class;
		[Embed(source = "assets/audio/male/male2_norm3.mp3")]private var male2_norm3_snd:Class;
		[Embed(source = "assets/audio/male/male2_oface1.mp3")]private var male2_oface1_snd:Class;
		[Embed(source = "assets/audio/male/male2_oface2.mp3")]private var male2_oface2_snd:Class;
		[Embed(source = "assets/audio/male/male2_oface3.mp3")]private var male2_oface3_snd:Class;

		[Embed(source = "assets/audio/female/female_norm1.mp3")]private var female_norm1_snd:Class;
		[Embed(source = "assets/audio/female/female_norm2.mp3")]private var female_norm2_snd:Class;
		[Embed(source = "assets/audio/female/female_norm3.mp3")]private var female_norm3_snd:Class;
		
		private const WIGGLE_SPEED:Number = 0.7;
		private const WIGGLE_MAX:Number = 5;

		
		//Variables
		private var _x:Number;
		private var _y:Number;
		private var _wiggle_direction:Number = 1;
		private var _wiggle_count:Number = 0;
		private var _sounds:Array;

		public var type:String;
		public var wholeSprite:FlxSprite;
		
		public function Player(index:int,xIn:Number,yIn:Number,type:String)
		{
			_x = xIn;
			_y = yIn;
			_sounds = new Array();
			
			switch (index) {
			case 0:
				// do stuff
			case 1:
				// do other stuff
			}

			this.type = type;
			
			if (type == "male") {
				wholeSprite = new FlxSprite(x, y, male_img);

				var randRoll:Number = Math.floor(Math.random()*2);
				if ( randRoll == 0 ) {
					_sounds.push(male1_norm1_snd);
					_sounds.push(male1_norm2_snd);
					_sounds.push(male1_norm3_snd);
					_sounds.push(male1_oface1_snd);
					_sounds.push(male1_oface2_snd);
					_sounds.push(male1_oface3_snd);
				} else {
					_sounds.push(male2_norm1_snd);
					_sounds.push(male2_norm2_snd);
					_sounds.push(male2_norm3_snd);
					_sounds.push(male2_oface1_snd);
					_sounds.push(male2_oface2_snd);
					_sounds.push(male2_oface3_snd);
				}
				
			} 
			else if (type == "female") {
				wholeSprite = new FlxSprite(x, y, female_img);

				_sounds.push(female_norm1_snd);
				_sounds.push(female_norm2_snd);
				_sounds.push(female_norm3_snd);
			} else {
				// default to male
				wholeSprite = new FlxSprite(x, y, male_img);
			}

			add(wholeSprite);
		}

		public function playSound():void {
			FlxG.play(_sounds[Math.floor(Math.random()*_sounds.length)]);
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
			wholeSprite.x = inX;
		}
		
		public function set y(inY:Number):void {
			_y = inY;
			wholeSprite.y = inY;
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
