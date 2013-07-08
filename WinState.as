package
{
	import org.flixel.*;
	import PlayState;

	public class WinState extends FlxState
	{
		[Embed(source = "assets/credits.jpg")]private var image;
		private var sprite:FlxSprite;
		
		public function WinState()
		{
			/*
			var t:FlxText;
			t = new FlxText(0,FlxG.height/2-10,FlxG.width,"You win!");
			t.size = 32;
			t.alignment = "center";
			add(t);
			t = new FlxText(FlxG.width/2-50,FlxG.height-20,100,"click to replay");
			t.alignment = "center";
			add(t);*/
			sprite = new FlxSprite(0, 0, image);
		}

		override public function update():void
		{
			if(FlxG.mouse.justPressed())
				FlxG.switchState(new PlayState());
		}
	}
}
