package
{
	import org.flixel.*;
	[SWF(width="960", height="480", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]

	public class ItFeelsIncredible extends FlxGame
	{
		public function ItFeelsIncredible()
		{
			super(960,480,MenuState,1);
			forceDebugger = true;
		}
	}
}
