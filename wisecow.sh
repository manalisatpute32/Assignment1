#!/usr/bin/env bash

SRVPORT=4499

prerequisites() {
    true
}

main() {
    prerequisites
    echo "Wisdom served on port=$SRVPORT..."

    while true; do
        # Generate response on the fly and feed into nc
        { 
            echo -e "HTTP/1.1 200 OK\r\nContent-Type: text/html\r\n\r\n"
            echo "<pre>"
            fortune | cowsay
            echo "</pre>"
        } | nc -l -p $SRVPORT -q 1
    done
}

main
