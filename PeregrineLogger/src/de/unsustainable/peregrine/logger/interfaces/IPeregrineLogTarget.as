package de.unsustainable.peregrine.logger.interfaces
{
	import de.unsustainable.peregrine.logger.PeregrineLogItem;

	public interface IPeregrineLogTarget
	{
		/**
		 * Procced log item
		 * @param some log item
		 * @param time past since the first log entry made
		 */
		function log(item:PeregrineLogItem, tp:Number):void;
		
		/**
		 * Add memory usage to log messages
		 */
		function set logMemory(value:Boolean):void;
		function get logMemory():Boolean;
		
	}
}