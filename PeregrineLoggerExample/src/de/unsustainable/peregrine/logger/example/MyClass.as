package de.unsustainable.peregrine.logger.example
{
	import de.unsustainable.peregrine.logger.PeregrineLoggerFactory;
	import de.unsustainable.peregrine.logger.interfaces.IPeregrineLogger;

	public class MyClass
	{
		private static const logger:IPeregrineLogger = PeregrineLoggerFactory.getLogger(MyClass);
		
		public function MyClass()
		{
			logger.info('Hello, this is me...');
		}
	}
}