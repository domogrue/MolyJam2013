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

		private var index:uint;
		private var isForward:Boolean = true;

		public var lol:uint = 5;

		public function PlayBar(x:Number, y:Number, width:Number, height:Number,  index:uint, parentBar:PlayBar = null)
		{
			super();

			this._x = x;
			this._y = y;
			this._width = width;
			this._height = height;

			this.index = index;

			FlxG.log('index is ' + this.index);

			this.parentBar = parentBar;
			
			this.frame = new FlxSprite(x,y);
			this.frame.makeGraphic(width, height, 0xff0000ff);

			this.playerSpot = new FlxSprite(x + width/2 - PlayBar.spotRadius, y);
			this.playerSpot.makeGraphic(PlayBar.spotRadius, PlayBar.spotRadius, 0xffff0000);

			if ( parentBar == null ) {
				this.sweetSpot = new FlxSprite(x + width/10, y);
				this.sweetSpot.makeGraphic(width - width/5,height,0xffffffff);
			} else {
				this.sweetSpot = new FlxSprite(parentBar.getSpotPosition().x - PlayBar.sweetSpotRange, y);
				this.sweetSpot.makeGraphic(PlayBar.sweetSpotRange*2,height,0xffffffff);
			}

			this.add(this.frame);
			this.add(this.sweetSpot);
			this.add(this.playerSpot);

			FlxG.log('Finished running create for index ' + this.index);
		}

		override public function update():void {
			FlxG.log('running update');
			super.update();

			FlxG.log('running moveSpot for index ' + this.index);
			moveSpot()
			FlxG.log('finished moveSpot for index ' + this.index);
		}

		private function moveSpot():void
		{
			// if this is player 1
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
			// otherwise, if it's not player 1
			} else {
				switch (index)
				{
				case 1: 
					if ( FlxG.keys.E && this.playerSpot.x - PlayBar.velocity > this._x) {
						this.playerSpot.x -= PlayBar.velocity;
					} else if ( FlxG.keys.R && this.playerSpot.x + PlayBar.velocity < this._x + this._width) {
						this.playerSpot.x += PlayBar.velocity;
					}
				case 2:
					if (FlxG.keys.T && this.playerSpot.x - PlayBar.velocity > this._x) {
						this.playerSpot.x -= PlayBar.velocity;
					} else if ( FlxG.keys.Y && this.playerSpot.x + PlayBar.velocity < this._x + this._width) {
						this.playerSpot.x += PlayBar.velocity;
					}
				case 3:
					if (FlxG.keys.Y && this.playerSpot.x - PlayBar.velocity > this._x) {
						this.playerSpot.x -= PlayBar.velocity;
					} else if ( FlxG.keys.U && this.playerSpot.x + PlayBar.velocity < this._x + this._width) {
						this.playerSpot.x += PlayBar.velocity;
					}
				}
			}
		}

		public function getSpotPosition():FlxPoint {
			return new FlxPoint(this.playerSpot.x, this.playerSpot.y);
		}

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
	}
}
