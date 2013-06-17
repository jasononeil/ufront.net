package server;

import sys.db.Connection;

class DB
{
	public static function connect() {
		sys.db.Manager.cnx = sys.db.Mysql.connect( Config.db );
	}
}