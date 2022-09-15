mkdir .emacs.d &
cd .emacs.d &
export PATH="$PATH:`go env GOPATH`/bin" &
go install golang.org/x/tools/gopls@latest &
curl -OL https://raw.githubusercontent.com/RintaroNagano/config_files/main/config/init.el &
# initialize package.el, GPG key update (install auto update package), install packages
emacs --batch --eval "(require 'package)" \
  --eval "(add-to-list 'package-archives '(\"melpa\" . \"https://melpa.org/packages/\") t)" \
  --eval "(package-initialize)" \
  --eval "(package-install 'gnu-elpa-keyring-update)" \
  --eval "(package-refresh-contents)" \
  --eval "(package-install 'company)" \
  --eval "(package-install 'go-mode)" \
  --eval "(package-install 'lsp-mode)" \
  --eval "(package-install 'lsp-ui)"
    
