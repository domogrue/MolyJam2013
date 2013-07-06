package
{
	import org.flixel.*;
	import org.flixel.system.FlxDebugger;

	public class PlayState extends FlxState
	{
		private var playBars:Array;

		public function PlayState()
		{
			
		}

		override public function create():void
		{
			playBars = new Array();

			add(new FlxText(0,0,100,"INSERT GAME HERE"));
			
			add(playBars[playBars.push(new PlayBar(20,20,150,PlayBar.spotRadius, 0))-1]);
			//FlxG.log('playBars.length: ' + playBars.length);

			add(playBars[playBars.push(new PlayBar(20,50,150,PlayBar.spotRadius, 1, playBars[playBars.length-1]))-1]);
			//FlxG.log('playBars.length: ' + playBars.length);

			add(playBars[playBars.push(new PlayBar(20,80,150,PlayBar.spotRadius, 2, playBars[playBars.length-1]))-1]);
			//FlxG.log('playBars.length: ' + playBars.length);
		}
	}
}
