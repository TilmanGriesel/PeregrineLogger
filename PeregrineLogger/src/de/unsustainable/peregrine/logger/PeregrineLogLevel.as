package de.unsustainable.peregrine.logger
{
	public class PeregrineLogLevel
	{
		//--------------------------------------------------------------------------
		//
		//  Class Properties
		//
		//--------------------------------------------------------------------------

		public static const ALL:uint	= 0;
		public static const NONE:uint	= 2048;
		
		public static const DEBUG:uint	= 2;
		public static const INFO:uint	= 4;
		public static const WARN:uint	= 8;
		public static const ERROR:uint	= 16;
		public static const FATAL:uint	= 32;
		
		public static const ALL_NAME:String		= 'all';
		public static const NONE_NAME:String	= 'none';
		
		public static const DEBUG_NAME:String	= 'debug';
		public static const INFO_NAME:String	= 'info';
		public static const WARN_NAME:String	= 'warn';
		public static const ERROR_NAME:String	= 'error';
		public static const FATAL_NAME:String	= 'fatal';
		
		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Returns the associated name to the given level id.
		 * @parameter log level id
		 */
		public static function getByID(id:int):String
		{
			switch(id)
			{
				case DEBUG:
				{
					return DEBUG_NAME;
					break;
				}
				case INFO:
				{
					return INFO_NAME;
					break;
				}
				case WARN:
				{
					return WARN_NAME;
					break;
				}
				case ERROR:
				{
					return ERROR_NAME;
					break;
				}
				case FATAL:
				{
					return FATAL_NAME;
					break;
				}	
				default:
				{
					break;
				}
			}	
			return NONE_NAME;
		}
	}
}