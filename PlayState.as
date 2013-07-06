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
			
			FlxG.log('instantiating tempBar');
			var tempBar:PlayBar = new PlayBar(20,20,150,PlayBar.spotRadius, 0);
			FlxG.log('adding tempBar to playBars');
			playBars.push(tempBar);
			FlxG.log('playBars.size: ' + playBars.size);
			FlxG.log('trying to add(playBars.last)');
			add(playBars.last);
			FlxG.log('successfully completed add(playBars.last)');
			FlxG.log('playBars.last.lol: ' + playBars.last.lol);

			playBars.push(new PlayBar(20,20,150,PlayBar.spotRadius, 1, playBars.last));
			add(playBars.last);

			playBars.push(new PlayBar(20,20,150,PlayBar.spotRadius, 2, playBars.last));
			add(playBars.last);
		}
	}
}
