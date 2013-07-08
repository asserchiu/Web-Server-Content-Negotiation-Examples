#!/usr/bin/env sh

# Test for content negotiation

if [ -z $1 ]; then
    host="localhost"
else
    host=$1
fi

# Request HTML document
echo == text/html ===============================================
curl --verbose --header "Accept: text/html" $host/index

# Request JSON document
echo == application/json ========================================
curl --verbose --header "Accept: application/json" $host/index
