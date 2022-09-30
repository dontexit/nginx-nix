{ pkgs }:
let
    nginxModified = pkgs.nginx.overrideAttrs (oldAttrs: rec {
        configureFlags = oldAttrs.configureFlags ++ [
            "--http-client-body-temp-path=/home/runner/ramrobazar/cache/client_body"
            "--http-proxy-temp-path=/home/runner/ramrobazar/cache/proxy"
            "--http-fastcgi-temp-path=/home/runner/ramrobazar/cache/fastcgi"
            "--http-uwsgi-temp-path=/home/runner/ramrobazar/cache/uwsgi"
            "--http-scgi-temp-path=/home/runner/ramrobazar/cache/scgi"
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