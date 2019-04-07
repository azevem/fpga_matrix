
# Dockerfile Install
base guides
basic process
http://pramode.in/2016/10/05/fpga-programming-with-foss-tools/
litex crash guide
https://github.com/timvideos/litex-buildenv/wiki/LiteX-for-Hardware-Engineers
enjoy digital guide
https://github.com/enjoy-digital/fpga_101

docker gui
http://somatorio.org/en/post/running-gui-apps-with-docker/

source for ICE40 pcf file
https://github.com/FPGAwars/apio-examples/blob/master/icestick/template/icestick.pcf


migen installation
https://jeffrey.co.in/blog/2014/01/installing-migen/
https://github.com/m-labs/migen
migen guide:
http://blog.lambdaconcept.com/doku.php?id=migen:tutorial
http://blog.lambdaconcept.com/doku.php?id=migen:migen_platform


yosys:
http://www.clifford.at/yosys/download.html
https://github.com/YosysHQ/nextpnr
http://www.clifford.at/icestorm/

GUI apps with docker:
http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/

bind physical devices to docker containers
https://forums.unraid.net/topic/47595-how-do-i-pass-through-a-usb-device-to-a-docker-container/


RISCV cpu
https://github.com/SpinalHDL/VexRiscv


other refs
https://github.com/timvideos
https://medium.com/@luke_73359/getting-started-with-icestorm-verilog-on-the-ice40hx1k-fpga-cbc71ad3947d



# Dockerfile Usage

## Nextpnr with GUI
execute with make shell, so that the GUI can be displayed.
migen automated build generates the asc file in txt format.
nextpnr-ice40 --json blinky.json --pcf blinky.pcf --asc blinky.asc --gui



