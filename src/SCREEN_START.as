﻿package {
	import flash.events.MouseEvent;
	import flash.events.*;
	import flash.display.MovieClip;
	import default_screen;
	public class SCREEN_START extends default_screen{
		public function SCREEN_START (){
			stop();
			stopAllButtonsFromAnimating();
			setUp();
		}
		
		public function playRemoveScreenAnimation(e:Event):void{
			this.alpha -=.05;
			if(this.alpha <= 0){
				this.alpha = 0;
				this.removeEventListener(Event.ENTER_FRAME, playRemoveScreenAnimation);
					removeThisScreen();
					trace("Main",Main);
//					Main.getMain().gameState("newGame");
			}
		}
		
		public override function clickHandler(event:MouseEvent):void{
			//defined in other classes
			trace("event.target.parent.name:", event.target.parent.name);
			switch(event.target.parent.name){
				case "btn_start":
					//do stuff
					trace("start");
					this.addEventListener(Event.ENTER_FRAME, playRemoveScreenAnimation);
					break;
			}
		}
		
		public override function stageClickHandler(event:MouseEvent):void{
			//defined in other classes
		}
		
		public override function downHandler(event:MouseEvent):void {
			//trace(event.target.name);
			if (event.target.name.indexOf("hitbox") != -1) {
				event.target.parent.gotoAndStop("clicked");
			}
		}
		
		public override function upHandler(event:MouseEvent):void {
			//trace(event.target.name);
			if (event.target.name.indexOf("hitbox") != -1) {
				event.target.parent.gotoAndStop("up");
			}
		}
		
		public override function overHandler(event:MouseEvent):void {
			//trace(event.target.name);
			if (event.target.name.indexOf("hitbox") != -1) {
				event.target.parent.gotoAndStop("over");
			}
		}
		
		public override function outHandler(event:MouseEvent):void {
			//trace(event.target.name);
			if (event.target.name.indexOf("hitbox") != -1) {
				event.target.parent.gotoAndStop("up");
			}
		}
	}
}