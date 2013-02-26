package de.unsustainable.peregrine.logger
{
	public final class PeregrineLogItem
	{
		public var time:Number;
		public var level:int;
		public var fqcn:String;
		public var message:String;
		
		function PeregrineLogItem(t:Number, l:int, f:String, m:String)
		{
			time = t;
			level = l;
			fqcn = f;
			message = m;
		}
		
		public function dispose():void
		{
			fqcn = null;
			message = null;
			time = NaN;
		}
	}
}