#!/usr/bin/env sh

# setup.sh

apt-get update
apt-get install -y nginx curl patch

patch /etc/nginx/sites-available/default < default.patch
sed -i 's/#listen   80/listen   8080/' /etc/nginx/sites-available/default
service nginx restart

# Create a html type index
cat > /usr/share/nginx/www/index.html << EOF
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
cat > /usr/share/nginx/www/index.json << EOF
{
   "title": "JSON Title"
"contents": "JSON Contents"
}
EOF

# Test for content negotiation
sh ../test.sh localhost:8080
