package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Jason Lee
	 */
	public class SweetSpot extends FlxSprite
	{
		//data
		[Embed(source = "assets/sweetSpot.png")]public static var imageURL:Class;
		
		public function SweetSpot(xIn:Number,yIn:Number,widthIn:Number) 
		{
			super(xIn, yIn, imageURL);
			this.origin.x = this.origin.y = 0;
			this.scale.x = widthIn;
		}
		
	}

}