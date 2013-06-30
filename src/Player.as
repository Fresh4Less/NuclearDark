package  
{
	/**
	 * ...
	 * @author Elliot
	 */
	import org.flixel.*;
	public class Player extends FlxSprite
	{
		public function Player(X:Number, Y:Number) 
		{
			super(X, Y);
			this.makeGraphic(32, 52, 0xffff0000);
			
			maxVelocity.x = 200;
			maxVelocity.y = 2000;
			drag.x = maxVelocity.x * 4;
			drag.y = 0;
		}
		
		override public function update():void
		{				
			if (velocity.x > 0)
				facing = FlxObject.RIGHT;
			else if (velocity.x < 0)
				facing = FlxObject.LEFT;
				
			super.update();
		}
		
	}

}