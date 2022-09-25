
# start nginx
mv -f replit.nix.bak replit.nix | echo "nix already configured"

echo "STARING NGINX SERVER"

pkill nginx
BASE_DIR=/home/runner/$REPL_SLUG
export BASE_DIR
nginx -e $BASE_DIR/logs/error.log -c /home/runner/$REPL_SLUG/nginx.conf
