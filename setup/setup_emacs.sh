mkdir .emacs.d
cd .emacs.d
export PATH="$PATH:`go env GOPATH`/bin"
go install golang.org/x/tools/gopls@latest
curl -OL https://raw.githubusercontent.com/RintaroNagano/config_files/main/config/init.el
emacs --batch --eval "(package-refresh-contents)" \
  --eval "(package-install 'company))" \
  --eval "(package-install 'go-mode))" \
  --eval "(package-install 'lsp-mode))" \
  --eval "(package-install 'lsp-ui))"
