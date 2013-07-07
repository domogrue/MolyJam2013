package
{
	import flash.geom.Rectangle;
	import mx.core.FlexSprite;
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		private var playBars:Array;
		private var players:Array;
		private var pointers:Array;

		private var excitementLevelFrame:FlxSprite;
		private var excitementLevel:FlxSprite;
		private var excitementScore:uint = 0;
		

		//data
		[Embed(source = "assets/bottomuiimage0000.png")] public static var bottomuiimage:Class;
		[Embed(source = "assets/placeholderdude0000.png")] public static var placeholderdude:Class;
		[Embed(source="assets/placeholderdude20000.png")] public static var placeholderdude2:Class;
		
		//CONSTANTS
		public static const WIDTH:Number = 960;
		public static const HEIGHT:Number = 480;
		public static const BAR_OFFSET_X:Number = 16;
		public static const BAR_OFFSET_Y:Number = 320;
		public static const BAR_WIDTH:Number = 160;
		public static const BAR_HEIGHT:Number = 32;
		
		public var bottomui: FlxSprite;
		
		public function PlayState()
		{
			//use create
		}

		override public function create():void
		{
			playBars = new Array();
			players = new Array();
			pointers = new Array();

			add(new FlxText(0,0,100,"INSERT GAME HERE"));
			
			//make UI image
			bottomui = new FlxSprite(0, 320, bottomuiimage);
			add(bottomui);

			
			excitementLevelFrame = new FlxSprite(0, BAR_OFFSET_Y);
			excitementLevelFrame.makeGraphic(192,16,0xff000000);
			excitementLevel = new FlxSprite(0, BAR_OFFSET_Y);
			excitementLevel.makeGraphic(1,16,0xff00ff00);
			add(excitementLevelFrame);
			add(excitementLevel);
			FlxG.log('excitementLevelFrame.width: ' + excitementLevelFrame.width);

			add(players[players.push(new FlxSprite(192*players.length,32))-1]);
			players[players.length-1].makeGraphic(192,288,0xffffff00);
			add(playBars[playBars.push(new PlayBar(players[players.length-1].x + BAR_OFFSET_X, players[players.length-1].y + BAR_OFFSET_Y, BAR_WIDTH, BAR_HEIGHT, 0, gSpotListener))-1]);
			//FlxG.log('playBars.length: ' + playBars.length);


			add(players[players.push(new FlxSprite(192*players.length,32))-1]);
			players[players.length-1].makeGraphic(192,288,0xffff00ff);
			add(playBars[playBars.push(new PlayBar(players[players.length-1].x + BAR_OFFSET_X, players[players.length-1].y + BAR_OFFSET_Y, BAR_WIDTH, BAR_HEIGHT, 1, gSpotListener, playBars[playBars.length-1]))-1]);
			add(pointers[pointers.push(new Pointer(playBars[playBars.length-2].x + BAR_WIDTH/2, playBars[playBars.length-1].y + 32, 128))-1]);
			//FlxG.log('playBars.length: ' + playBars.length);


			add(players[players.push(new FlxSprite(192*players.length,32))-1]);
			players[players.length-1].makeGraphic(192,288,0xff00ffff);
			add(playBars[playBars.push(new PlayBar(players[players.length-1].x + BAR_OFFSET_X, players[players.length-1].y + BAR_OFFSET_Y, BAR_WIDTH, BAR_HEIGHT, 2, gSpotListener, playBars[playBars.length-1]))-1]);
			add(pointers[pointers.push(new Pointer(playBars[playBars.length-2].x + BAR_WIDTH/2, playBars[playBars.length-1].y + 32, 128))-1]);
			//FlxG.log('playBars.length: ' + playBars.length);
		}

		public function gSpotListener():void {
			excitementScore += 1;

		}
	}
}
