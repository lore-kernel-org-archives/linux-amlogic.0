From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Fri, 30 Nov 2018 00:00:42 +0100
Subject: [PATCH 0/2] ARM: dts: enable CPU frequency scaling on Meson8/Meson8b
Message-ID: <20181129230044.21358-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This series enables CPU frequency scaling on Meson8 and Meson8b. On
these SoCs all CPU cores are using the same clock, so all cores will
always run at the same frequency.

On Meson8b this is pretty straight-forward by taking the frequency and
voltage table from Amlogic's 3.10 vendor kernel and converting it to
"operating-points-v2".

Meson8 (which is inherited by Meson8m2) is not so straight forward:
The 3.10 vendor kernel contains two frequency and voltage tables with
different voltages for the same frequency. It turns out that this is
due to the design of a specific reference board where the output
voltage of the regulator is limited. This has nothing to do with the
recommended voltages of the chip so this adds the "operating-points-v2"
which are used by all boards in the vendor kernel except the special
case.
The two fastest (clock rates: 1.8GHz and 1.992GHz) operating points are
causing my Meson8m2 "M8S" (not upstream yet) board to lock up hard with
instruction errors. I'm not sure if this is due to the poor design of
the PCB (the LED is getting darker when I switch to 1.8GHz and soon
after that it will crash). Thus I decided to play safe and disabled
these two frequencies for now.

Special thanks to Jianxin from Amlogic who patiently replied to all of
my questions about the CPU clocks (without his hints I would still be
looking at why I'm seeing random lockups when running the CPU off
cpu_in_div3 or why the udelay is not working properly)!

This is successfully tested on:
- Meson8b: Odroid-C1 and EC-100
- Meson8m2: MXIII-Plus and my "M8S" board (the latter is not upstream
  yet) with frequencies up to 1.608GHz

Dependencies of this series:
- these patches are based on my other series: [0] "32-bit Meson: add
  the ARM TWD and Global Timers"
- when not running linux-next this requires the the clock driver
  patches which are queued for v4.21: [1] "[GIT PULL] clk: meson:
  updates for v4.21"
- when not running linux-next there is a runtime dependency on the
  meson6_timer from [2] "clocksource/meson6_timer: implement ARM
  delay timer" because changing the CPU clock requires a small udelay
  which only works properly when using a timer as clocksource (instead
  of running a jiffies based delay loop where the timing changes with
  the CPU frequency)


[0] https://patchwork.kernel.org/cover/10696327/
[1] http://lists.infradead.org/pipermail/linux-amlogic/2018-November/009137.html
[2] https://patchwork.kernel.org/cover/10685241/


Martin Blumenstingl (2):
  ARM: dts: meson: meson8: add the CPU OPP table
  ARM: dts: meson: meson8b: add the CPU OPP tables

 arch/arm/boot/dts/meson8.dtsi  | 72 ++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/meson8b.dtsi | 66 +++++++++++++++++++++++++++++++
 2 files changed, 138 insertions(+)

-- 
2.19.2
