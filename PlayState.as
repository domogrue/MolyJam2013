package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		private var playBars:Array;
		private var players:Array;

		public function PlayState()
		{
			
		}

		override public function create():void
		{
			playBars = new Array();
			players = new Array();

			add(new FlxText(0,0,100,"INSERT GAME HERE"));
			
			add(players[players.push(new FlxSprite(192*players.length,32))-1]);
			players[players.length-1].makeGraphic(192,288,0xffffff00);

			add(playBars[playBars.push(new PlayBar(16,352,160,PlayBar.spotRadius, 0))-1]);
			//FlxG.log('playBars.length: ' + playBars.length);

			add(players[players.push(new FlxSprite(192*players.length,32))-1]);
			players[players.length-1].makeGraphic(192,288,0xffff00ff);

			add(playBars[playBars.push(new PlayBar(playBars[playBars.length-1].x + playBars[playBars.length-1].width + 32,352,160,PlayBar.spotRadius, 1, playBars[playBars.length-1]))-1]);
			//FlxG.log('playBars.length: ' + playBars.length);

			add(players[players.push(new FlxSprite(192*players.length,32))-1]);
			players[players.length-1].makeGraphic(192,288,0xff00ffff);

			add(playBars[playBars.push(new PlayBar(playBars[playBars.length-1].x + playBars[playBars.length-1].width + 32,352,160,PlayBar.spotRadius, 2, playBars[playBars.length-1]))-1]);
			//FlxG.log('playBars.length: ' + playBars.length);
		}
	}
}
