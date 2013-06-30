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
			
			add(platforms);
			add(player);
		}
		
		override public function update():void
		{
			
			player.acceleration.x = 0;
			player.acceleration.y = 900;
			handleInputPre();
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
	}
}