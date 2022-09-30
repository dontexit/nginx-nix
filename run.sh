# start nginx

echo "STARTING.."

echo "KILLING EXISTING SERVERS"

kill  `cat gunicorn/dev.pid`
# start Python app
kill -9 $(lsof -t -i:8181)
echo "STARING GUNICORN SERVER"
BASE_DIR=/home/runner/$REPL_SLUG
PROJ_NAME=PROJECT_NAME

export BASE_DIR PROJ_NAME

gunicorn -c $BASE_DIR/$PROJ_NAME/config/gunicorn/dev.py


echo "STARING NGINX SERVER"
kill -9 $(lsof -t -i:8080)
kill `cat logs/nginx.pid`
pkil nginx
nginx -e $BASE_DIR/logs/error.log -c $BASE_DIR/nginx.conf

tail -f $BASE_DIR/logs/error.log -f $BASE_DIR/gunicorn/dev.log