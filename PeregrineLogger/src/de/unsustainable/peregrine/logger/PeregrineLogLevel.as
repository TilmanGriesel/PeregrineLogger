/*
Copyright (c) 2013 Tilman Griesel <https://github.com/TilmanGriesel/>
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/
package de.unsustainable.peregrine.logger
{
	/**
	 * PeregrineLogLevel
	 * Author: Tilman Griesel <https://github.com/TilmanGriesel/> 
	 */
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