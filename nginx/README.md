Nginx content negotiation example
=================================

tl;dr
-----

Under Ubuntu 12.04 (Precise), execute `sudo ./setup.sh` inside **this folder**.

The Nginx web server will listen on port 8080 by default.

Read More
---------

According to [Nginx Mailing List][1], [feature requesting page][2] and [Nginx issue tracker][3],
Nginx didn't have a ready-to-use content negotiation module, yet.
However we may achieve this feature by rewrite module.

To server extra JSON format files by content negotiation,
 just add following config into `/etc/nginx/sites-available/<site_name>`
 and `sudo service nginx restart`.

'''
location / {
    # ...

    # check Accept header for json, check if .json is on disk
    if ($http_accept ~* "json") { set $json T; }
    if (-f $request_filename.json) { set $json "${json}T"; }

    # if json is supported, and json is on disk, serve it!
    if ($json = TT) {
        add_header Vary Accept;
        rewrite (.*) $1.json break;
    }

    # ...
}
'''

[1]: http://forum.nginx.org/read.php?2,4475 "Nginx Mailing List - Content negotiation?"
[2]: http://wiki.nginx.org/FeatureRequests "Nginx wiki - FeatureRequests"
[3]: http://trac.nginx.org/nginx/ "Nginx issue tracker"

[4]: http://wiki.nginx.org/Configuration "Nginx wiki - Configuration"
[5]: http://wiki.nginx.org/HttpRewriteModule "Nginx wiki - HttpRewriteModule"
[6]: http://nginx.org/en/docs/http/ngx_http_rewrite_module.html "Nginx doc - ngx_http_rewrite_module"

[7]: http://www.packtpub.com/article/nginx-http-server "The NGINX HTTP Server"
[8]: http://nicknotfound.com/2009/01/12/iphone-website-with-nginx/ "Serving an iPhone website with Nginx"
[9]: http://www.thefutureoftheweb.com/blog/use-accept-language-header "Parse Accept-Language to detect a user's language"
[0]: http://www.igvita.com/2013/05/01/deploying-webp-via-accept-content-negotiation/ "Deploying WebP via Accept Content Negotiation"
