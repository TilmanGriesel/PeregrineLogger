package de.unsustainable.peregrine.logger.interfaces
{
	public interface IPeregrineLogger
	{
		/**
		 * Log debug message (level id: 2)
		 */
		function debug(... argArray):void;
		
		/**
		 * Log info message (level id: 4)
		 */
		function info(... argArray):void;
		
		/**
		 * Log warn message (level id: 8)
		 */
		function warn(... argArray):void;
		
		/**
		 * Log error message (level id: 16)
		 */
		function error(... argArray):void;
		
		/**
		 * Log fatal message (level id: 32)
		 */
		function fatal(... argArray):void;
	}
}