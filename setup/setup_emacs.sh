mkdir .emacs.d
cd .emacs.d
curl -OL https://raw.githubusercontent.com/RintaroNagano/config_files/main/config/init.el
emacs --batch --eval "(package-refresh-contents)" \
  --eval "(package-install 'company))" \
  --eval "(package-install 'go-mode))" \
  --eval "(package-install 'lsp-mode))" \
  --eval "(package-install 'lsp-ui))"
