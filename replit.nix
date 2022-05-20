#replace your replit.nix file by changing REPL_NAME to your own repl name

{ pkgs }: 
let

    nginxModified = pkgs.nginx.overrideAttrs (oldAttrs: rec {
        configureFlags = oldAttrs.configureFlags ++ [
	#replace REPL_NAME with your own REPL_NAME / base dir your app is located on
            "--http-client-body-temp-path=/home/runner/REPL_NAME/cache/client_body"
            "--http-proxy-temp-path=/home/runner/REPL_NAME/cache/proxy"
            "--http-fastcgi-temp-path=/home/REPL_NAME/nix-template/cache/fastcgi"
            "--http-uwsgi-temp-path=/home/REPL_NAME/nix-template/cache/uwsgi"
            "--http-scgi-temp-path=/home/REPL_NAME/nix-template/cache/scgi"
         ];
    });

in {
	deps = [
		nginxModified
	];

}