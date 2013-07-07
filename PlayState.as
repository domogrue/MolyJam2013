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
		private var excitementScore:Number = 0;
		private var excitementThreshold:Number = 100;

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
		public static const EXCITEINCREMENET:Number = 0.5;
		
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


			/*add(players[players.push(new FlxSprite(192*players.length,32))-1]);
			players[players.length-1].makeGraphic(192,288,0xffff00ff);
			add(playBars[playBars.push(new PlayBar(players[players.length-1].x + BAR_OFFSET_X, players[players.length-1].y + BAR_OFFSET_Y, BAR_WIDTH, BAR_HEIGHT, 1, gSpotListener, pointers[players.length-1], playBars[playBars.length-1]))-1]);
			add(pointers[pointers.push(new Pointer(playBars[playBars.length-2].x + BAR_WIDTH/2, playBars[playBars.length-1].y + 32, 128, 'E', 'R', playBars[playBars.length - 2])) - 1]);
			playBars[1].pointer = pointers[0];
			//FlxG.log('playBars.length: ' + playBars.length);


			add(players[players.push(new FlxSprite(192*players.length,32))-1]);
			players[players.length - 1].makeGraphic(192, 288, 0xff00ffff);
			add(playBars[playBars.push(new PlayBar(players[players.length-1].x + BAR_OFFSET_X, players[players.length-1].y + BAR_OFFSET_Y, BAR_WIDTH, BAR_HEIGHT, 2, gSpotListener, pointers[players.length-1], playBars[playBars.length-1]))-1]);
			add(pointers[pointers.push(new Pointer(playBars[playBars.length-2].x + BAR_WIDTH/2, playBars[playBars.length-2].y + 32, 128, 'T', 'Y', playBars[playBars.length - 2])) - 1]);
			playBars[2].pointer = pointers[1];
			//FlxG.log('playBars.length: ' + playBars.length);*/
		}

		public function gSpotListener():void {
			excitementScore += EXCITEINCREMENET/players.length;
			var excitementPercentage:Number = excitementScore/excitementThreshold;
			//FlxG.log("excitementScore: " + excitementScore + "\nexcitementPercentage: " + excitementPercentage);
			
<<<<<<< HEAD
			try {
				//trace("excitementpercentage is "+excitementPercentage);
				excitementLevel.makeGraphic(excitementPercentage * excitementLevelFrame.width, 16, 0xff00ff00);
			}catch (error:Error) {
				trace("excitementpercentage is "+excitementPercentage);
			}
			
			if ( excitementScore > excitementThreshold ) {
				excitementLevelFrame.makeGraphic(excitementLevelFrame.width + 192,16,0xff000000);
				excitementThreshold += 100;
=======
			excitementLevel.makeGraphic(excitementPercentage * excitementLevelFrame.width,16,0xff00ff00);

			if ( players.length < 5 ) {
				if ( excitementScore > excitementThreshold ) {
					excitementLevelFrame.makeGraphic(excitementLevelFrame.width + 192,16,0xff000000);
					excitementThreshold += 100;

					addPlayer();
				}
>>>>>>> 7f0ea5b505aab40f09424f7e1e9abb466609025b
			}
		}

		private function addPlayer():void {
			FlxG.log('players.length: ' + players.length);

			add(players[players.push(new FlxSprite(192*players.length,32))-1]);
			players[players.length - 1].makeGraphic(192, 288, 0xff00ffff);
			add(playBars[playBars.push(new PlayBar(players[players.length-1].x + BAR_OFFSET_X, players[players.length-1].y + BAR_OFFSET_Y, BAR_WIDTH, BAR_HEIGHT, players.length-1, gSpotListener, pointers[players.length-1], playBars[playBars.length-1]))-1]);

			var keyArr:Array = new Array();
			switch (players.length) {
				case 2:
					keyArr.push('E');
					keyArr.push('R');
					break
				case 3:
					keyArr.push('T');
					keyArr.push('Y');
					break
				case 4:
					keyArr.push('U');
					keyArr.push('I');
					break
				case 5:
					keyArr.push('O');
					keyArr.push('P');
					break
			}
			add(pointers[pointers.push(new Pointer(playBars[playBars.length-2].x + BAR_WIDTH/2, playBars[playBars.length-2].y + 32, 128, keyArr[0], keyArr[1], playBars[playBars.length - 2])) - 1]);
			
			playBars[playBars.length-1].pointer = pointers[pointers.length-1];
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}
