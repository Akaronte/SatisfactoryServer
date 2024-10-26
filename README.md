Docker compose and docker image for execute Satisfactory Server base centos 7.5
- Install docker and docker-compose

```
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl status docker
sudo systemctl enable docker
```
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
```
Clone the repo for get docker-compose and docker image
```
git clone https://github.com/Akaronte/SatisfactoryServer.git
```

Create a volume mount dir and change permision to user 1000
```
cd SatisfactoryServer
mkdir SATISFACTORY
chown 1000:1000 SATISFACTORY
docker-compose up -d
```
Start docker-compose the first time install Satisfactory Dedicate Server in the mount volume
```
docker-compose up -d
```

Enjoy

docker run --rm --name sfserver -ti -u root sfserver bash

apt install steamcmd -y


sudo apt-get install lib32gcc-s1 -y

curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

./steamcmd.sh +force_install_dir /home/steam/squad-dedicated +login anonymous +app_update 403240 +quit