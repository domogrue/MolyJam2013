package  
{
	import org.flixel.*;
	
	public class PlayBar extends FlxSprite
	{
		//CONSTANTS
		private const WIDTH:Number = 160;
		private const HEIGHT:Number = 32;
		
		//import data
		[Embed(source="assets/playbar0000.png")] public static var _image_playbar:Class
		
		//variables
		public var barSprite: FlxSprite;
		public var sweetSpot: SweetSpot;
		
		public function PlayBar(xIn:Number,yIn:Number) 
		{
			super(xIn, yIn, _image_playbar);
			var randX = Math.random()*WIDTH/10;
			var randW = Math.random()*WIDTH/2;
			var ssx = Math.round(x + randX);
			var ssw = Math.round(80 + randW);
			trace("ssx is " + ssx);
			trace("ssw is " + ssw);
			
			sweetSpot = new SweetSpot(ssx, y, ssw);
		}
		
	}

}