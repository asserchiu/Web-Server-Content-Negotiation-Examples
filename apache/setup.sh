#!/usr/bin/env sh

# setup.sh

apt-get update
apt-get install -y apache2 curl

# Enable [Apache2 Module `mod_negotiation`](http://httpd.apache.org/docs/current/mod/mod_negotiation.html).
a2enmod negotiation
service apache2 restart

# Create a html type index
cat > /var/www/index.html << EOF
<html>
  <head>
    <title>HTML Title</title>
  </head>
  <body>
    HTML Contents
  </body>
</html>
EOF

# Create a json type index
cat > /var/www/index.json << EOF
{
   "title": "JSON Title"
"contents": "JSON Contents"
}
EOF

# # To enable type map function with <filename>.var file
# cat >> /etc/apache2/httpd.conf << EOF
# AddHandler type-map .var
# EOF

# # type mapping file
# cat > /var/www/index.var << EOF
# URI: index.html
# Content-type: text/html
#
# URI: index.json
# Content-type: application/json
# EOF

# Test for content negotiation
sh ../test.sh localhost:80
