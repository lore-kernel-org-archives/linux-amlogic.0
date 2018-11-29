From: khilman@baylibre.com (Kevin Hilman)
Date: Thu, 29 Nov 2018 12:49:24 -0800
Subject: [GIT PULL] ARM: dts: Amlogic updates for v4.21
Message-ID: <7hr2f38v8r.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt

for you to fetch changes up to 7b141abe4aa137f362d7324de5a49fd3105f570f:

  ARM: dts: meson: add the clock inputs for the Meson timer (2018-11-28 16:49:03 -0800)

----------------------------------------------------------------
Amlogic 32-bit DT updates for v4.21
- support more timers on meson8
- add the stdout-path property on several boards

----------------------------------------------------------------
Jerome Brunet (1):
      ARM: dts: meson: consistently disable pin bias

Martin Blumenstingl (7):
      dt-bindings: timer: meson6_timer: document all interrupts
      dt-bindings: timer: meson6_timer: document the clock inputs
      ARM: dts: meson6: atv1200: add the /chosen/stdout-path property
      ARM: dts: meson8: minix-neo-x8: add the /chosen/stdout-path property
      ARM: dts: meson8b: mxq: add the /chosen/stdout-path property
      ARM: dts: meson: add the TIMER B/C/D interrupts
      ARM: dts: meson: add the clock inputs for the Meson timer

 Documentation/devicetree/bindings/timer/amlogic,meson6-timer.txt | 11 +++++++++--
 arch/arm/boot/dts/meson.dtsi                                     |  7 +++++--
 arch/arm/boot/dts/meson6-atv1200.dts                             |  4 ++++
 arch/arm/boot/dts/meson6.dtsi                                    |  5 +++++
 arch/arm/boot/dts/meson8-minix-neo-x8.dts                        |  4 ++++
 arch/arm/boot/dts/meson8.dtsi                                    | 17 +++++++++++++++++
 arch/arm/boot/dts/meson8b-mxq.dts                                |  4 ++++
 arch/arm/boot/dts/meson8b.dtsi                                   | 14 ++++++++++++++
 arch/arm/boot/dts/meson8m2.dtsi                                  |  1 +
 9 files changed, 63 insertions(+), 4 deletions(-)
