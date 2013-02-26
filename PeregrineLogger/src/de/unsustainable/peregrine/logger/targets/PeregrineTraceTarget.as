package de.unsustainable.peregrine.logger.targets
{
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
			trace('[' + tp + 'ms]', '[' + PeregrineLogLevel.getByID(item.level) + ']', '[' + item.fqcn + ']', item.message);
			item.dispose();
			item = null;
		}
	}
}