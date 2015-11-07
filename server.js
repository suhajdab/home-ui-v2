var express = require( 'express' ),
	app = express(),
	expressWs = require( 'express-ws' )( app );

var clients = [],
	devices = [
		{
			id: "fsdaf",
			label: 'Kitchen Island',
			brightness: 44,
			power: 0
		},
		{
			id: "rthrt",
			label: 'Dining table',
			brightness: 94,
			power: 1
		},
		{
			id: "ergserg",
			label: 'Black hemisphere',
			brightness: 100,
			power: 1
		},
		{
			id: "dfgdg",
			label: 'Arabian',
			brightness: 94,
			power: 1
		}
	];

app.use( function ( req, res, next ) {
	console.log( 'middleware' );
	req.testing = 'testing';
	return next();
} );
//
//app.get('/', function(req, res, next){
//	console.log('get route', req.testing);
//	res.end();
//});

app.use( express.static( 'public' ) );

function onClientMessage() {
	send();
}

function onClientClose() {
	for ( var i = 0; client = clients[ i ]; i++ ) {
		if ( client == this ) {
			clients.splice( i, 0 );
		}
	}
}

app.ws( '/', function ( ws, req ) {
	clients.push( ws );

	ws.on( 'message', onClientMessage );
	ws.on( 'close', onClientClose );

	setTimeout( function () {
		ws.send( JSON.stringify( { devices: devices } ) );
	}, 2000 );
} );

function send() {
	var n = Math.ceil( Math.random() * 100 ) / 100;

	for ( var i = 0; client = clients[ i ]; i++ ) {
		client.send( JSON.stringify( { n: n } ) );
	}

}

app.listen( 3000 );
