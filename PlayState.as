package
{
	import flash.filters.DisplacementMapFilter;
	import flash.geom.Rectangle;
	import mx.core.FlexSprite;
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		private var playBars:Array;
		private var players:Array;
		private var pointers:Array;
		
		//map and arrays for keys
		private var keys_image_off:Array;
		private var keys_image_on:Array;
		private var keys_off:Array;
		private var keys_on:Array;

		private var excitementLevelFrame:FlxSprite;
		private var excitementLevel:FlxSprite;
		private var excitementScore:Number = 0;
		private var excitementThreshold:Number = 100;

		//data
		[Embed(source = "assets/bottomui.jpg")] private var bottomuiimage:Class;
		[Embed(source="assets/pattern_001_1600x1200_texture_wallpaper.jpg")] private var backgroundImg:Class;
		
		//data for keypresses
		[Embed(source = "assets/keys/e_off.png")] private var key_off1:Class;
		[Embed(source = "assets/keys/e_on.png")] private var key_on1:Class;
		[Embed(source = "assets/keys/i_off.png")] private var key_off8:Class;
		[Embed(source = "assets/keys/i_on.png")] private var key_on8:Class;
		[Embed(source = "assets/keys/o_off.png")] private var key_off7:Class;
		[Embed(source = "assets/keys/o_on.png")] private var key_on7:Class;
		[Embed(source = "assets/keys/p_off.png")] private var key_off9:Class;
		[Embed(source = "assets/keys/p_on.png")] private var key_on9:Class;
		[Embed(source = "assets/keys/q_off.png")] private var key_off0:Class;
		[Embed(source = "assets/keys/q_on.png")] private var key_on0:Class;
		[Embed(source = "assets/keys/r_off.png")] private var key_off4:Class;
		[Embed(source = "assets/keys/r_on.png")] private var key_on4:Class;
		[Embed(source = "assets/keys/t_off.png")] private var key_off3:Class;
		[Embed(source = "assets/keys/t_on.png")] private var key_on3:Class;
		[Embed(source = "assets/keys/u_off.png")] private var key_off5:Class;
		[Embed(source = "assets/keys/u_on.png")] private var key_on5:Class;
		[Embed(source = "assets/keys/w_off.png")] private var key_off2:Class;
		[Embed(source = "assets/keys/w_on.png")] private var key_on2:Class;
		[Embed(source = "assets/keys/y_off.png")] private var key_off6:Class;
		[Embed(source = "assets/keys/y_on.png")] private var key_on6:Class;
		
		
		//CONSTANTS
		public const WIDTH:Number = 960;
		public const HEIGHT:Number = 480;
		public const BAR_OFFSET_X:Number = 16;
		//public const BAR_OFFSET_Y:Number = 320;
		public const BAR_OFFSET_Y:Number = 280;
		public const BAR_WIDTH:Number = 160;
		public const BAR_HEIGHT:Number = 32;
		public const EXCITEINCREMENET:Number = 0.2;
		
		private var bottomui: FlxSprite;
		private var background:FlxSprite;

		private var playerGroup:FlxGroup;
		private var uiGroup:FlxGroup;
		
		public function PlayState()
		{
			//use create
		}

		override public function create():void
		{
			playBars = new Array();
			players = new Array();
			pointers = new Array();

			playerGroup = new FlxGroup();
			uiGroup = new FlxGroup();

			add(new FlxText(0,0,100,"INSERT GAME HERE"));
			
			background = new FlxSprite(0,0,backgroundImg);
			add(background);

			add(playerGroup);
			add(uiGroup);

			//make UI image
			bottomui = new FlxSprite(0, BAR_OFFSET_Y, bottomuiimage);
			uiGroup.add(bottomui);

			
			excitementLevelFrame = new FlxSprite(0, BAR_OFFSET_Y);
			excitementLevelFrame.makeGraphic(192,16,0xff000000);
			excitementLevel = new FlxSprite(0, BAR_OFFSET_Y);
			excitementLevel.makeGraphic(1,16,0xff00ff00);
			uiGroup.add(excitementLevelFrame);
			uiGroup.add(excitementLevel);
			FlxG.log('excitementLevelFrame.width: ' + excitementLevelFrame.width);

			//add(players[players.push(new FlxSprite(192*players.length,32))-1]);
			playerGroup.add(players[players.push(new Player(0,192*players.length,32,'male'))-1]);
			//players[players.length-1].makeGraphic(192,288,0xffffff00);
			uiGroup.add(playBars[playBars.push(new PlayBar(players[players.length-1].x + BAR_OFFSET_X, players[players.length-1].y + BAR_OFFSET_Y, BAR_WIDTH, BAR_HEIGHT, 0, gSpotListener, players[players.length-1]))-1]);
			//FlxG.log('playBars.length: ' + playBars.length);


			/*add(players[players.push(new FlxSprite(192*players.length,32))-1]);
			players[players.length-1].makeGraphic(192,288,0xffff00ff);
			add(playBars[playBars.push(new PlayBar(players[players.length-1].x + BAR_OFFSET_X, players[players.length-1].y + BAR_OFFSET_Y, BAR_WIDTH, BAR_HEIGHT, 1, gSpotListener, pointers[players.length-1], playBars[playBars.length-1]))-1]);
			add(pointers[pointers.push(new Pointer(playBars[playBars.length-2].x + BAR_WIDTH/2, playBars[playBars.length-1].y + 32, 128, 'E', 'R', playBars[playBars.length - 2])) - 1]);
			playBars[1].pointer = pointers[0];
			//FlxG.log('playBars.length: ' + playBars.length);


			add(players[players.push(new FlxSprite(192*players.length,32))-1]);
			players[players.length - 1].makeGraphic(192, 288, 0xff00ffff);
			add(playBars[playBars.push(new PlayBar(players[players.length-1].x + BAR_OFFSET_X, players[players.length-1].y + BAR_OFFSET_Y, BAR_WIDTH, BAR_HEIGHT, 2, gSpotListener, pointers[players.length-1], playBars[playBars.length-1]))-1]);
			add(pointers[pointers.push(new Pointer(playBars[playBars.length-2].x + BAR_WIDTH/2, playBars[playBars.length-2].y + 32, 128, 'T', 'Y', playBars[playBars.length - 2])) - 1]);
			playBars[2].pointer = pointers[1];
			//FlxG.log('playBars.length: ' + playBars.length);*/
			
			//adding key images
			keys_image_off = new Array(10);
			keys_image_off[0] = key_off0;
			keys_image_off[1] = key_off1;
			keys_image_off[2] = key_off2;
			keys_image_off[3] = key_off3;
			keys_image_off[4] = key_off4;
			keys_image_off[5] = key_off5;
			keys_image_off[6] = key_off6;
			keys_image_off[7] = key_off7;
			keys_image_off[8] = key_off8;
			keys_image_off[9] = key_off9;
			keys_image_on = new Array(10);
			keys_image_on[0] = key_on0;
			keys_image_on[1] = key_on1;
			keys_image_on[2] = key_on2;
			keys_image_on[3] = key_on3;
			keys_image_on[4] = key_on4;
			keys_image_on[5] = key_on5;
			keys_image_on[6] = key_on6;
			keys_image_on[7] = key_on7;
			keys_image_on[8] = key_on8;
			keys_image_on[9] = key_on9;
			
			//adding keys
			keys_off = new Array();
			keys_on = new Array();
			
			for (var i:uint = 0; i < 10; i++) {
				var keyX:Number;
				var keyY:Number = FlxG.height-96;
				var image_off:Class = keys_image_off[i];
				var image_on:Class = keys_image_on[i];
				
				if (i % 2 == 0) {
					keyX = 192 * i / 2 + 48;
				} else {
					keyX = 192 * (i + 1) / 2 - 64;
				}
				keys_off.push(new FlxSprite(keyX, keyY, image_off));
				keys_on.push(new FlxSprite(keyX, keyY, image_on));
				keys_on[i].visible = false;
				
				add(keys_off[i]);
				add(keys_on[i]);
			}
		}

		public function gSpotListener(direction:Boolean):void {
			if ( direction ) {
				excitementScore += EXCITEINCREMENET/players.length;
				
				if ( players.length < 5 ) {
					if ( excitementScore > excitementThreshold ) {
						excitementLevelFrame.makeGraphic(excitementLevelFrame.width + 192,16,0xff000000);
						excitementThreshold += 100;

						addPlayer();
					}
				}
			} else if ( !direction ) {
				excitementScore -= EXCITEINCREMENET/players.length;
			}

			var excitementPercentage:Number = excitementScore/excitementThreshold;
			//FlxG.log("excitementScore: " + excitementScore + "\nexcitementPercentage: " + excitementPercentage);
			
			try {
				excitementLevel.makeGraphic(excitementPercentage * excitementLevelFrame.width,16,0xff00ff00);
			} catch (error:ArgumentError) {
				trace('error in setting excitementLevel width. ignoring.');
			}
		}

		private function addPlayer():void {
			//try {
			
			//add(players[players.push(new FlxSprite(192*players.length,32))-1]);
			playerGroup.add(players[players.push(new Player(0,192*players.length,32,'male'))-1]);
			//players[players.length - 1].makeGraphic(192, 288, 0xff00ffff);
			uiGroup.add(playBars[playBars.push(new PlayBar(players[players.length-1].x + BAR_OFFSET_X, players[players.length-1].y + BAR_OFFSET_Y, BAR_WIDTH, BAR_HEIGHT, players.length-1, gSpotListener, players[players.length-1], pointers[players.length-1], playBars[playBars.length-1]))-1]);

			var keyArr:Array = new Array();
			switch (players.length) {
				case 2:
					//keyArr.push('E');
					//keyArr.push('R');
					keyArr.push('W');
					keyArr.push('T');
					break
				case 3:
					//keyArr.push('T');
					//keyArr.push('Y');
					keyArr.push('R');
					keyArr.push('U');
					break
				case 4:
					//keyArr.push('U');
					//keyArr.push('I');
					keyArr.push('Y');
					keyArr.push('O');
					break
				case 5:
					//keyArr.push('O');
					//keyArr.push('P');
					keyArr.push('I');
					keyArr.push('P');
					break
			}
			uiGroup.add(pointers[pointers.push(new Pointer(playBars[playBars.length-2].x + BAR_WIDTH/2, playBars[playBars.length-2].y + 32, 128, keyArr[0], keyArr[1], playBars[playBars.length - 2],players[players.length-1])) - 1]);
			
			playBars[playBars.length-1].pointer = pointers[pointers.length-1];
			//} catch (error:Error) { FlxG.log('error: ' + error); }
		}
		
		override public function update():void
		{
			super.update();
			
			(FlxG.keys.Q) ? keys_on[0].visible = true : keys_on[0].visible = false;
			(FlxG.keys.E) ? keys_on[1].visible = true : keys_on[1].visible = false;
			(FlxG.keys.W) ? keys_on[2].visible = true : keys_on[2].visible = false;
			(FlxG.keys.T) ? keys_on[3].visible = true : keys_on[3].visible = false;
			(FlxG.keys.R) ? keys_on[4].visible = true : keys_on[4].visible = false;
			(FlxG.keys.U) ? keys_on[5].visible = true : keys_on[5].visible = false;
			(FlxG.keys.Y) ? keys_on[6].visible = true : keys_on[6].visible = false;
			(FlxG.keys.O) ? keys_on[7].visible = true : keys_on[7].visible = false;
			(FlxG.keys.I) ? keys_on[8].visible = true : keys_on[8].visible = false;
			(FlxG.keys.P) ? keys_on[9].visible = true : keys_on[9].visible = false;
		}
	}
}
