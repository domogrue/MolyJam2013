package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Jason Lee
	 */
	public class Pointer extends FlxSprite
	{
		[Embed(source = "assets/pointer.png")]private static var image_url:Class;
		
		public function Pointer(xIn:Number,yIn:Number)
		{
			super(xIn, yIn, image_url);
		}
		
	}

}