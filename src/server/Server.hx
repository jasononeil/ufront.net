package server;

import app.Api;
import server.Routes;
import haxe.web.Dispatch;
import neko.Web;

class Server
{
	public static var api:Api = new Api();
	public static var routes:Routes = new Routes();

	static function main()
	{
		server.DB.connect();
		Dispatch.run( Web.getURI(), Web.getParams(), routes );
	}
}