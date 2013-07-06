package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Jason Lee
	 */
	public class Pointer extends FlxSprite
	{
		[Embed(source = "assets/sweetSpot.png")]private static var image_url:Class;
		
		public function Pointer(xIn:Number,yIn:Number,widthIn:Number)
		{
			super(xIn, yIn, image_url);
			this.origin.x = this.origin.y = 0;
			this.scale.x = widthIn;
		}
		
	}

}