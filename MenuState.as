package
{
	import org.flixel.*;
	import PlayState;

	public class MenuState extends FlxState
	{
		[Embed(source = "assets/ItFeelsTitle03.png")]private var title_img:Class;

		public function MenuState()
		{
			var titleImg:FlxSprite = new FlxSprite(0,0,title_img);
			add(titleImg);

			var t:FlxText;
			/*t = new FlxText(0,FlxG.height/2-10,FlxG.width,"It Feels Incredible!");
			t.size = 32;
			t.alignment = "center";
			add(t);*/
			t = new FlxText(FlxG.width/2-50,FlxG.height-20,100,"click to play");
			t.alignment = "center";
			add(t);
		}

		override public function update():void
		{
			if(FlxG.mouse.justPressed())
				FlxG.switchState(new PlayState());
		}
	}
}
