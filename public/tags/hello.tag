<hello>
    <h1>{ opts.greeting }
        <trim value="{ thing }" length="2"/>
        !
    </h1>

    <script>
        this.thing = "World";

        console.log( this.root );

        function randomHexColor () {
            var n = Math.random()*Math.PI,
                    m = Math.PI - n;

            return {
                c1: '#'+n.toString(16).slice(-6),
                c2: '#'+m.toString(16).slice(-6)
            };
        }

        function onClick( e ) {
            var color = randomHexColor();
            this.style.background = color.c1;
            this.style.color = color.c2;

            ws.send( 'done' );
        }

        this.on( 'mount', function () {

            this.root.querySelector( 'h1' ).addEventListener( 'click', onClick );
        } );
    </script>

    <style scoped>
        :scope {
            display: block;
            border: 1px solid #dedede;
            border-radius: 3px;
        }

        h1 {
            background: navy;
            color: white;
        }
    </style>
</hello>

<trim>
    <span>{ opts.value.substring(0, opts.length) }</span>
</trim>
