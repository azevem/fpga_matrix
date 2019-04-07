FROM ubuntu:18.04

RUN apt-get update && \
	apt-get upgrade -qq

ENV TZ=Europe/Brussels
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir -p "/tools" "/app"
WORKDIR "/tools"

RUN	apt-get install -qq --fix-missing \
		git vim curl wget \
		build-essential \
		gcc g++ cmake \
		clang

RUN	apt-get install -qq \
		python3 python3-setuptools python3-dev python3-pip \
		python3-tk python3-lxml python3-six \
		qt5-default

RUN	apt-get install -qq \
		libboost-python-dev \
		libboost1.65-dev \
		libboost-dev \
		libboost-all-dev \
		libboost-filesystem-dev \
		libboost-thread-dev \
		libboost-program-options-dev

RUN apt-get install -qq \
		libftdi-dev \
		tcl8.6-dev \
		tcl-dev \
		tcllib \
		libreadline-dev \
		flex \
		gawk \
		libffi-dev \
		bison \
		libeigen3-dev

# install migen
RUN git clone https://github.com/m-labs/migen "/tools/migen"
ENV PYTHONPATH="/tools/migen"

RUN apt-get install -qq \
		libboost1.65-all-dev

# install icestorm (icepack, icebox, iceprog, icetime, chip databases)
RUN git clone https://github.com/cliffordwolf/icestorm.git "/tools/icestorm"
WORKDIR "/tools/icestorm"
RUN make -j$(nproc)
RUN make install

# install next pnr (placeNroute)
RUN git clone https://github.com/YosysHQ/nextpnr "/tools/nextpnr"
WORKDIR "/tools/nextpnr"
RUN cmake -DARCH=ice40 -DCMAKE_INSTALL_PREFIX=/usr/local .
RUN make -j$(nproc)
RUN make install

# install yosys (verilog synthesis)
RUN git clone https://github.com/cliffordwolf/yosys.git "/tools/yosys"
WORKDIR "/tools/yosys"
RUN make -j$(nproc)
RUN make install

# # install eric PYTHON ide
# RUN apt-get instal -qq \
# 	python3-disutils \
# 	python3-pyqt5

# RUN mkdir "/tools/eric_ide/"
# WORKDIR "/tools/eric_ide/"
# RUN curl -L https://sourceforge.net/projects/eric-ide/files/eric6/stable/19.03/eric6-19.03.tar.gz --output 

CMD ["/bin/bash"]
