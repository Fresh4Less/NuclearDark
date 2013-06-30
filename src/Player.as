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
			
			super.update();
		}
		
	}

}