package
{
	import org.flixel.*;
	import org.flixel.system.FlxDebugger;

	public class PlayState extends FlxState
	{
		public function PlayState()
		{
			
		}

		override public function create():void
		{
			add(new FlxText(0,0,100,"INSERT GAME HERE"));
			
			add(new PlayBar(20,20,150,PlayBar.spotRadius));
		}
	}
}
