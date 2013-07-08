Apache content negotiation example
==================================

tl;dr
-----

Under Ubuntu 12.04 (Precise), execute `sudo ./setup.sh` inside **this folder**.

The Apache web server will listen on port 80 by default.

Read More
---------

Turn on [Apache2 Module `mod_negotiation`][0] by `sudo a2enmod mod_negotiation` and you're done!

You can also enable the type map function so you can make more configurations inside <filename>.var file:

'''
cat >> /etc/apache2/httpd.conf << EOF
AddHandler type-map .var
EOF
'''

Sample type mapping file:

'''
cat > /var/www/index.var << EOF
URI: index.html
Content-type: text/html

URI: index.json
Content-type: application/json
EOF
'''

[0]: http://httpd.apache.org/docs/current/mod/mod_negotiation.html "Apache Module `mod_negotiation`"
