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
		
		public var pointer2:Pointer;
		
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
			playerBar1 = new PlayBar(player1.x+16, player1.y + 192 + 128, 160, 32);
			playerBar2 = new PlayBar(player2.x + 16, player2.y + 192 + 128, 160, 32, playerBar1);
			
			pointer2 = new Pointer(player1.x + 16 + 80 - 8, player1.y + 192 + 128 + 32 + 4);
			
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
			add(pointer2);
		}
	}
}
