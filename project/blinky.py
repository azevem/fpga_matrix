from migen import *
from migen.fhdl import verilog
from migen.build.platforms import icestick


class Blinky(Module):
    def __init__(self, platform):
        self.leds = []
        for iled in range(0, 5):
            self.leds.append (platform.request("user_led"))
        counter = Signal(25)
        self.sync += counter.eq(counter + 1)
        speed = 0
        for led in self.leds:
            self.comb += led.eq(counter[24 - speed])
            speed += 1


platform = icestick.Platform()
dut = Blinky(platform)
#print(verilog.convert(dut))
platform.build(dut)


