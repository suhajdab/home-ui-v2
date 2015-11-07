<device-list>
    <light each={items} id="{id}" brightness="{brightness}"></light>

    <style scoped>
        :scope {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
    </style>

    <script>
        var tag = this;
        this.items = opts.items;

        function onMount() {
            console.log( 'mounted yo' )
        }

        this.on( 'mount', onMount );
    </script>
</device-list>
