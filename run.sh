# start nginx
echo "STARING NGINX SERVER"
pkill nginx
nginx -e /home/runner/$REPL_SLUG/logs/error.log -c /home/runner/$REPL_SLUG/nginx.conf




