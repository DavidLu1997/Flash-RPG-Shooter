package
{
	import flash.display.Stage;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Main extends MovieClip
	{
		public var player:Player;
		public var bulletList:Array = [];
		
		public function Main():void
		{
			player = new Player(stage, 320, 240);
			stage.addChild(player);
			
			stage.addEventListener(MouseEvent.CLICK, shootBullet, false, 0, true);
			stage.addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}
		
		public function loop(e:Event):void
		{
			if(bulletList.length > 0)
			{
				for(var i:int = bulletList.length-1; i >= 0; i--)
				{
					bulletList[i].loop();
				}
			}
		}
		
		public function shootBullet(e:MouseEvent):void
		{
			var bullet:Bullet = new Bullet(stage, player.x, player.y, player.rotation);
			bullet.addEventListener(Event.REMOVED_FROM_STAGE, bulletRemoved, false, 0, true);
			bulletList.push(bullet);
			stage.addChild(bullet);
		}
		
		public function bulletRemoved(e:Event):void
		{
			e.currentTarget.removeEventListener(Event.REMOVED_FROM_STAGE, bulletRemoved);
			bulletList.splice(bulletList.indexOf(e.currentTarget),1);
		}
	}
}