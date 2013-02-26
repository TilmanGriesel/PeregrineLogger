package de.unsustainable.peregrine.logger
{
	import de.unsustainable.peregrine.logger.interfaces.IPeregrineLogger;

	public class PeregrineLogger implements IPeregrineLogger
	{
		//--------------------------------------------------------------------------
		//
		//  Instance Properties
		//
		//--------------------------------------------------------------------------
		
		private var _callback:Function;
		private var _fqcn:String = '';
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Creates an new Peregrine logger instance.
		 * Define the full qualifed class name and an callback fuction for log entrys.
		 */
		public function PeregrineLogger(fqcn:String, callback:Function)
		{
			_fqcn = fqcn;
			_callback = callback;
		}
		
		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Log debug message (level id: 2)
		 */
		public function debug(... argArray):void
		{
			proceedLogMessage(2, argArray);
		}
		
		/**
		 * Log info message (level id: 4)
		 */
		public function info(... argArray):void
		{
			proceedLogMessage(4, argArray);
		}
		
		/**
		 * Log warn message (level id: 8)
		 */
		public function warn(... argArray):void
		{
			proceedLogMessage(8, argArray);	
		}

		/**
		 * Log error message (level id: 16)
		 */
		public function error(... argArray):void
		{
			proceedLogMessage(16, argArray);	
		}
		
		/**
		 * Log fatal message (level id: 32)
		 */
		public function fatal(... argArray):void
		{
			proceedLogMessage(32, argArray);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Class Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Fire log message to callback
		 */
		private function proceedLogMessage(level, argArray:Array):void
		{
			var time:Number = new Date().getTime();
			
			var message:String = argArray[0] != null ? argArray[0] : '';
			if(argArray.length > 1)
			{
				for(var i:int = 1; i < argArray.length; i++)
				{
					message = message + ' ' + argArray[i]; 
				}			
			}
			_callback(new PeregrineLogItem(time, level, _fqcn, message));
			
			message = null;
			argArray = null;
		}
	}
}