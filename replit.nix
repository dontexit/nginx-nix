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
    pkgs.python310   
    pkgs.python310Packages.django
    pkgs.python310Packages.gunicorn
    pkgs.python310Packages.pillow
    pkgs.python310Packages.requests
    pkgs.python310Packages.python-dotenv  
    pkgs.psmisc
    pkgs.systemdMinimal
    pkgs.lsof
	];
}