package
{
	import org.flixel.*;

	public class PlayBar extends FlxGroup
	{
		public static const sweetSpotRange:Number = 30;
		public static const spotVelocity:Number = 1;
		public static const sweetVelocity:Number = 0.7;
		public static const gSpotWidth:Number = 16;
		public static const gSpotVelocity:Number = 0.8;
		public static const spotRadius:Number = 5;

		private var frame:FlxSprite;
		private var playerSpot:FlxSprite;
		private var sweetSpot:FlxSprite;
		private var gSpot:FlxSprite;

		private var _x:Number;
		private var _y:Number;
		private var _width:Number;
		private var _height:Number;

		private var isForward:Boolean = true;
		private var gSpotDirection:int = 1;

		public var index:uint;
		public var parentBar:PlayBar;

		private var _gSpotCallback:Function;

		public function PlayBar(x:Number, y:Number, width:Number, height:Number,  index:uint, gSpotCallback:Function, parentBar:PlayBar = null)
		{
			super();

			this._x = x;
			this._y = y;
			this._width = width;
			this._height = height;

			this._gSpotCallback = gSpotCallback;

			this.index = index;

			FlxG.log('index is ' + this.index);

			this.parentBar = parentBar;
			
			this.frame = new FlxSprite(x,y);
			this.frame.makeGraphic(width, height, 0xff0000ff);

			this.playerSpot = new FlxSprite(x + width/2 - PlayBar.spotRadius, y);
			this.playerSpot.makeGraphic(PlayBar.spotRadius*2, this.height, 0xffff0000);

			if ( parentBar == null ) {
				this.sweetSpot = new FlxSprite(x + width/10, y);
				this.sweetSpot.makeGraphic(width - width/5,height,0xffffffff);
			} else {
				this.sweetSpot = new FlxSprite(parentBar.getSpotPosition().x - PlayBar.sweetSpotRange + parentBar.width + 32, y);
				this.sweetSpot.makeGraphic(PlayBar.sweetSpotRange*2,height,0xffffffff);
			}

			this.gSpot = new FlxSprite(this.sweetSpot.x + Math.floor(Math.random()*this.sweetSpot.width) - PlayBar.gSpotWidth, this.y);
			this.gSpot.makeGraphic(PlayBar.gSpotWidth, this.height, 0xff00ff00);

			this.add(this.frame);
			this.add(this.sweetSpot);
			this.add(this.gSpot);
			this.add(this.playerSpot);

			FlxG.log('Finished running create for index ' + this.index);
		}

		override public function update():void {
			//FlxG.log('running update');
			super.update();

			//FlxG.log('running moveSpot for index ' + this.index);
			moveSpot()
			moveSweetSpot();
			moveGSpot();

			checkForGSpotHit();
			//FlxG.log('finished moveSpot for index ' + this.index);
		}

		private function moveSpot():void
		{
			// if this is player 1
			if ( this.parentBar == null ) {
				if ( this.isForward ) {
					if ( this.playerSpot.x + PlayBar.spotVelocity + this.playerSpot.width < this._x + this._width) {
						this.playerSpot.x += PlayBar.spotVelocity;
					} else {
						this.playerSpot.x = this._x + this._width - this.playerSpot.width;
						this.isForward = false;
					}
				} else {
					if ( this.playerSpot.x - PlayBar.spotVelocity > this._x ) {
						this.playerSpot.x -= PlayBar.spotVelocity;
					} else {
						this.playerSpot.x = this._x;
						this.isForward = true;
					}
				}
			// otherwise, if it's not player 1
			} else {
				switch (index)
				{
				case 1: 
					if ( FlxG.keys.E && this.playerSpot.x - PlayBar.spotVelocity > this._x) {
						this.playerSpot.x -= PlayBar.spotVelocity;
					} else if ( FlxG.keys.R && this.playerSpot.x + PlayBar.spotVelocity < this._x + this._width) {
						this.playerSpot.x += PlayBar.spotVelocity;
					}
					break;
				case 2:
					if (FlxG.keys.T && this.playerSpot.x - PlayBar.spotVelocity > this._x) {
						this.playerSpot.x -= PlayBar.spotVelocity;
					} else if ( FlxG.keys.Y && this.playerSpot.x + PlayBar.spotVelocity < this._x + this._width) {
						this.playerSpot.x += PlayBar.spotVelocity;
					}
					break;
				case 3:
					if (FlxG.keys.U && this.playerSpot.x - PlayBar.spotVelocity > this._x) {
						this.playerSpot.x -= PlayBar.spotVelocity;
					} else if ( FlxG.keys.I && this.playerSpot.x + PlayBar.spotVelocity < this._x + this._width) {
						this.playerSpot.x += PlayBar.spotVelocity;
					}
					break;
				}
			}
		}

		private function moveSweetSpot():void {
			if ( this.parentBar != null ) {
				// if this sweet spot is to the left of the parent spot
				if ( this.sweetSpot.x + this.sweetSpot.width/2 < this.parentBar.getSpotPosition().x + this.parentBar.width + 32) {
					// if the sweet spot would go beyond the PlayBar, just set it to the right edge of the PlayBar
					if ( this.sweetSpot.x + this.sweetSpot.width + PlayBar.sweetVelocity > this.x + this.width ) {
						this.sweetSpot.x = this.x + this.width - this.sweetSpot.width;
					// otherwise, just move it towards the parent spot
					} else {
						this.sweetSpot.x += PlayBar.sweetVelocity;
					}
				// if the sweet spot is to the right of the parent spot
				} else if ( this.sweetSpot.x + this.sweetSpot.width/2 > this.parentBar.getSpotPosition().x  + this.parentBar.width + 32) {
					// if the sweet spot would go beyond the PlayBar, just set it to the right edge of the PlayBar
					if ( this.sweetSpot.x - PlayBar.sweetVelocity < this.x ) {
						this.sweetSpot.x = this.x;
					// otherwise, just move it towards the parent spot
					} else {
						this.sweetSpot.x -= PlayBar.sweetVelocity;
					}
				}
			}
		}

		private function moveGSpot():void {
			// if the gSpot intends to move still within the bounds of the sweetSpot...
			if ( this.gSpot.x + this.gSpot.width + PlayBar.gSpotVelocity*this.gSpotDirection < this.sweetSpot.x + this.sweetSpot.width &&
						this.gSpot.x + PlayBar.gSpotVelocity*this.gSpotDirection > this.sweetSpot.x) {
				// move it
				this.gSpot.x += PlayBar.gSpotVelocity*gSpotDirection;
				// otherwise, switch its direction
			} else {
				if ( this.gSpot.x + this.gSpot.width + PlayBar.gSpotVelocity*this.gSpotDirection > this.sweetSpot.x + this.sweetSpot.width ) {
					this.gSpot.x = this.sweetSpot.x + this.sweetSpot.width - this.gSpot.width;
				} else if ( this.gSpot.x + PlayBar.gSpotVelocity*this.gSpotDirection < this.sweetSpot.x ) {
					this.gSpot.x = this.sweetSpot.x;
				}
				this.gSpotDirection *= -1;
				this.gSpot.x += PlayBar.gSpotVelocity*gSpotDirection;
			}
		}

		private function checkForGSpotHit():void {
			if ( this.playerSpot.x > this.gSpot.x && 
						this.playerSpot.x + this.playerSpot.width < this.gSpot.x + this.gSpot.width ) {
				_gSpotCallback();
			}
		}

		public function getSpotPosition():FlxPoint {
			return new FlxPoint(this.playerSpot.x + this.playerSpot.width/2, this.playerSpot.y + this.playerSpot.height/2);
		}

		//SETS
		public function set x(in_x:Number):void {
			this._x = in_x;
		}

		public function set y(in_y:Number):void {
			this._y = in_y;
		}

		public function get x():Number {
			return this._x;
		}

		public function get y():Number {
			return this._y;
		}

		public function set width(in_width:Number):void {
			this._width = in_width;
		}

		public function set height(in_height:Number):void {
			this._height = in_height;
		}

		public function get width():Number {
			return this._width;
		}

		public function get height():Number {
			return this._height;
		}
	}
}
