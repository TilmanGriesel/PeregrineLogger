package
{
	import flash.display.Sprite;
	
	import de.unsustainable.peregrine.logger.PeregrineLogLevel;
	import de.unsustainable.peregrine.logger.PeregrineLoggerFactory;
	import de.unsustainable.peregrine.logger.example.MyClass;
	import de.unsustainable.peregrine.logger.interfaces.IPeregrineLogger;
	import de.unsustainable.peregrine.logger.targets.PeregrineTraceTarget;
	
	public class PeregrineLoggerExample extends Sprite
	{
		private static const logger:IPeregrineLogger = PeregrineLoggerFactory.getLogger(PeregrineLoggerExample);
		
		public function PeregrineLoggerExample()
		{
			// setup log target
			var traceTarget:PeregrineTraceTarget = new PeregrineTraceTarget();
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