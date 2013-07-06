package
{
	import flash.geom.Rectangle;
	import mx.core.FlexSprite;
	import org.flixel.*;
	import org.flixel.system.FlxDebugger;

	public class PlayState extends FlxState
	{
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
		
		//placeholder variables
		public var player1: FlxSprite;
		public var player2: FlxSprite;
		public var player3: FlxSprite;
		public var player4: FlxSprite;
		public var player5: FlxSprite;
		
		public var bottomui: FlxSprite;
		
		//real variables
		public var playerBar1: PlayBar;
		public var playerBar2: PlayBar;
		public var playerBar3: PlayBar;
		public var playerBar4: PlayBar;
		public var playerBar5: PlayBar;
		
		public var pointer2:Pointer;
		public var pointer3:Pointer;
		public var pointer4:Pointer;
		public var pointer5:Pointer;
		
		//methods!
		public function PlayState()
		{
			//use create
		}

		override public function create():void
		{
			//make UI image
			bottomui = new FlxSprite(0, 320, bottomuiimage);
			
			//placeholder players
			player1 = new FlxSprite(0, 32, placeholderdude);
			player2 = new FlxSprite(192, 32, placeholderdude2);
			player3 = new FlxSprite(384, 32, placeholderdude);
			player4 = new FlxSprite(576, 32, placeholderdude2);
			player5 = new FlxSprite(768, 32, placeholderdude);
			
			//playbar
			playerBar1 = new PlayBar(player1.x + BAR_OFFSET_X, player1.y + BAR_OFFSET_Y, BAR_WIDTH, BAR_HEIGHT);
			playerBar2 = new PlayBar(player2.x + BAR_OFFSET_X, player2.y + BAR_OFFSET_Y, BAR_WIDTH, BAR_HEIGHT, playerBar1);
			playerBar3 = new PlayBar(player3.x + BAR_OFFSET_X, player3.y + BAR_OFFSET_Y, BAR_WIDTH, BAR_HEIGHT, playerBar2);
			playerBar4 = new PlayBar(player4.x + BAR_OFFSET_X, player4.y + BAR_OFFSET_Y, BAR_WIDTH, BAR_HEIGHT, playerBar3);
			playerBar5 = new PlayBar(player5.x + BAR_OFFSET_X, player5.y + BAR_OFFSET_Y, BAR_WIDTH, BAR_HEIGHT, playerBar4);
			
			pointer2 = new Pointer(playerBar1.x + BAR_WIDTH / 2, playerBar2.y + 32, 128);
			pointer3 = new Pointer(playerBar2.x + BAR_WIDTH / 2, playerBar3.y + 32, 128);
			pointer4 = new Pointer(playerBar3.x + BAR_WIDTH / 2, playerBar4.y + 32, 128);
			pointer5 = new Pointer(playerBar4.x + BAR_WIDTH / 2, playerBar5.y + 32, 128);
			
			//add all
			add(new FlxText(0, 0, 100, "INSERT GAME HERE"));
			add(bottomui);
			add(player1);
			add(player2);
			add(player3);
			add(player4);
			add(player5);
			
			add(playerBar1);
			add(playerBar2);
			add(playerBar3);
			add(playerBar4);
			add(playerBar5);
			add(pointer2);
			add(pointer3);
			add(pointer4);
			add(pointer5);
		}
	}
}
