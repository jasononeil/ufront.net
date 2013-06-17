package server;

import haxe.web.Dispatch;
import server.controller.PageController;

class Routes 
{
	public function new() {}

	public function doDefault( d:Dispatch ) {
		
		if ( d.parts[0]!="" ) {
			d.dispatch( new PageController() );
		} 
		else {
			trace("Ufront Website!");
		}
	}
}