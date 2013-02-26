PeregrineLogger
===============

Simple, Small and Robust AS3 Logging Framework

## Features
* Extendible
* Lightweight & Fast
* Memory Efficent
* Filter Functions
* Different Log Levels
* Memory logging

## Sample output
Memory logging disabled:

    [0ms] [debug] [PeregrineLoggerExample] Hello Debug

Memory logging enabled:

    [26.48mb] [0ms] [debug] [PeregrineLoggerExample] Hello Debug

## Usage
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
		}

## Filter Functions
PeregrineLogger supports class name based filtering.
That means, that log messages can be filtered by full qualified class names (fqcn) or Classes itself.

To enable the filter, simply type ```PeregrineLoggerFactory.filterClasses(MyClass, AnotherClass);```
or ```PeregrineLoggerFactory.filterClasses('com.pack.example::MyClass');```
or together... it's up to you.

Another function of the filter system is, that you are able to invert the filter.
To exclude all classes defined in filterClasses() from logging,
type  ```PeregrineLoggerFactory.invertClassFilter = true```

## How to extend
Nothing is simple as that. Create a Class with an ```IPeregrineLogTarget``` implementation.

Add the API:
* ```public function log(item:PeregrineLogItem, tp:Number):void```
* ```public function get logMemory():Boolean```
* ```public function set logMemory(value:Boolean):void```

Add your Class as a log target with the ```PeregrineLoggerFactory.addTarget``` method.
Now you are able to access all incoming log data trough the ```PeregrineLogItem```.
The API provides you an timestamp as number, the log level as uint, the full qualified class name as string and finally the log message as string.

## Limitations
At the moment this things are not possible:
* Define your own log format
* More then trace log targets (if you dont wanna write your own)
