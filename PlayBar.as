package
{
	import org.flixel.*;

	public class PlayBar extends FlxGroup
	{
		public static const spotRadius:Number = 10;
		public static const sweetSpotRange:Number = 30;
		public static const velocity:Number = 1;

		private var parentBar:PlayBar;
		private var frame:FlxSprite;
		private var playerSpot:FlxSprite;
		private var sweetSpot:FlxSprite;

		private var _x:Number;
		private var _y:Number;
		private var _width:Number;
		private var _height:Number;

		private var isForward:Boolean = true;

		public function PlayBar(x:Number, y:Number, width:Number, height:Number, parentBar:PlayBar = null)
		{
			super();

			FlxG.log('PlayBar.super() called');

			this._x = x;
			this._y = y;
			this._width = width;
			this._height = height;

			FlxG.log('position vars set');

			this.parentBar = parentBar;

			FlxG.log('parent bar set');
			
			this.frame = new FlxSprite(x,y);
			this.frame.makeGraphic(width, height, 0xff0000ff);

			FlxG.log('frame set');

			this.playerSpot = new FlxSprite(x + width/2 - PlayBar.spotRadius, y);
			this.playerSpot.makeGraphic(PlayBar.spotRadius, PlayBar.spotRadius, 0xffff0000);

			FlxG.log('playerSpot set');

			if ( parentBar == null ) {
				FlxG.log('parentBar is null');
				this.sweetSpot = new FlxSprite(x + width/10, y);
				this.sweetSpot.makeGraphic(width - width/5,height,0xffffffff);
			} else {
				FlxG.log('parentBar is not null');
				this.sweetSpot = new FlxSprite(parentBar.getSpotPosition().x - PlayBar.sweetSpotRange, y);
				this.sweetSpot.makeGraphic(PlayBar.sweetSpotRange*2,height,0xffffffff);
			}

			FlxG.log('sweetSpot set');

			this.add(this.frame);
			this.add(this.sweetSpot);
			this.add(this.playerSpot);

			FlxG.log('added frame, playerSpot, and sweetSpot to PlayBar');
		}

		override public function update():void {
			super.update();

			if ( this.parentBar == null ) {
				if ( this.isForward ) {
					if ( this.playerSpot.x + PlayBar.velocity + this.playerSpot.width < this._x + this._width) {
						this.playerSpot.x += PlayBar.velocity;
					} else {
						this.playerSpot.x = this._x + this._width - this.playerSpot.width;
						this.isForward = false;
					}
				} else {
					if ( this.playerSpot.x - PlayBar.velocity > this._x ) {
						this.playerSpot.x -= PlayBar.velocity;
					} else {
						this.playerSpot.x = this._x;
						this.isForward = true;
					}
				}
			}
		}

		public function getSpotPosition():FlxPoint {
			return new FlxPoint(this.playerSpot.x, this.playerSpot.y);
		}

		//SETS
		public function set x(in_x:Number):void {
			this._x = in_x;
		}

		public function set y(in_y:Number):void {
			this._y = in_y;
		}

		public function set width(in_width:Number):void {
			this._width = in_width;
		}

		public function set height(in_height:Number):void {
			this._height = in_height;
		}
		
		//GETS
		public function get x():Number {
			return this._x;
		}

		public function get y():Number {
			return this._y;
		}
	}
}