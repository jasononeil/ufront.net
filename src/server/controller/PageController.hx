package server.controller;

import app.api.PageError;
import server.Server;

class PageController 
{
	public function new() {}

	public function doWiki( page:String ) {
		if ( page=="" ) page = "Home.md";
		var result = Server.api.pageApi.getPageContent( "wiki", page );
		switch (result) {
			case Success(html):
				Sys.println(html);
			case Failure(error):
				printError(error);
		}
	}

	public function doGuides( page:String ) {
		if ( page=="" ) page = "README.md";
		var result = Server.api.pageApi.getPageContent( "guides", page );
		switch (result) {
			case Success(html):
				Sys.println(html);
			case Failure(error):
				printError(error);
		}
	}

	public function printError( error:PageError ) {
		switch ( error ) {
			case SecurityError: 
				Sys.println("403 Error: you didn't have permission to request that page");
			case NotFound: 
				Sys.println("404 Error: that page wasn't found");
			case CannotRead: 
				Sys.println("403 Error: the requested page could not be read");
			case UnknownType: 
				Sys.println("Error: that page was a type we didn't know how to process");
			case Other: 
				Sys.println("Error: ... who knows?");
		}
	}
}