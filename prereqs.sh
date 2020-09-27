#!/bin/bash

# Create folder for the tools
mkdir ./tools

# Install tool dependencies
sudo apt-get --assume-yes install make wget curl tar

# Get DNS-Discovery
git -C ./tools clone https://github.com/m0nad/DNS-Discovery.git dns-discovery

# Build DNS-Discovery
cd ./dns-discovery
make
cd ../

# Install Golang
arch=$(uname -r | cut -d "-" -f 3)
wget -P /tmp https://golang.org/dl/go1.15.2.linux-$arch.tar.gz
tar -C /usr/local -xzf /tmp/go1.15.2.linux-$arch.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.bashrc
mkdir /usr/lib/go
echo 'export GOROOT=/usr/lib/go' >>
mkdir $HOME/go
echo "export GOPATH=$HOME/go" >> $HOME/.bashrc
echo "export PATH=$GOPATH/bin:$GOROOT/bin:$PATH" >> $HOME/.bashrc
source ~/.bashrc

# Install assetfinder
go get -u github.com/tomnomnom/assetfinder

# Install meg
go get -u github.com/tomnomnom/meg

# Install gf
go get -u github.com/tomnomnom/gf

# Enable gf auto-completion
echo "source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash" >> $HOME/.bashrc

# Move gf pattern files
cp -r $GOPATH/src/github.com/tomnomnom/gf/examples $HOME/.gf

# Install github-search
git -C ./tools clone https://github.com/gwen001/github-search.git
touch ./tools/github-search/.tokens
pip install -r ./tools/github-search/requirements2.txt
pip install -r ./tools/github-search/requirements3.txt
echo 'Place your GitHub token in ./tools/github-search/.tokens'

# Install nuclei
git -C ./tools clone https://github.com/projectdiscovery/nuclei.git; cd tools/nuclei/v2/cmd/nuclei/; go build; mv nuclei /usr/local/bin/
cd ../../../../../
nuclei -update-templates

#Installing chaos
GO111MODULE=on go get -u github.com/projectdiscovery/chaos-client/cmd/chaos
echo 'export CHAOS_KEY=""' >> $HOME/.bashrc
source $HOME/.bashrc
echo 'In order to use chaos be sure to add your chaos API key to CHAOS_KEY in your .bashrc -- don\'t forget to source .bashrc!'

# Install LiveTargetsFinder
git -C ./tools clone https://github.com/allyomalley/LiveTargetsFinder.git livetargetsfinder
pip3 install -r ./tools/livetargetsfinder/requirements.txt

