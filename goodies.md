# Simple password genrator from linux

Two simple ways. One need to have openssl, but is quick to do.
Second is having special chars, but often we don't need special chars in passwords. Just length...

> openssl rand -base64 32

> < /dev/urandom tr -dc _A-Z-a-z-0-9-\!-\&-\? | head -c32

