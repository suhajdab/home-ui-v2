<light>
    <label>{label}</label>
    <progress-circle min="0" max="100" val="{brightness}" units="%"></progress-circle>

    <style scoped>
        :scope {
            display: block;
            width: 10rem;
            margin: 0.2rem;
            padding: 0.6rem;

            background: #222;
        }
    </style>

    <script>
        var prevBrightness = 0,
                tag = this;
        this.brightness = this.opts.brightness;

        function onClick() {
            var result = 100;

            if ( prevBrightness && !tag.brightness ) {
                result = prevBrightness;
                prevBrightness = 0;
            } else if (tag.brightness > 0 ) {
                prevBrightness = tag.brightness;
                result = 0;
            }

            tag.brightness = result;
            tag.update();

            console.log( 'clicked', tag.brightness )
        }

        function onMount() {
            this.root.addEventListener( 'click', onClick );
        }

        this.on( 'mount', onMount );

        console.log(this)
    </script>
</light>
