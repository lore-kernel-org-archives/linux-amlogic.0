From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 22 Apr 2018 12:45:00 +0200
Subject: [PATCH 0/2] add the ARM PMU on Meson8 and Meson8b
Message-ID: <20180422104502.2942-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Meson8 uses Cortex-A9 cores and Meson8b uses Cortex-A5 cores. As most
Cortex-A5/A9 implementation these Amlogic SoCs also come with a
built-in PMU for counting cpu and cache events like cache misses and
hits.

Testing was done with:
# perf stat -a stress --cpu 4
(wait for ~8 seconds, then CTRL+C)
stress: info: [347] dispatching hogs: 4 cpu, 0 io, 0 vm, 0 hdd
stress: Interrupt

 Performance counter stats for 'system wide':

      33096.764000      cpu-clock (msec)          #    4.000 CPUs utilized
               587      context-switches          #    0.018 K/sec
                 6      cpu-migrations            #    0.000 K/sec
               146      page-faults               #    0.004 K/sec
       39601836695      cycles                    #    1.197 GHz
       28734941189      instructions              #    0.73  insn per cycle
        3326006882      branches                  #  100.493 M/sec
          12294901      branch-misses             #    0.37% of all branches

       8.274358000 seconds time elapsed

# grep arm-pmu /proc/interrupts 
 29:          7          0          0          0     GIC-0 169 Level     arm-pmu
 30:          0          7          0          0     GIC-0 170 Level     arm-pmu
 31:          0          0          7          0     GIC-0 185 Level     arm-pmu
 32:          0          0          0          7     GIC-0 186 Level     arm-pmu


Martin Blumenstingl (2):
  ARM: dts: meson8: add the cortex-a9-pmu compatible PMU
  ARM: dts: meson8b: add the cortex-a5-pmu compatible PMU

 arch/arm/boot/dts/meson8.dtsi  | 17 +++++++++++++----
 arch/arm/boot/dts/meson8b.dtsi | 17 +++++++++++++----
 2 files changed, 26 insertions(+), 8 deletions(-)

-- 
2.17.0
