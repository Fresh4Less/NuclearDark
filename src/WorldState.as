package  
{
	/**
	 * ...
	 * @author Elliot
	 */
	import adobe.utils.CustomActions;
	import flash.display.SpreadMethod;
	import org.flixel.*;
	
	public class WorldState extends FlxState 
	{
		
		public var player:Player;
		
		public var platforms:FlxGroup;
		
		override public function create():void
		{
			player = new Player(0, 0);
			
			platforms = new FlxGroup();
			
			var floor:FlxSprite = new FlxSprite(0, FlxG.height / 2 - 100);
			floor.immovable = true;
			floor.makeGraphic(FlxG.width, 10, 0xffffcc99);
			
			platforms.add(floor);
			
			var back:FlxSprite = new FlxSprite(300, 300);
			back.makeGraphic(32, 32, 0xffaaffaa);
			add(back);
			
			add(platforms);
			add(player);
		}
		
		override public function update():void
		{
			
			player.acceleration.x = 0;
			player.acceleration.y = 900;
			handleInputPre();
			updateCameraPosition();
			super.update();
			handleInputPost();
		}
		
		override public function draw():void
		{
			super.draw()
		}
		
		public function handleInputPre():void
		{
			if (FlxG.keys.LEFT)
				player.acceleration.x = - player.maxVelocity.x * 8;
			if (FlxG.keys.RIGHT)
				player.acceleration.x = player.maxVelocity.x * 8;			
		}
		
		public function handleInputPost():void
		{
			if (FlxG.collide(player, platforms) && FlxG.keys.justPressed("Z"))
			{
				player.velocity.y = -500;
			}
		}
		
		public function updateCameraPosition():void
		{
			var cameraTarget:FlxPoint = new FlxPoint( -player.x - player.width / 2 + FlxG.stage.stageWidth / 2 , 0); //-player.y - player.height/2 + FlxG.stage.stageHeight / 2);
			//if (player.facing == FlxObject.RIGHT)
			//	cameraTarget.x -= FlxG.stage.stageWidth * 0.2;
			//else if (player.facing == FlxObject.LEFT)
			//	cameraTarget.x += FlxG.stage.stageWidth * 0.2;
			cameraTarget.x -= player.velocity.x * .5;
				
			FlxG.camera.x -= 0.05 * (FlxG.camera.x - cameraTarget.x);
			if (FlxG.camera.x > 0)
				FlxG.camera.x = 0;
			if (FlxG.camera.x < FlxG.width * -1 + FlxG.stage.stageWidth)
				FlxG.camera.x = FlxG.width * -1 + FlxG.stage.stageWidth;
				
			//FlxG.camera.y -= 0.05 * (FlxG.camera.y - cameraTarget.y);
		}
	}
}