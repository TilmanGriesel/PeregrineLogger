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
package de.unsustainable.peregrine.logger.interfaces
{
	import de.unsustainable.peregrine.logger.PeregrineLogItem;

	/**
	 * IPeregrineLogTarget
	 * Author: Tilman Griesel <https://github.com/TilmanGriesel/> 
	 */
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