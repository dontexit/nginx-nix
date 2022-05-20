# start nginx
mv -f replit.nix.bak replit.nix | echo "nix already configured"

echo "STARING NGINX SERVER"

pkill nginx
nginx -e /home/runner/$REPL_SLUG/logs/error.log -c /home/runner/$REPL_SLUG/nginx.conf




