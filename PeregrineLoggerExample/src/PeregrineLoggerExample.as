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
package
{
	import flash.display.Sprite;
	
	import de.unsustainable.peregrine.logger.PeregrineLogLevel;
	import de.unsustainable.peregrine.logger.PeregrineLoggerFactory;
	import de.unsustainable.peregrine.logger.example.MyClass;
	import de.unsustainable.peregrine.logger.interfaces.IPeregrineLogger;
	import de.unsustainable.peregrine.logger.targets.PeregrineTraceTarget;
	
	/**
	 * PeregrineLoggerExample
	 * Author: Tilman Griesel <https://github.com/TilmanGriesel/> 
	 */
	public class PeregrineLoggerExample extends Sprite
	{
		private static const logger:IPeregrineLogger = PeregrineLoggerFactory.getLogger(PeregrineLoggerExample);
		
		public function PeregrineLoggerExample()
		{
			// setup log target
			var traceTarget:PeregrineTraceTarget = new PeregrineTraceTarget();
			traceTarget.logMemory = true;
			PeregrineLoggerFactory.addTarget(traceTarget);
			// setup log level
			PeregrineLoggerFactory.logLevel(PeregrineLogLevel.ALL);
			
			// log some messages
			logger.debug('Hello', 'Debug');
			logger.info('Hello', 'Info');
			logger.warn('Hello', 'Warn');
			logger.error('Hello', 'Error');
			logger.fatal('Hello', 'Fatal');
			
			// add some filters (only log MyClass messages)
			PeregrineLoggerFactory.filterClasses(MyClass, 'hello');
			// maybe invert the class filter (log all expect MyClass messages)
			//PeregrineLoggerFactory.invertClassFilter = true;
			
			// create some test class
			var myClass:MyClass = new MyClass();
			
			// this messages will not shown in the log because filters are on
			logger.info('Hello World');
		}
	}
}