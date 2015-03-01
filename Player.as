package
{
	import flash.display.Stage;
	import flash.display.MovieClip;
	import flash.events.Event;
	import KeyObject;
	
	public class Player extends MovieClip
	{
		public var stageRef:Stage;
		public var key:KeyObject;
		
		public var leftPressed:Boolean = false;
		public var rightPressed:Boolean = false;
		public var upPressed:Boolean = false;
		public var downPressed:Boolean = false;
		
		public var speed:Number = 5;
		
		public function Player(stageRef:Stage, X:int, Y:int):void
		{
			this.stageRef = stageRef;
			this.x = X;
			this.y = Y;
			
			key = new KeyObject(stageRef);
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}
		
		public function loop(e:Event):void
		{
			checkKeypresses();
			
			if(leftPressed)
			{
				x -= speed;
			}
			if(rightPressed)
			{
				x += speed;
			}
			
			if(upPressed)
			{
				y -= speed;
			}
			if(downPressed)
			{
				y += speed;
			}
			
			rotation = Math.atan2(stageRef.mouseY - y, stageRef.mouseX - x) * 180/Math.PI;
		}
		
		public function checkKeypresses():void
		{
			if(key.isDown(37) || key.isDown(65))
			{
				leftPressed = true;
			}
			else
			{
				leftPressed = false;
			}
			
			if(key.isDown(38) || key.isDown(87))
			{
				upPressed = true;
			}
			else
			{
				upPressed = false;
			}
			
			if(key.isDown(39) || key.isDown(68))
			{
				rightPressed = true;
			}
			else
			{
				rightPressed = false;
			}
			
			if(key.isDown(40) || key.isDown(83))
			{
				downPressed = true;
			}
			else
			{
				downPressed = false;
			}
		}
	}
}