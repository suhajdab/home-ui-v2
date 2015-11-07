<progress-circle>

    <div class="progress-circle-container"></div>

    <script>
        var tag = this,
                circle;

        this.val = opts.val;
        this.min = parseInt( opts.min ) || 0;
        this.max = parseInt( opts.max ) || 100;
        this.units = opts.units || '';

        function onMutation() {
            var val = parseFloat( tag.root.getAttribute( 'val' ) ),
                    val = (val - tag.min) / (tag.max - tag.min);

            circle.animate( val );
        }

        function onMount() {
            var el = tag.root.querySelector( 'div' );
            circle = new ProgressBar.Circle( el, {
                color: '#FCB03C',
//                fill: '#eee',
                strokeWidth: 3,
                trailWidth: 3,
                easing: 'easeOut',
                duration: 500,
                text: {
                    value: '0'
                },
                step: function ( state, bar ) {
                    var val = (bar.value() * (tag.max - tag.min) + tag.min).toFixed( 0 );
                    bar.setText( val + tag.units );
                }
            } );

            var observer = new MutationObserver( onMutation );
            observer.observe( tag.root, { attributes: true } );

            setTimeout( onMutation, 1000 );
        }

        this.on( 'mount', onMount );
        console.log( this )
    </script>

    <style scoped>
        :scope {
        }

        .progressbar-text {
            font-size: 3rem;
        }
    </style>
</progress-circle>
