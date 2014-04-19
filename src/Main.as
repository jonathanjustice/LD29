package{
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.geom.*;
	import flash.events.MouseEvent;
	import flash.display.*;
	import flash.ui.Mouse;
	import customEvents.SoundEvent;
	import Audio.SoundManager;
	import Audio.SoundObject;
	public class Main extends MovieClip{
		private var soundManager:SoundManager;
		public static var theStage:Object;
		public static var uiContainter:Object;
		public static var gameContainter:Object;
		private var isPaused:Boolean = false;
		
		//Screens
		
		public static var screen_start:SCREEN_START;
		
		//game objectd
		public function Main(){
			//trace("hello world");
			if (stage) init();
            else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		//once the stage exists, launch the game
        private function init(e:Event = null):void {
            removeEventListener(Event.ADDED_TO_STAGE, init);
			theStage = this.stage;
			uiContainter = this.stage;
			//stage.scaleMode = StageScaleMode.NO_SCALE;
			
			//stage.scaleMode = StageScaleMode.NO_SCALE;
			
			stage.scaleMode = StageScaleMode.EXACT_FIT;
			//stage.displayState = StageDisplayState.FULL_SCREEN;
			setUp();
        }
		//Main.theStage.dispatchEvent(new SoundEvent("SOUND_START","ENEMY_PICKED_UP"));
		private function setUp():void{
			soundManager = new SoundManager(theStage);
			trace("setup");
			trace("setup2");
			
			//Mouse.hide();
			//addKeyboardInput();
			//this.addEventListener(Event.ENTER_FRAME, updateScreenLocations);
			getStage().dispatchEvent(new SoundEvent("SOUND_START","TEST_SOUND"));
			screen_start = new SCREEN_START();
			//screenFlash_FULL = new screenFlash_Full();
		}
		
		public function getStage():Object{
			return theStage;
		}
		
		public function getMain():Object{
			return this;
		}
		
		public function gameState(newState:String):void{
			switch(newState){
				case "newGame":
					this.addEventListener(Event.ENTER_FRAME, mainUpdateLoop);
					//do stuff
					break;
				case "resumeUpdateLoop":
					
					//do stuff
					break;
				case "pauseUpdateLoop":
					isPaused = true;
					//do stuff
					break;
			}
		}
		
		private function mainUpdateLoop(e:Event):void{
			if(!isPaused){
				trace("gogogo");
			}
		}
		
	}
}