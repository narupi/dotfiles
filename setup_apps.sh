echo "start setup"
sudo apt install -y \
    vim \
    git \
    wget \
    curl \
    python \
    python3 \
    python-pip \
    python3-pip \

git config --global user.name "narupi"
git config --global user.email "narupi1999@gmail.com"


set -u
SETUP_DIRECTORY=" $(cd $(dirname $0) && pwd)/setup"

cd ${SETUP_DIRECTORY}
for f in setup*
do
    sh ${f}
done

echo "setup complete!"
