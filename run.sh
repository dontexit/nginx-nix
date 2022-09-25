# start nginx

echo "STARTING.."

echo "KILLING EXISTING SERVERS"

kill  `cat gunicorn/dev.pid`
# start Python app
kill -9 $(lsof -t -i:8181)
echo "STARING GUNICORN SERVER"
BASE_DIR=/home/runner/$REPL_SLUG
BASE_PROJ_DIR=$BASE_DIR/PROJECT_NAME

GUNICORN_DIR=$BASE_PROJ_DIR/config/gunicorn/dev.py #remove if not needed or change it to your config
export BASE_DIR BASE_PROJ_DIR

gunicorn -c GUNICORN_DIR


echo "STARING NGINX SERVER"
kill -9 $(lsof -t -i:8080)
kill `cat logs/nginx.pid`
pkil nginx
nginx -e $BASE_DIR/logs/error.log -c /home/runner/$REPL_SLUG/nginx.conf

tail -f -f $BASE_DIR/logs/error.log