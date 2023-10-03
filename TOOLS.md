# Tool Configuration Notes

## Build Server Setup

The build server is an instance in the Amazon EC2 cloud. It's running Ubuntu Linux.
Originally, the site was being served from [lighttpd] but now it's using [Apache]. This
makes setting up just that much easier when Amazon says we have to replace the instance or
we need to upgrade it or whatever.

We are using certbot and letsencrypt to provide SSL. certbot understands Apache, which means we don't have to do as much with it as we did with lighttpd.

The build server has an actual domain name: musictools.siliconvalleypipeband.com

There's also a dedicated email address for the build system (so when tools want to send an email to the webmaster, it will reach someone): musictools@siliconvalleypipeband.com

The web directory is at /var/www and the build stuff (scripts, local repositories, Box sync) is all in /var/zuleika

The webhook that GitHub calls is installed at /usr/lib/cgi-bin since that's where Apache wants CGI scripts to be.

At some point late in 2023, a whole bunch of Perl dependencies disappeared. This meant that I had to fire up `cpan` and reinstall some stuff:

 - Data::UUID
 - LWP
 - PDF::API2
 - LWP::Protocol::https



[lighttpd]: https://www.lighttpd.net
[Apache]: https://httpd.apache.org
