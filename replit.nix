{ pkgs }:
let
    nginxModified = pkgs.nginx.overrideAttrs (oldAttrs: rec {
        configureFlags = oldAttrs.configureFlags ++ [
            "--http-client-body-temp-path=$BASE_DIR/cache/client_body"
            "--http-proxy-temp-path=$BASE_DIR/cache/proxy"
            "--http-fastcgi-temp-path=$BASE_DIR/cache/fastcgi"
            "--http-uwsgi-temp-path=$BASE_DIR/cache/uwsgi"
            "--http-scgi-temp-path=$BASE_DIR/cache/scgi"
         ];
    });

in {
    deps = [
        nginxModified 
    pkgs.python39 
    pkgs.python39Packages.django
    pkgs.python39Packages.gunicorn 
    pkgs.python39Packages.pillow
    pkgs.python39Packages.requests
    pkgs.python39Packages.python-dotenv
    pkgs.psmisc
    pkgs.systemdMinimal
    pkgs.lsof
	];
}