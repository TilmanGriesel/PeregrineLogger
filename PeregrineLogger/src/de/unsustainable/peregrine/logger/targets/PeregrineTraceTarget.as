package de.unsustainable.peregrine.logger.targets
{
	import flash.system.System;
	
	import de.unsustainable.peregrine.logger.PeregrineLogItem;
	import de.unsustainable.peregrine.logger.PeregrineLogLevel;
	import de.unsustainable.peregrine.logger.interfaces.IPeregrineLogTarget;

	public class PeregrineTraceTarget implements IPeregrineLogTarget
	{
		//--------------------------------------------------------------------------
		//
		//  Instance Properties
		//
		//--------------------------------------------------------------------------
		
		private var _logMemory:Boolean;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		
		public function PeregrineTraceTarget(logMemory:Boolean = false)
		{
			this._logMemory = logMemory;
		}

		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Procced log item
		 * @param some log item
		 * @param time past since the first log entry made
		 */
		public function log(item:PeregrineLogItem, tp:Number):void
		{
			traceOutItem(item, tp);
		}
		
		public function get logMemory():Boolean
		{
			return _logMemory;
		}
		
		public function set logMemory(value:Boolean):void
		{
			_logMemory = value;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Class methods
		//
		//--------------------------------------------------------------------------
		
		private function traceOutItem(item:PeregrineLogItem, tp:Number):void
		{
			// create output string
			var output:String = '';
			if(_logMemory) output += '[' + roundDecimal((System.totalMemoryNumber / 1024) / 1024, 2) + 'mb] ';
			output += '[' + tp + 'ms] ';
			output += '[' + PeregrineLogLevel.getByID(item.level) + '] ';
			output += '[' + item.fqcn + '] ';
			output += item.message;
			
			// trace out
			trace(output);
			
			// clean up
			item.dispose();
			item = null;
		}
		
		public static function roundDecimal(num:Number, precision:int):Number
		{	
			var decimal:Number = Math.pow(10, precision);	
			return Math.round(decimal* num) / decimal;
		}
	}
}