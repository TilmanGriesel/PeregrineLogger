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
package de.unsustainable.peregrine.logger.targets
{
	import flash.system.System;
	
	import de.unsustainable.peregrine.logger.PeregrineLogItem;
	import de.unsustainable.peregrine.logger.PeregrineLogLevel;
	import de.unsustainable.peregrine.logger.interfaces.IPeregrineLogTarget;

	/**
	 * PeregrineTraceTarget
	 * Author: Tilman Griesel <https://github.com/TilmanGriesel/> 
	 */
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