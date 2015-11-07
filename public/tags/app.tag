<app>
    <device-list></device-list>

    <script>
        var tag = this,
            devices = [];

        opts.on( 'update', function ( data ) {
            console.log( 'update', data );
            tag.update({items: data.devices});
        } );

        this.on( 'mount', function () {
            var ws = new WebSocket( 'ws://' + location.hostname + ':' + location.port );

            function onOpen() {
            }

            function onMessage( e ) {
                var data = JSON.parse( e.data );
                if ( data.devices ) {
                    app.trigger( 'update', { devices: data.devices } );
                }
                console.log( 'onMessage', data );
            }

            function onError() {
                console.error( arguments )
            }

            ws.onopen = onOpen;
            ws.onmessage = onMessage;
            ws.onerror = onError;

        } );
    </script>
</app>
