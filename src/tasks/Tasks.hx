package tasks;

import ufront.tasks.TaskSet;
import haxe.web.Dispatch;
import sys.FileSystem;
import tasks.*;

class Tasks extends TaskSet
{
	@help("Do a git `clone` or `pull` to get the latest copies of our pages")
	function doGetrepos() {
		var dir = Config.app.repoDir;

		if ( !FileSystem.exists(dir) ) 
			FileSystem.createDirectory( dir ); 
			
		Sys.setCwd( dir );
		for ( repo in Config.app.repos ) {
			Sys.println( repo.name+":" );
			if ( FileSystem.exists( repo.name ) ) {
				Sys.setCwd( repo.name );
				Sys.command( "git", ["pull"] );
				Sys.setCwd( ".." );
			}
			else
				Sys.command( "git", ["clone",repo.url,repo.name] );
		}

		Sys.println( "Finished" );
	}

	static function main() {
		TaskSet.run( new Tasks(), Sys.args() );
	}
}