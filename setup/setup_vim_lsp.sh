# python
pip install python-language-server --user

#java
mkdir -p ~/lsp/eclipse.jdt.ls
cd ~/lsp/eclipse.jdt.ls
curl -L https://download.eclipse.org/jdtls/milestones/0.35.0/jdt-language-server-0.35.0-201903142358.tar.gz -O
tar xf jdt-language-server-0.35.0-201903142358.tar.gz

#Rust
rustup update
rustup component add rls rust-analysis rust-src
